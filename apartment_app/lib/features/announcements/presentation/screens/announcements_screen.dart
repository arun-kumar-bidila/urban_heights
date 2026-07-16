import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/core/utils.dart';
import 'package:apartment_app/features/announcements/presentation/bloc/fetch_announcements/fetch_announcements_bloc.dart';
import 'package:apartment_app/features/common/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  SampleItem? selectedItem;

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
        child: BlocBuilder<FetchAnnouncementsBloc, FetchAnnouncementsState>(
          builder: (context, state) {
            if (state is FetchAnnouncementsLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.stealBlue),
              );
            } else if (state is FetchAnnouncementsFailure) {
              return SizedBox.shrink();
            } else if (state is FetchAnnouncementsSuccess) {
              final announcements = state.announcements;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: announcements.length,
                      itemBuilder: (context, index) {
                        final announcement = announcements[index];
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
                                        formattedDate(announcement.datePosted),
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
                                  PopupMenuButton<SampleItem>(
                                    icon: Icon(
                                      Icons.more_vert_rounded,
                                      color: AppColors.black,
                                    ),
                                    onSelected: (item) {
                                      // Handle menu selection
                                    },
                                    color: AppColors.white,

                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(16),
                                    ),
                                    elevation: 2,
                                    itemBuilder: (context) => const [
                                      PopupMenuItem(
                                        value: SampleItem.itemOne,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.push_pin_outlined,
                                              size: 20,
                                              color: AppColors.lightBlue,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "Pin",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: SampleItem.itemTwo,
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
                                                fontWeight: FontWeight.w600,
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
                    ),
                  ),
                ],
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
