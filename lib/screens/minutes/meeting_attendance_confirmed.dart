import 'package:churchgroupsmanagement/data/sample_attendance.dart';
import 'package:flutter/material.dart';

class ConfirmedMeetingAttendanceInfo extends StatelessWidget {
  const ConfirmedMeetingAttendanceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "Members Present",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Card(
          surfaceTintColor: Colors.transparent,
          margin: EdgeInsets.zero,
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
            },
            children: List.generate(
              meetingAttendanceList
                  .where((element) => element["attendance"] == "Present")
                  .length,
              (index) {
                Iterable<Map<String, String>> newList = meetingAttendanceList
                    .where((element) => element["attendance"] == "Present");
                return TableRow(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: index.isEven
                        ? Colors.grey.withOpacity(0.2)
                        : index.isOdd
                            ? Colors.white.withOpacity(0.3)
                            : Colors.grey.withOpacity(0.2),
                  ),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 12, 5, 12),
                        child: Text(
                          "${index + 1}.",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        newList
                            .toList()
                            .elementAt(index)["full_names"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        newList
                            .toList()
                            .elementAt(index)["position"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Text(
            "Absent With Apology",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Card(
          surfaceTintColor: Colors.transparent,
          margin: EdgeInsets.zero,
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
            },
            children: List.generate(
              meetingAttendanceList
                  .where((element) =>
                      element["attendance"] == "Absent With Apology")
                  .length,
              (index) {
                Iterable<Map<String, String>> newList =
                    meetingAttendanceList.where((element) =>
                        element["attendance"] == "Absent With Apology");
                return TableRow(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: index.isEven
                        ? Colors.grey.withOpacity(0.2)
                        : index.isOdd
                            ? Colors.white.withOpacity(0.3)
                            : Colors.grey.withOpacity(0.2),
                  ),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 12, 5, 12),
                        child: Text(
                          "${index + 1}.",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        newList
                            .toList()
                            .elementAt(index)["full_names"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        newList
                            .toList()
                            .elementAt(index)["position"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Text(
            "Absent Without Apology",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Card(
          surfaceTintColor: Colors.transparent,
          margin: EdgeInsets.zero,
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
            },
            children: List.generate(
              meetingAttendanceList
                  .where((element) =>
                      element["attendance"] == "Absent Without Apology")
                  .length,
              (index) {
                Iterable<Map<String, String>> newList =
                    meetingAttendanceList.where((element) =>
                        element["attendance"] == "Absent Without Apology");
                return TableRow(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: index.isEven
                        ? Colors.grey.withOpacity(0.2)
                        : index.isOdd
                            ? Colors.white.withOpacity(0.3)
                            : Colors.grey.withOpacity(0.2),
                  ),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 12, 5, 12),
                        child: Text(
                          "${index + 1}.",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        newList
                            .toList()
                            .elementAt(index)["full_names"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        newList
                            .toList()
                            .elementAt(index)["position"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
