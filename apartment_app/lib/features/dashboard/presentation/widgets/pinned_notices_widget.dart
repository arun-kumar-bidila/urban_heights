import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/core/global_loader.dart';
import 'package:apartment_app/core/utils.dart';
import 'package:apartment_app/features/announcements/domain/entity/announcement_entity.dart';
import 'package:apartment_app/features/announcements/presentation/bloc/delete_announcement/delete_announcement_bloc.dart';
import 'package:apartment_app/features/announcements/presentation/bloc/fetch_announcements/fetch_announcements_bloc.dart';
import 'package:apartment_app/features/announcements/presentation/bloc/update_announcement/update_announcement_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinnedNoticesWidget extends StatefulWidget {
  const PinnedNoticesWidget({super.key});

  @override
  State<PinnedNoticesWidget> createState() => _PinnedNoticesWidgetState();
}

class _PinnedNoticesWidgetState extends State<PinnedNoticesWidget> {
  @override
  void initState() {
    super.initState();
    context.read<FetchAnnouncementsBloc>().add(FetchAnnouncements());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
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
              context.read<FetchAnnouncementsBloc>().add(FetchAnnouncements());
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
              context.read<FetchAnnouncementsBloc>().add(FetchAnnouncements());
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

            return (pinnedAnnouncements.isNotEmpty)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "PINNED NOTICES",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.stealBlue,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: .zero,
                        itemCount: pinnedAnnouncements.length,
                        itemBuilder: (context, index) {
                          final announcement = pinnedAnnouncements[index];
                          return Container(
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Color(0xFFf0f9ff),
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.lightBlue,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.push_pin,
                                          size: 15,
                                          color: AppColors.lightBlue,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          formattedDate(
                                            announcement.datePosted,
                                          ),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.lightBlue,
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
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  announcement.description,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  )
                : SizedBox.shrink();
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
