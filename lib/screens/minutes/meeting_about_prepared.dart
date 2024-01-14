import 'package:churchgroupsmanagement/data/sample_attendance.dart';
import 'package:churchgroupsmanagement/screens/minutes/publish_meeting_minutes.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreparedMeetingAboutInfo extends StatelessWidget {
  const PreparedMeetingAboutInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 15),
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(70, 204, 204, 204),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/location.png",
                        color: Colors.black54,
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Kahawa Farmers Church Boardroom",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/calendar.png",
                        color: Colors.black54,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Sun, 4th Nov 2023 From 4pm",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/people.png",
                        color: Colors.black54,
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${meetingAttendanceList.where((element) => element["attendance"] == "Present").length} Present, ${meetingAttendanceList.where((element) => element["attendance"] == "Absent With Apology").length + meetingAttendanceList.where((element) => element["attendance"] == "Absent Without Apology").length} Absent",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Text(
                "Meeting Approval Status".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            // Center(
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
            //         child: Image.asset(
            //           "assets/images/sign.png",
            //           fit: BoxFit.contain,
            //           color: const Color.fromARGB(255, 124, 121, 121),
            //           width: ScreenDimension().screenWidth(context) * 0.4,
            //           height: ScreenDimension().screenHeight(context) * 0.15,
            //         ),
            //       ),
            //       const Padding(
            //         padding: EdgeInsets.fromLTRB(15, 10, 15, 20),
            //         child: Text(
            //           "The minutes for this meeting have not been confirmed yet. To confirm them, they will need to have been read, proposed and seconded in another meeting. You can tap the 'Confirm Meeting Minutes' button below to confirm them. They cannot be edited again once confirmed.",
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             fontSize: 12,
            //             height: 1.4,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ApprovalStatusCard(
                  churchOfficial: "Secretary's Approval",
                  approvalStatus:
                      "These meeting minutes have not been signed off by the Secretary. Tap the button below to sign it.",
                  isOfficialSigned: false,
                  showApprovalButton: true,
                ),
                ApprovalStatusCard(
                  churchOfficial: "Members' Confirmation",
                  approvalStatus:
                      "Waiting for other officials to sign off on this document before the approval process can proceed.",
                  isOfficialSigned: false,
                ),
                ApprovalStatusCard(
                  churchOfficial: "Chairperson's Approval",
                  approvalStatus:
                      "Waiting for other officials to sign off on this document before the approval process can proceed.",
                  isOfficialSigned: false,
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.loading,
                  text: "Preparing meeting minutes...",
                  autoCloseDuration: const Duration(seconds: 3),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                  width: ScreenDimension().screenWidth(context),
                  decoration: BoxDecoration(
                    color: AppDecorations().mainBlueColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.cloud_download,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Download Meeting Minutes",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  barrierDismissible: false,
                  title: "Are you sure?",
                  text:
                      "You are about to send a request to the admin to delete records for this meeting from the database!",
                  confirmBtnColor: AppDecorations().mainBlueColor,
                  confirmBtnText: "Keep It",
                  showCancelBtn: true,
                  cancelBtnText: "Delete",
                  confirmBtnTextStyle: const TextStyle(
                    fontFamily: "Poppins",
                    height: 1.5,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  cancelBtnTextStyle: const TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    height: 1.5,
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                  width: ScreenDimension().screenWidth(context),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.delete,
                        size: 20,
                        color: Colors.red,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Request Meeting Delete",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ApprovalStatusCard extends StatelessWidget {
  const ApprovalStatusCard({
    super.key,
    required this.churchOfficial,
    this.showApprovalButton = false,
    required this.approvalStatus,
    required this.isOfficialSigned,
  });

  final String churchOfficial;
  final bool showApprovalButton;
  final bool isOfficialSigned;
  final String approvalStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      //surfaceTintColor: Colors.transparent,
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 7,
              color: AppDecorations().mainBlueColor,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                isOfficialSigned
                    ? "assets/images/checked.png"
                    : "assets/images/wall-clock.png",
                width: 30,
                color: Colors.grey,
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: ScreenDimension().screenWidth(context) * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      churchOfficial,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      approvalStatus,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 137, 136, 136),
                        height: 1.7,
                      ),
                    ),
                    showApprovalButton
                        ? GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(CupertinoPageRoute(builder: (context) {
                                return const SecretaryConfirmMinutes();
                              }));
                            },
                            child: Container(
                              width: double.maxFinite,
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppDecorations().mainBlueColor,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                                child: Text(
                                  "Confirm Meeting Minutes",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
