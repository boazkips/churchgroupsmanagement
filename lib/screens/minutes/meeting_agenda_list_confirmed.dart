import 'package:churchgroupsmanagement/data/sample_minutes.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/material.dart';

class ConfirmedMeetingAgendaList extends StatefulWidget {
  const ConfirmedMeetingAgendaList({super.key});

  @override
  State<ConfirmedMeetingAgendaList> createState() =>
      _ConfirmedMeetingAgendaListState();
}

class _ConfirmedMeetingAgendaListState
    extends State<ConfirmedMeetingAgendaList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      itemCount: sampleMeetingMinutes.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          key: ValueKey(index),
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: index.isEven
                  ? Colors.grey.withOpacity(0.2)
                  : index.isOdd
                      ? Colors.white.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.2),
            ),
            child: SizedBox(
              width: ScreenDimension().screenWidth(context) * 0.75,
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
                    "${sampleMeetingMinutes[index]["minuteTitle"]}",
                    style: const TextStyle(
                      height: 1.5,
                      fontFamily: "Poppins",
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
