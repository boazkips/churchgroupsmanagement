import 'package:churchgroupsmanagement/data/sample_attendance.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/text_form_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DraftPrepMeetingAttendanceInfo extends StatefulWidget {
  const DraftPrepMeetingAttendanceInfo({super.key});

  @override
  State<DraftPrepMeetingAttendanceInfo> createState() =>
      _DraftPrepMeetingAttendanceInfoState();
}

class _DraftPrepMeetingAttendanceInfoState
    extends State<DraftPrepMeetingAttendanceInfo> {
  List<String> memberPositions = [
    "Group Patron",
    "Chairperson",
    "Vice Chairperson",
    "Secretary",
    "Vice Secretary",
    "Treasurer",
    "Vice Treasurer",
    "Organiser",
    "Church School Rep",
    "Member",
    "Other",
  ];
  List<String> meetingAttendance = [
    "Present",
    "Absent With Apology",
    "Absent Without Apology",
  ];

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
                alignment: Alignment.topCenter,
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
                                  "Add New Attendance",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                    height: 2,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: IconTextField(
                                    fieldLabel: "Member Names",
                                    fieldHelper:
                                        "Enter the full names of the member",
                                    fieldIcon: CupertinoIcons.person_alt,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                  child: DropdownSearch(
                                    items: memberPositions,
                                    dropdownDecoratorProps:
                                        DropDownDecoratorProps(
                                      baseStyle: const TextStyle(
                                        height: 1,
                                        fontSize: 13,
                                      ),
                                      dropdownSearchDecoration:
                                          AppDecorations().inputDecoration1(
                                        fieldLabel: "Member Position",
                                        fieldHelper:
                                            "Select the appropriate position for this member",
                                        fieldIcon: CupertinoIcons.alt,
                                      ),
                                    ),
                                    popupProps: PopupProps.modalBottomSheet(
                                      fit: FlexFit.loose,
                                      listViewProps: const ListViewProps(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 15, 10),
                                      ),
                                      modalBottomSheetProps:
                                          ModalBottomSheetProps(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                  child: DropdownSearch(
                                    items: meetingAttendance,
                                    dropdownDecoratorProps:
                                        DropDownDecoratorProps(
                                      baseStyle: const TextStyle(
                                        height: 1,
                                        fontSize: 13,
                                      ),
                                      dropdownSearchDecoration:
                                          AppDecorations().inputDecoration1(
                                        fieldLabel: "Meeting Presence",
                                        fieldHelper:
                                            "Select whether this member is present for the meeting or not",
                                        fieldIcon: CupertinoIcons.eye,
                                      ),
                                    ),
                                    popupProps: PopupProps.modalBottomSheet(
                                      fit: FlexFit.loose,
                                      listViewProps: const ListViewProps(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 15, 10),
                                      ),
                                      modalBottomSheetProps:
                                          ModalBottomSheetProps(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
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
                                          "Add Attendance",
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
          "New Attendance",
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
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Text(
                "You can make changes, i.e., delete or add new members from the attendance list. To update the name of an attendee, just tap on their name and a form will appear.",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      "Members Present",
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
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: const {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FlexColumnWidth(),
                        3: IntrinsicColumnWidth(),
                      },
                      children: List.generate(
                        meetingAttendanceList
                            .where(
                                (element) => element["attendance"] == "Present")
                            .length,
                        (index) {
                          Iterable<Map<String, String>> newList =
                              meetingAttendanceList.where((element) =>
                                  element["attendance"] == "Present");
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
                                  padding:
                                      const EdgeInsets.only(right: 5, left: 5),
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
                              TableCell(
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      meetingAttendanceList
                                          .remove(newList.elementAt(index));
                                    });
                                  },
                                  icon: const Icon(CupertinoIcons.delete),
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
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: const {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FlexColumnWidth(),
                        3: IntrinsicColumnWidth(),
                      },
                      children: List.generate(
                        meetingAttendanceList
                            .where((element) =>
                                element["attendance"] == "Absent With Apology")
                            .length,
                        (index) {
                          Iterable<Map<String, String>> newList =
                              meetingAttendanceList.where((element) =>
                                  element["attendance"] ==
                                  "Absent With Apology");
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
                                  padding:
                                      const EdgeInsets.only(right: 5, left: 5),
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
                              TableCell(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(CupertinoIcons.delete),
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
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: const {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FlexColumnWidth(),
                        3: IntrinsicColumnWidth(),
                      },
                      children: List.generate(
                        meetingAttendanceList
                            .where((element) =>
                                element["attendance"] ==
                                "Absent Without Apology")
                            .length,
                        (index) {
                          Iterable<Map<String, String>> newList =
                              meetingAttendanceList.where((element) =>
                                  element["attendance"] ==
                                  "Absent Without Apology");
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
                                  padding:
                                      const EdgeInsets.only(right: 5, left: 5),
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
                              TableCell(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(CupertinoIcons.delete),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
