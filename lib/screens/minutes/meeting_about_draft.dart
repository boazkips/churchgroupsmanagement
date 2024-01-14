import 'package:churchgroupsmanagement/data/sample_attendance.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraftMeetingAboutInfo extends StatelessWidget {
  const DraftMeetingAboutInfo({super.key});

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
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                    child: Image.asset(
                      "assets/images/cloud.png",
                      fit: BoxFit.contain,
                      color: const Color.fromARGB(255, 124, 121, 121),
                      width: ScreenDimension().screenWidth(context) * 0.4,
                      height: ScreenDimension().screenHeight(context) * 0.15,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 20),
                    child: Text(
                      "This minutes are saved as draft on your phone. To make them availalble to your fellow group officials, tap on the 'Publish Meeting Minutes' below to upload them online. Note that even after publishing them you can still make changes to the minutes.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
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
                        CupertinoIcons.cloud_upload,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Publish Meeting Minutes",
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
                      "You are about to delete this meeting from your local phone storage. This will not affect the group's online database!",
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
                        "Delete Meeting Records",
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
