import 'package:churchgroupsmanagement/data/sample_minutes.dart';
import 'package:churchgroupsmanagement/screens/minutes/edit_prepared_meeting.dart';
import 'package:churchgroupsmanagement/screens/minutes/edit_selected_minute.dart';
import 'package:churchgroupsmanagement/screens/minutes/meeting_info_prepared.dart';
import 'package:churchgroupsmanagement/screens/minutes/publish_meeting_minutes.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SinglePreparedMeeting extends StatefulWidget {
  const SinglePreparedMeeting({super.key});

  @override
  State<SinglePreparedMeeting> createState() => _SinglePreparedMeetingState();
}

class _SinglePreparedMeetingState extends State<SinglePreparedMeeting> {
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
              width: ScreenDimension().screenWidth(context) * 0.55,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Community Outreach Program",
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
                    "Woman's Guild (Parish Office)",
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const EditPreparedMeeting();
              }));
            },
            icon: Icon(
              CupertinoIcons.pencil_outline,
              color: AppDecorations().mainBlueColor,
              size: 25,
            ),
          ),
          const MinutesDetailsPopupMenu(),
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            MeetingOverview(),
            MeetingMinutesList(),
          ],
        ),
      ),
    );
  }
}

class MinutesDetailsPopupMenu extends StatelessWidget {
  const MinutesDetailsPopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      icon: Icon(
        CupertinoIcons.ellipsis_vertical,
        color: AppDecorations().mainBlueColor,
        size: 25,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const EditPreparedMeeting();
              }));
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/file_edit_outline.svg",
                  width: 15,
                  height: 15,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                const Text("Edit Minutes"),
              ],
            ),
          ),
          PopupMenuItem(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const PreparedSingleMeetingInfo();
              }));
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/info.svg",
                  width: 15,
                  height: 15,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                const Text("Meeting Details"),
              ],
            ),
          ),
          PopupMenuItem(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const SecretaryConfirmMinutes();
              }));
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/signature.svg",
                  width: 15,
                  height: 15,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                const Text("Confirm Minutes"),
              ],
            ),
          ),
          const PopupMenuItem(child: PopupMenuDivider()),
          PopupMenuItem(
            onTap: () {
              CoolAlert.show(
                context: context,
                type: CoolAlertType.loading,
                text: "Preparing meeting minutes...",
                autoCloseDuration: const Duration(seconds: 3),
              );
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/share_outline.svg",
                  width: 15,
                  height: 15,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                const Text("Export & Share Minutes"),
              ],
            ),
          ),
          PopupMenuItem(
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
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/delete_document_outline.svg",
                  width: 15,
                  height: 15,
                  fit: BoxFit.cover,
                  color: Colors.redAccent,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Request Meeting Delete",
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}

class MeetingOverview extends StatelessWidget {
  const MeetingOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return const PreparedSingleMeetingInfo();
        }));
      },
      child: Stack(
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
                    const Text(
                      "12 Present, 5 Absent",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (context) {
                  return const PreparedSingleMeetingInfo();
                }));
              },
              child: const Icon(
                CupertinoIcons.question_circle_fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MeetingMinutesList extends StatefulWidget {
  const MeetingMinutesList({
    super.key,
  });

  @override
  State<MeetingMinutesList> createState() => _MeetingMinutesListState();
}

class _MeetingMinutesListState extends State<MeetingMinutesList> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final Map<String, dynamic> item =
              sampleMeetingMinutes.removeAt(oldIndex);
          sampleMeetingMinutes.insert(newIndex, item);

          for (var item in sampleMeetingMinutes) {
            item["minuteNumber"] = 121 + sampleMeetingMinutes.indexOf(item);
          }
        });
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      itemBuilder: (context, index) => SingleMinuteContainer(
        index: index,
        key: ValueKey(index),
      ),
      itemCount: sampleMeetingMinutes.length,
    );
  }
}

class SingleMinuteContainer extends StatelessWidget {
  const SingleMinuteContainer({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(index),
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: ScreenDimension().screenWidth(context) * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MIN ${sampleMeetingMinutes[index]["minuteNumber"]}/23/11/2023",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Colors.blue,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      sampleMeetingMinutes[index]["minuteTitle"].toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.5,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (context) {
                    return const UpdateMeetingMinute();
                  }));
                },
                child: const Text(
                  "Update Minute",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: ScreenDimension().screenWidth(context),
            child: Text(
              sampleMeetingMinutes[index]["minuteBody"],
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
