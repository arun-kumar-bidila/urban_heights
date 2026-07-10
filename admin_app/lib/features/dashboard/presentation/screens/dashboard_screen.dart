import 'package:admin_app/config/theme/app_colors.dart';
import 'package:admin_app/features/apartment/domain/entity/apartment_entity.dart';
import 'package:admin_app/features/apartment/presentation/bloc/fetch_all_apartments/fetch_all_apartments_bloc.dart';
import 'package:admin_app/features/common/navigation_drawer.dart';
import 'package:admin_app/features/dashboard/presentation/bloc/dashboard_summary/dashboard_summary_bloc.dart';
import 'package:admin_app/features/dashboard/presentation/widgets/dashboard_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardSummaryBloc>().add(DashboardSummary());
    context.read<FetchAllApartmentsBloc>().add(FetchAllApartments());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomNavigationDrawer(),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<DashboardSummaryBloc, DashboardSummaryState>(
                      builder: (context, state) {
                        if (state is DashboardSummaryLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.stealBlue,
                            ),
                          );
                        } else if (state is DashboardSummaryFailure) {
                          return SizedBox.shrink();
                        } else if (state is DashboardSummarySuccess) {
                          return Column(
                            children: [
                              SizedBox(height: 16),

                              DashboardFeature(
                                icon: Icons.person,
                                iconColor: AppColors.white,
                                labelText: "Total Owners",
                                iconBg: AppColors.lightGreen,
                                valueText: state.summaryEntity.totalOwners
                                    .toString(),
                              ),
                              SizedBox(height: 16),
                              DashboardFeature(
                                icon: Icons.home,
                                iconColor: AppColors.white,
                                labelText: "Total Apartments",
                                iconBg: AppColors.stealBlue,
                                valueText: state.summaryEntity.totalApartments
                                    .toString(),
                              ),
                            ],
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    SizedBox(height: 30),
                    Text(
                      "APARTMENTS",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.stealBlue,
                      ),
                    ),
                    SizedBox(height: 16),
                    BlocBuilder<
                      FetchAllApartmentsBloc,
                      FetchAllApartmentsState
                    >(
                      builder: (context, state) {
                        if (state is FetchAllApartmentsLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.stealBlue,
                            ),
                          );
                        } else if (state is FetchAllApartmentsFailure) {
                          return SizedBox.shrink();
                        } else if (state is FetchAllApartmentsSuccess) {
                          List<ApartmentEntity> allApartments =
                              state.allApartments;
                          return ListView.builder(
                            itemCount: allApartments.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final apartment = allApartments[index];
                              return Container(
                                margin: EdgeInsets.only(bottom: 16),
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),

                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black,
                                      blurRadius: 1.5,
                                      spreadRadius: -1,
                                    ),
                                  ],
                                  color: AppColors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: .start,

                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Color(
                                                0xFFf0f9ff,
                                              ),
                                              child: Text(
                                                "${apartment.apartmentName[0].toUpperCase()}A",
                                                style: TextStyle(
                                                  color: AppColors.stealBlue,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  apartment.apartmentName
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.emerald,
                                                  ),
                                                ),
                                                SizedBox(height: 6),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      size: 14,
                                                      color: AppColors.grey,
                                                    ),
                                                    SizedBox(width: 2),
                                                    Text(
                                                      apartment.address
                                                          .split(' ')
                                                          .map((word) {
                                                            return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
                                                          })
                                                          .join(' '),
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 20,
                                          color: AppColors.stealBlue,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Card(
                                          elevation: 0,
                                          color: AppColors.stealBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  16,
                                                ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "owner",
                                              style: TextStyle(
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          apartment.ownerName
                                              .split(" ")
                                              .map((word) {
                                                return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
                                              })
                                              .join(" "),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        Text(
                                          " • ${apartment.ownerMobile}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
