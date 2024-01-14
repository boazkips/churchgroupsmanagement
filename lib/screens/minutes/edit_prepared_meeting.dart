import 'package:churchgroupsmanagement/data/sample_attendance.dart';
import 'package:churchgroupsmanagement/data/sample_minutes.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/stepper_buttons.dart';
import 'package:churchgroupsmanagement/widgets/text_form_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EditPreparedMeeting extends StatefulWidget {
  const EditPreparedMeeting({super.key});

  @override
  State<EditPreparedMeeting> createState() => _EditPreparedMeetingState();
}

class _EditPreparedMeetingState extends State<EditPreparedMeeting> {
  int activeStep = 0;

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
                      "Update Prepared Minutes",
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
                    "Christmas Celebration Committee",
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
      backgroundColor: Theme.of(context).canvasColor,
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: activeStep,
        margin: EdgeInsets.zero,
        elevation: 0,
        onStepTapped: (value) => setState(() => activeStep = value),
        controlsBuilder: (context, details) {
          return CustomStepperButtons(
            onTapContinue: () {
              if (activeStep + 1 < newMeetingSteps.length) {
                setState(() {
                  activeStep++;
                });
              } else if (activeStep + 1 == newMeetingSteps.length) {
                Navigator.of(context).pop();
              } else {
                null;
              }
            },
            onTapCancel: () {
              if (activeStep == 0) {
                Navigator.of(context).pop();
              } else {
                setState(() {
                  activeStep--;
                });
              }
            },
            continueText: activeStep == 0
                ? "Metadata"
                : activeStep == 1
                    ? "Attendance"
                    : activeStep == 2
                        ? "Agenda"
                        : activeStep == 3
                            ? "Minutes"
                            : "Upload Changes",
            cancelText: activeStep == 0 ? "Discard" : "Go Back",
          );
        },
        steps: newMeetingSteps,
      ),
    );
  }

  List<Step> get newMeetingSteps {
    return [
      Step(
        isActive: activeStep >= 0,
        state: activeStep == 0 ? StepState.editing : StepState.complete,
        title: activeStep == 0
            ? const Text(
                "Info",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewMeetingInfo(),
      ),
      Step(
        isActive: activeStep >= 1,
        state: activeStep == 1
            ? StepState.editing
            : activeStep < 1
                ? StepState.indexed
                : StepState.complete,
        title: activeStep == 1
            ? const Text(
                "About",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewMeetingAbout(),
      ),
      Step(
        isActive: activeStep >= 2,
        state: activeStep == 2
            ? StepState.editing
            : activeStep < 2
                ? StepState.indexed
                : StepState.complete,
        title: activeStep == 2
            ? const Text(
                "Members",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewMeetingAttendance(),
      ),
      Step(
        isActive: activeStep >= 3,
        state: activeStep == 3
            ? StepState.editing
            : activeStep < 3
                ? StepState.indexed
                : StepState.complete,
        title: activeStep == 3
            ? const Text(
                "Agenda",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewMeetingAgenda(),
      ),
      Step(
        isActive: activeStep >= 4,
        state: activeStep == 4
            ? StepState.editing
            : activeStep < 4
                ? StepState.indexed
                : StepState.complete,
        title: activeStep == 4
            ? const Text(
                "Minutes",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewMeetingMinutes(),
      ),
    ];
  }
}

class NewMeetingMinutes extends StatelessWidget {
  const NewMeetingMinutes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
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
                                    "Add New Minute",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      height: 2,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                    child: DropdownSearch<Map<String, dynamic>>(
                                      items: sampleMeetingMinutes,
                                      itemAsString:
                                          (Map<String, dynamic> item) =>
                                              item["minuteTitle"]!,
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        baseStyle: const TextStyle(
                                          height: 1,
                                          fontSize: 13,
                                        ),
                                        dropdownSearchDecoration:
                                            AppDecorations().inputDecoration1(
                                          fieldLabel: "Agenda on Focus",
                                          fieldHelper:
                                              "Select the appropriate agenda to be discussed at the moment",
                                          fieldIcon: CupertinoIcons.alt,
                                        ),
                                      ),
                                      popupProps: PopupProps.modalBottomSheet(
                                        fit: FlexFit.loose,
                                        listViewProps: const ListViewProps(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 10, 15, 10),
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
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                    child: IconTextField(
                                      fieldLabel: "Minute Discussion",
                                      fieldHelper:
                                          "Provide details about all the issues discussed in regards to this agenda",
                                      fieldIcon: CupertinoIcons.text_cursor,
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
                                            "Add Minute",
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
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppDecorations().mainBlueColor,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Add Meeting Minute",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        ...sampleMeetingMinutes.map(
          (eachMinute) => Theme(
            data: ThemeData(
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      "${sampleMeetingMinutes.indexOf(eachMinute) + 1}.",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenDimension().screenWidth(context) * 0.70,
                    child: Text(
                      eachMinute["minuteTitle"].toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ],
              ),
              children: [
                Text(
                  eachMinute["minuteBody"],
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NewMeetingAgenda extends StatelessWidget {
  const NewMeetingAgenda({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
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
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppDecorations().mainBlueColor,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Add New Agenda",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "Meeting Agenda",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(),
            2: IntrinsicColumnWidth(),
            3: IntrinsicColumnWidth(),
          },
          children: List.generate(
            sampleMeetingMinutes.length,
            (index) {
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
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
                      sampleMeetingMinutes[index]["minuteTitle"],
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
      ],
    );
  }
}

class NewMeetingAttendance extends StatefulWidget {
  const NewMeetingAttendance({
    super.key,
  });

  @override
  State<NewMeetingAttendance> createState() => _NewMeetingAttendanceState();
}

class _NewMeetingAttendanceState extends State<NewMeetingAttendance> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
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
                                          padding: EdgeInsets.fromLTRB(
                                              10, 10, 15, 10),
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
                                          padding: EdgeInsets.fromLTRB(
                                              10, 10, 15, 10),
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
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppDecorations().mainBlueColor,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Add New Attendance",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
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
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: IntrinsicColumnWidth(),
          },
          children: List.generate(
            meetingAttendanceList
                .where((element) => element["attendance"] == "Present")
                .length,
            (index) {
              Iterable<Map<String, String>> newList = meetingAttendanceList
                  .where((element) => element["attendance"] == "Present");
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
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
                      newList.toList().elementAt(index)["position"].toString(),
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
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "Absent With Apology",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: IntrinsicColumnWidth(),
          },
          children: List.generate(
            meetingAttendanceList
                .where(
                    (element) => element["attendance"] == "Absent With Apology")
                .length,
            (index) {
              Iterable<Map<String, String>> newList =
                  meetingAttendanceList.where((element) =>
                      element["attendance"] == "Absent With Apology");
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
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
                      newList.toList().elementAt(index)["position"].toString(),
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
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "Absent Without Apology",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: IntrinsicColumnWidth(),
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
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
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
                      newList.toList().elementAt(index)["position"].toString(),
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
      ],
    );
  }
}

class NewMeetingAbout extends StatelessWidget {
  const NewMeetingAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: IconTextField(
            fieldLabel: "Meeting Title",
            fieldHelper: "Enter a title for the meeting",
            fieldIcon: CupertinoIcons.textformat,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Meeting Venue",
            fieldHelper: "Enter a venue where the meeting was held",
            fieldIcon: CupertinoIcons.building_2_fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Meeting Date",
            fieldHelper: "Set the date when the meeting happened",
            fieldIcon: CupertinoIcons.calendar,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Meeting Time",
            fieldHelper: "Set the time when the meeting happened",
            fieldIcon: CupertinoIcons.clock,
          ),
        ),
      ],
    );
  }
}

class NewMeetingInfo extends StatelessWidget {
  const NewMeetingInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Update the details for a meeting. You can save the progress at any point as a draft to be completed later then shared to other officials.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(
            "1. Meeting Info",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
        Text(
          "Enter the basic information about this meeting, including the meeting title, the venue where the meeting took place, and the date and time when the meeting was held.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(
            "2. Officials Attendance",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
        Text(
          "To add a new entry to the meeting attendance register, click on the Add New Attendance button. Fill in the full names of the official, then select the position they hold in the group/meeting, and then select the appropriate attendance i.e. Present, Absent With Apology or Absent Without Apology. Once done, click the add button and the member will appear on the appropriate list.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(
            "3. Meeting Agenda",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
        Text(
          "To add a new agenda to the meeting, click on the Add New Agenda button. Enter the title of the Agenda onto the entry field. Once done, click the add button and the agenda will appear on the list.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(
            "4. Meeting Minutes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
        Text(
          "To add a new entry to the meeting minutes, click on the Add New Minute button. Select an agenda to be discussed from the list of previously entered agendas. Then discuss the agenda at length addressing all the issues that were discussed regarding it. Once done, click the add button and the minute will appear on the list.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
