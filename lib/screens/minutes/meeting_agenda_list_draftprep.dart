import 'package:churchgroupsmanagement/data/sample_minutes.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DraftPrepMeetingAgendaList extends StatefulWidget {
  const DraftPrepMeetingAgendaList({super.key});

  @override
  State<DraftPrepMeetingAgendaList> createState() =>
      _DraftPrepMeetingAgendaListState();
}

class _DraftPrepMeetingAgendaListState
    extends State<DraftPrepMeetingAgendaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                insetPadding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
                alignment: Alignment.center,
                clipBehavior: Clip.hardEdge,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                surfaceTintColor: Colors.transparent,
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height * .2,
                        decoration: const BoxDecoration(
                          color: Color(0xFF515C6F),
                        ),
                        child: Lottie.asset(
                          'assets/json/add.json',
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Add New Agenda",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                    height: 2,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: IconTextField(
                                    fieldLabel: "Agenda Title",
                                    fieldHelper:
                                        "Enter the title of the agenda to be discussed on the meeting",
                                    fieldIcon: CupertinoIcons.textformat,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text(
                                          "Discard Changes",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      ElevatedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppDecorations().mainBlueColor,
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 7, 15, 7),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        child: const Text(
                                          "Add Agenda",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
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
            },
          );
        },
        backgroundColor: AppDecorations().mainBlueColor,
        label: const Text(
          "New Agenda",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
              child: Text(
                "You can drag and drop to change the order in which the agendas were discussed. This will also update the order when you preview the minutes and the minute numbers.",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            ReorderableListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final Map<String, dynamic> item =
                      sampleMeetingMinutes.removeAt(oldIndex);
                  sampleMeetingMinutes.insert(newIndex, item);

                  for (var item in sampleMeetingMinutes) {
                    item["minuteNumber"] =
                        121 + sampleMeetingMinutes.indexOf(item);
                  }
                });
              },
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
              itemCount: sampleMeetingMinutes.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  key: ValueKey(index),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: index.isEven
                          ? Colors.grey.withOpacity(0.2)
                          : index.isOdd
                              ? Colors.white.withOpacity(0.3)
                              : Colors.grey.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
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
                        const Icon(CupertinoIcons.line_horizontal_3),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
