import 'dart:math';

import 'package:churchgroupsmanagement/screens/calendars/calendar_events_single.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AllCalendarEvents extends StatefulWidget {
  const AllCalendarEvents({super.key});

  @override
  State<AllCalendarEvents> createState() => _AllCalendarEventsState();
}

class _AllCalendarEventsState extends State<AllCalendarEvents> {
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
              width: ScreenDimension().screenWidth(context) * 0.60,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Calendars of Events",
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
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.search),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 25),
        children: const [
          SingleCalendarListItem(
            calendarStatus: "Proposed",
            calendarYear: "2023 - 2024",
            activitiesNumber: "18",
          ),
          SingleCalendarListItem(
            calendarStatus: "Current",
            calendarYear: "2022 - 2023",
            activitiesNumber: "25",
          ),
          SingleCalendarListItem(
            calendarStatus: "Closed",
            calendarYear: "2021 - 2022",
            activitiesNumber: "20",
          ),
          SingleCalendarListItem(
            calendarStatus: "Closed",
            calendarYear: "2020 - 2021",
            activitiesNumber: "15",
          ),
          SingleCalendarListItem(
            calendarStatus: "Closed",
            calendarYear: "2019 - 2020",
            activitiesNumber: "25",
          ),
        ],
      ),
    );
  }
}

class SingleCalendarListItem extends StatelessWidget {
  const SingleCalendarListItem({
    super.key,
    required this.calendarYear,
    required this.activitiesNumber,
    required this.calendarStatus,
  });

  final String calendarYear;
  final String activitiesNumber;
  final String calendarStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return const SingleCalendarofEvents();
        }));
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
        elevation: 1,
        child: Stack(
          children: [
            Container(
              width: ScreenDimension().screenWidth(context),
              height: ScreenDimension().screenHeight(context) * 0.16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/template.png",
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: ScreenDimension().screenWidth(context) * 0.6,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 12, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Financial Year",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            calendarYear,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: calendarStatus == "Proposed"
                      ? Colors.amber
                      : calendarStatus == "Current"
                          ? Colors.green
                          : Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
                  child: Text(
                    calendarStatus.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 10),
                width: ScreenDimension().screenWidth(context) - 30,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 3),
                    Text(
                      "$activitiesNumber activities added to the calendar",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    LinearPercentIndicator(
                      lineHeight: 7.0,
                      progressColor: AppDecorations().mainBlueColor,
                      percent: Random().nextDouble(),
                      padding: const EdgeInsets.only(right: 10),
                      barRadius: const Radius.circular(3),
                      trailing: Text(
                        "${Random().nextInt(100)}% done!",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
