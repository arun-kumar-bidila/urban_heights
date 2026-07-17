import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/core/global_loader.dart';
import 'package:apartment_app/core/utils.dart';
import 'package:apartment_app/features/announcements/domain/entity/announcement_entity.dart';
import 'package:apartment_app/features/announcements/domain/use_case/delete_announcement_use_case.dart';
import 'package:apartment_app/features/announcements/domain/use_case/update_announcement_use_case.dart';
import 'package:apartment_app/features/announcements/presentation/bloc/delete_announcement/delete_announcement_bloc.dart';
import 'package:apartment_app/features/announcements/presentation/bloc/fetch_announcements/fetch_announcements_bloc.dart';
import 'package:apartment_app/features/announcements/presentation/bloc/update_announcement/update_announcement_bloc.dart';
import 'package:apartment_app/features/common/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

enum MoreOption { pinned, delete }

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  MoreOption? option;

  @override
  void initState() {
    super.initState();
    context.read<FetchAnnouncementsBloc>().add(FetchAnnouncements());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notices",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.stealBlue,
          ),
        ),
      ),
      drawer: CustomNavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MultiBlocListener(
          listeners: [
            BlocListener<DeleteAnnouncementBloc, DeleteAnnouncementState>(
              listener: (context, state) {
                if (state is DeleteAnnouncementLoading) {
                  GlobalLoader.show();
                } else if (state is DeleteAnnouncementFailure) {
                  if (GlobalLoader.isShowing) {
                    GlobalLoader.hide();
                  }
                  // TODO IMPLEMENT FAILURE
                } else if (state is DeleteAnnouncementSuccess) {
                  if (GlobalLoader.isShowing) {
                    GlobalLoader.hide();
                  }
                  context.read<FetchAnnouncementsBloc>().add(
                    FetchAnnouncements(),
                  );
                }
              },
            ),
            BlocListener<UpdateAnnouncementBloc, UpdateAnnouncementState>(
              listener: (context, state) {
                if (state is UpdateAnnouncementLoading) {
                  GlobalLoader.show();
                } else if (state is UpdateAnnouncementFailure) {
                  if (GlobalLoader.isShowing) {
                    GlobalLoader.hide();
                  }
                  // TODO IMPLEMENT FAILURE
                } else if (state is UpdateAnnouncementSuccess) {
                  if (GlobalLoader.isShowing) {
                    GlobalLoader.hide();
                  }
                  context.read<FetchAnnouncementsBloc>().add(
                    FetchAnnouncements(),
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<FetchAnnouncementsBloc, FetchAnnouncementsState>(
            builder: (context, state) {
              if (state is FetchAnnouncementsLoading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.stealBlue),
                );
              } else if (state is FetchAnnouncementsFailure) {
                // TODO IMPLEMENT FAILURE
                return SizedBox.shrink();
              } else if (state is FetchAnnouncementsSuccess) {
                final announcements = state.announcements;

                List<AnnouncementEntity> pinnedAnnouncements = announcements
                    .where((e) => e.pinned == true)
                    .toList();
                List<AnnouncementEntity> unPinnedAnnouncements = announcements
                    .where((e) => e.pinned == false)
                    .toList();

                return Column(
                  children: [
                    (pinnedAnnouncements.isNotEmpty)
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: pinnedAnnouncements.length,
                            itemBuilder: (context, index) {
                              final announcement = pinnedAnnouncements[index];
                              return Container(
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    width: 0.7,
                                    color: AppColors.lightBlue,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.push_pin,
                                                  size: 12,
                                                  color: AppColors.lightBlue,
                                                ),
                                                SizedBox(width: 2),
                                                Text(
                                                  "Pinned",

                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.lightBlue,
                                                  ),
                                                ),
                                                SizedBox(width: 6),
                                                Text(
                                                  formattedDate(
                                                    announcement.datePosted,
                                                  ),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              announcement.title,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.mediumBlue,
                                              ),
                                            ),
                                          ],
                                        ),
                                        PopupMenuButton<MoreOption>(
                                          icon: Icon(
                                            Icons.more_vert_rounded,
                                            color: AppColors.black,
                                          ),
                                          onSelected: (option) {
                                            if (option == MoreOption.delete) {
                                              context.read<DeleteAnnouncementBloc>().add(
                                                DeleteAnnouncement(
                                                  deleteAnnouncementUseCaseParams:
                                                      DeleteAnnouncementUseCaseParams(
                                                        announcementId:
                                                            announcement
                                                                .announcementId,
                                                      ),
                                                ),
                                              );
                                            } else if (option ==
                                                MoreOption.pinned) {
                                              context
                                                  .read<
                                                    UpdateAnnouncementBloc
                                                  >()
                                                  .add(
                                                    UpdateAnnouncement(
                                                      params: UpdateAnnouncementUseCaseParams(
                                                        announcementId:
                                                            announcement
                                                                .announcementId,
                                                        pinned: !announcement
                                                            .pinned,
                                                      ),
                                                    ),
                                                  );
                                            }
                                          },
                                          color: AppColors.white,

                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  16,
                                                ),
                                          ),
                                          elevation: 2,
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: MoreOption.pinned,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.push_pin_outlined,
                                                    size: 20,
                                                    color: AppColors.lightBlue,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    (announcement.pinned)
                                                        ? "Unpin"
                                                        : "Pin",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: MoreOption.delete,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.close,
                                                    size: 20,
                                                    color: AppColors.red,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      announcement.description,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : SizedBox.shrink(),

                    (unPinnedAnnouncements.isNotEmpty)
                        ? ListView.builder(
                            itemCount: unPinnedAnnouncements.length,
                            physics: NeverScrollableScrollPhysics(),
                            padding: .zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final announcement = unPinnedAnnouncements[index];
                              return Container(
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    width: 0.7,
                                    color: AppColors.mediumBlue,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              formattedDate(
                                                announcement.datePosted,
                                              ),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.grey,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              announcement.title,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.mediumBlue,
                                              ),
                                            ),
                                          ],
                                        ),
                                        PopupMenuButton<MoreOption>(
                                          icon: Icon(
                                            Icons.more_vert_rounded,
                                            color: AppColors.black,
                                          ),
                                          onSelected: (option) {
                                            if (option == MoreOption.delete) {
                                              context.read<DeleteAnnouncementBloc>().add(
                                                DeleteAnnouncement(
                                                  deleteAnnouncementUseCaseParams:
                                                      DeleteAnnouncementUseCaseParams(
                                                        announcementId:
                                                            announcement
                                                                .announcementId,
                                                      ),
                                                ),
                                              );
                                            } else if (option ==
                                                MoreOption.pinned) {
                                              context
                                                  .read<
                                                    UpdateAnnouncementBloc
                                                  >()
                                                  .add(
                                                    UpdateAnnouncement(
                                                      params: UpdateAnnouncementUseCaseParams(
                                                        announcementId:
                                                            announcement
                                                                .announcementId,
                                                        pinned: !announcement
                                                            .pinned,
                                                      ),
                                                    ),
                                                  );
                                            }
                                          },
                                          color: AppColors.white,

                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  16,
                                                ),
                                          ),
                                          elevation: 2,
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: MoreOption.pinned,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.push_pin_outlined,
                                                    size: 20,
                                                    color: AppColors.lightBlue,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    (announcement.pinned)
                                                        ? "Unpin"
                                                        : "Pin",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: MoreOption.delete,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.close,
                                                    size: 20,
                                                    color: AppColors.red,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      announcement.description,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : SizedBox.shrink(),
                  ],
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
