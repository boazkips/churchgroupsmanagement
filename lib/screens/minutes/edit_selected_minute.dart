import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateMeetingMinute extends StatefulWidget {
  const UpdateMeetingMinute({super.key});

  @override
  State<UpdateMeetingMinute> createState() => _UpdateMeetingMinuteState();
}

class _UpdateMeetingMinuteState extends State<UpdateMeetingMinute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Image.asset(
                    "assets/icons/back.png",
                    color: Colors.blue,
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: ScreenDimension().screenWidth(context) * 0.80,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Update Meeting Minute",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.7,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Text(
                    "Community Outreach Program",
                    style: TextStyle(
                      letterSpacing: 0.7,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Update the selected minute. You can modify the agenda headline or the agenda description that makes up the minute. However, you cannot save the changes successfully if either one of the fields is left empty.",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Agenda Headline".toUpperCase(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextFormField(
              style: const TextStyle(fontSize: 12),
              initialValue: "Team Building Activity",
              decoration: AppDecorations().inputDecoration1(
                fieldLabel: "Agenda",
                fieldHelper:
                    "Update the headline title for the item dicussed in the meeting",
                fieldIcon: CupertinoIcons.alt,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Agenda Description".toUpperCase(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextFormField(
              style: const TextStyle(fontSize: 12),
              maxLines: 7,
              minLines: 3,
              initialValue:
                  "The team-building activity focused on strengthening our collaboration and communication skills. Through interactive exercises and group challenges, team members learned to trust and rely on each other. We emphasized the importance of teamwork in achieving common goals and overcoming obstacles. The activity fostered a positive team spirit, enhancing morale and boosting camaraderie. Everyone actively participated and embraced the opportunity to learn from one another, creating a more cohesive and motivated team.",
              decoration: AppDecorations().inputDecoration1(
                fieldLabel: "Agenda Description",
                fieldHelper:
                    "Update the description for the item discuused during the meeting. Ensure to be as detailed as possible.",
                fieldIcon: CupertinoIcons.textformat,
              ),
            ),
            GestureDetector(
              onTap: () {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.loading,
                  text: "Updating meeting minutes...",
                  autoCloseDuration: const Duration(seconds: 3),
                ).then((value) => Navigator.pop(context));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
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
                        "Update Meeting Minutes",
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
          ],
        ),
      ),
    );
  }
}
