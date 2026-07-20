import 'package:apartment_app/config/theme/app_colors.dart';

import 'package:apartment_app/core/utils.dart';
import 'package:apartment_app/features/common/navigation_drawer.dart';
import 'package:apartment_app/features/complaints/presentation/bloc/fetch_complaint/fetch_complaint_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  List<String> complaintType = ["all", "open", "progress", "resolved"];
  String selectedType = "all";
  bool isSelected(String type) {
    return selectedType == type;
  }

  @override
  void initState() {
    super.initState();
    context.read<FetchComplaintBloc>().add(FetchComplaint());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Complaints",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.stealBlue,
          ),
        ),
      ),
      drawer: CustomNavigationDrawer(),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final type = complaintType[index];
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedType = type;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.7, color: AppColors.grey),
                          borderRadius: BorderRadius.circular(16),
                          color: isSelected(type)
                              ? AppColors.stealBlue
                              : AppColors.white,
                        ),
                        child: Text(
                          "${type.toUpperCase()} • 6",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: isSelected(type)
                                ? AppColors.white
                                : AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<FetchComplaintBloc, FetchComplaintState>(
                builder: (context, state) {
                  if (state is FetchComplaintLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.stealBlue,
                      ),
                    );
                  } else if (state is FetchComplaintFailure) {
                    // Implement Failure widget
                    return SizedBox.shrink();
                  } else if (state is FetchComplaintSuccess) {
                    final complaints = state.complaints;
                    return ListView.builder(
                      itemCount: complaints.length,
                      itemBuilder: (context, index) {
                        final complaint = complaints[index];
                        return Container(
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(
                              width: 0.7,
                              color: AppColors.grey,
                            ),
                            borderRadius: BorderRadius.circular(16),
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
                                      Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: AppColors.mediumBlue,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        complaint.title.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.mediumBlue,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        complaint.roomNumber.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                    color: AppColors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              Text(
                                complaint.description,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: AppColors.paleRed,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.warning_amber_outlined,
                                          size: 12,
                                          color: AppColors.red,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          complaint.status,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    formattedDate(complaint.createdAt),
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
                                "Tenant: ${complaint.tenantName} • +91 ${complaint.tenantMobile}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
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
            ),
          ],
        ),
      ),
    );
  }
}
