import 'package:churchgroupsmanagement/screens/calendars/calendar_approval.dart';
import 'package:churchgroupsmanagement/screens/calendars/calendar_remarks.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/material.dart';

class CalendarEventsInfo extends StatefulWidget {
  const CalendarEventsInfo({super.key});

  @override
  State<CalendarEventsInfo> createState() => _CalendarEventsInfoState();
}

class _CalendarEventsInfoState extends State<CalendarEventsInfo>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
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
                      "Calendar of Events Info",
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
                    "Church Year 2023 - 2024",
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
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          indicatorPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          dividerColor: Colors.transparent,
          tabs: [
            Tab(
              text: "Approval".toUpperCase(),
            ),
            Tab(
              text: "Commentary".toUpperCase(),
            ),
          ],
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            fontSize: 14,
            letterSpacing: 0.5,
            color: Colors.grey,
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            letterSpacing: 0.5,
            fontSize: 14,
            color: AppDecorations().mainBlueColor,
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          CalendarApprovalInfo(),
          CalendarProgressRemarks(),
        ],
      ),
    );
  }
}
