import 'package:churchgroupsmanagement/screens/minutes/meeting_about_prepared.dart';
import 'package:churchgroupsmanagement/screens/minutes/meeting_agenda_list_draftprep.dart';
import 'package:churchgroupsmanagement/screens/minutes/meeting_attendance_draftprep.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/material.dart';

class PreparedSingleMeetingInfo extends StatefulWidget {
  const PreparedSingleMeetingInfo({super.key});

  @override
  State<PreparedSingleMeetingInfo> createState() =>
      _PreparedSingleMeetingInfoState();
}

class _PreparedSingleMeetingInfoState extends State<PreparedSingleMeetingInfo>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

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
        bottom: TabBar(
          controller: tabController,
          isScrollable: false,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          indicatorPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.label,
          //tabAlignment: TabAlignment.start,
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(
              text: "About",
            ),
            Tab(
              text: "Attendance",
            ),
            Tab(
              text: "Agenda",
            ),
          ],
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: 0.5,
            color: Colors.grey,
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            fontSize: 14,
            color: AppDecorations().mainBlueColor,
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          PreparedMeetingAboutInfo(),
          DraftPrepMeetingAttendanceInfo(),
          DraftPrepMeetingAgendaList(),
        ],
      ),
    );
  }
}
