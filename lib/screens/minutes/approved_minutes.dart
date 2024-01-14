import 'package:churchgroupsmanagement/data/sample_meetings.dart';
import 'package:churchgroupsmanagement/screens/minutes/minutes_single_confirmed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApprovedMinutesList extends StatefulWidget {
  const ApprovedMinutesList({super.key});

  @override
  State<ApprovedMinutesList> createState() => _ApprovedMinutesListState();
}

class _ApprovedMinutesListState extends State<ApprovedMinutesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
        child: SingleChildScrollView(
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: List.generate(
              meetings.length,
              (index) => TableRow(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: index.isEven
                      ? Colors.grey.withOpacity(0.2)
                      : index.isOdd
                          ? Colors.white.withOpacity(0.3)
                          : Colors.grey.withOpacity(0.2),
                ),
                children: [
                  TableCell(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(CupertinoPageRoute(builder: (context) {
                          return const SingleConfirmedMeeting();
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  meetings[index]["meetingTitle"],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  "Meeting held on ${DateFormat.yMMMEd().format(meetings[index]["date"])} from ${DateFormat.jm().format(meetings[index]["date"])}",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Tap to view records of this meeting...",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
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
          ),
        ),
      ),
    );
  }
}
