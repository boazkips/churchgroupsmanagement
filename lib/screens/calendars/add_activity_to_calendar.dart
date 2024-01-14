import 'package:churchgroupsmanagement/data/sample_budget.dart';
import 'package:churchgroupsmanagement/data/sample_calendar_list.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/stepper_buttons.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddActivityToCalendar extends StatefulWidget {
  const AddActivityToCalendar({super.key});

  @override
  State<AddActivityToCalendar> createState() => _AddActivityToCalendarState();
}

class _AddActivityToCalendarState extends State<AddActivityToCalendar> {
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
                      "Add Activity to Calendar",
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
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: activeStep,
        margin: EdgeInsets.zero,
        elevation: 0,
        onStepTapped: (value) => setState(() => activeStep = value),
        controlsBuilder: (context, details) {
          return CustomStepperButtons(
            onTapContinue: () {
              if (activeStep + 1 < newActivityToCalendar.length) {
                setState(() {
                  activeStep++;
                });
              } else if (activeStep + 1 == newActivityToCalendar.length) {
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
                    ? "Objectives"
                    : activeStep == 2
                        ? "Requirements"
                        : activeStep == 3
                            ? "Preview"
                            : "Upload Activity",
            cancelText: activeStep == 0 ? "Discard" : "Go Back",
          );
        },
        steps: newActivityToCalendar,
      ),
    );
  }

  List<Step> get newActivityToCalendar {
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
        content: const NewActivityToCalendarInfo(),
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
                "Title",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewActivityToCalendarMetadata(),
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
                "Objectives",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewActivityToCalendarObjectives(),
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
                "Required",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewActivityToCalendarRequirements(),
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
                "Preview",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewActivityToCalendarPreview(),
      ),
    ];
  }
}

class NewActivityToCalendarInfo extends StatelessWidget {
  const NewActivityToCalendarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "These are the steps to add a new activity to the new calendar of events. The details needed are just the title of the activity, and the proposed month, and a list of objectives of the activity and the requirements you need to make the activity a success.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(
            "1. Activity Metadata",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
        Text(
          "Enter the basic information about this activity/event, which includes a descriptive title of the event, and select the proposed month when the event is foreseen to take place.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(
            "2. Objectives",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
        Text(
          "To add a new objective for this activity to the list, click the 'Add New Objective' button and input a description of the objective. Once you are done, click the 'Done' button. You can also modify the list of objectives that have been already added, by clicking the delete button to remove an added objective.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(
            "3. Requirements",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
        Text(
          "To add a new requirement for this activity to the list, click the 'Add New Requirement' button and input the individual requirement to facilitate this activity. Once you are done, click the 'Done' button. You can also modify the list of requirements that have been already added, by clicking the delete button to remove an added requirement.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class NewActivityToCalendarMetadata extends StatelessWidget {
  const NewActivityToCalendarMetadata({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: AppDecorations().inputDecoration1(
            fieldLabel: "Activity Title",
            fieldHelper:
                "Enter the title for the activity to be added to the calendar",
            fieldIcon: CupertinoIcons.textformat,
          ),
          style: const TextStyle(
            height: 1,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 30),
        DropdownSearch(
          items: sampleMonthsList,
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: const TextStyle(
              height: 1,
              fontSize: 13,
            ),
            dropdownSearchDecoration: AppDecorations().inputDecoration1(
              fieldLabel: "Activity Month",
              fieldHelper:
                  "Select the projected month when this activity is scheduled to take place.",
              fieldIcon: CupertinoIcons.alt,
            ),
          ),
          popupProps: PopupProps.modalBottomSheet(
            fit: FlexFit.loose,
            listViewProps: const ListViewProps(
              padding: EdgeInsets.fromLTRB(10, 10, 15, 10),
            ),
            modalBottomSheetProps: ModalBottomSheetProps(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

class NewActivityToCalendarObjectives extends StatefulWidget {
  const NewActivityToCalendarObjectives({super.key});

  @override
  State<NewActivityToCalendarObjectives> createState() =>
      _NewActivityToCalendarObjectivesState();
}

class _NewActivityToCalendarObjectivesState
    extends State<NewActivityToCalendarObjectives> {
  final _formKey = GlobalKey<FormState>();
  List<String> addedObjectives = [];
  TextEditingController objectivesEditor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
            controller: objectivesEditor,
            validator: (value) {
              if (value!.isEmpty) {
                return "The activity objective cannot be empty!!";
              } else if (value.isNotEmpty && addedObjectives.contains(value)) {
                return "This activity objective is already added!";
              } else {
                return null;
              }
            },
            decoration: AppDecorations().inputDecoration1(
              fieldLabel: "Objectives of Activity",
              fieldHelper:
                  "Enter an objective aimed to be achieved from this activity and then press the button below to add it to the list.",
              fieldIcon: CupertinoIcons.checkmark_alt,
            ),
            style: const TextStyle(
              height: 1,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              setState(() {
                addedObjectives.add(objectivesEditor.text.trim());
              });
              objectivesEditor.clear();
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
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
                  "Add Activity Objective",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Divider(
                color: AppDecorations().mainBlueColor,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Activity Objectives".toUpperCase(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: AppDecorations().mainBlueColor,
                thickness: 2,
              ),
            ),
          ],
        ),
        addedObjectives.isEmpty
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/emptylist.png",
                        width: 150,
                        height: 150,
                        color: AppDecorations().mainBlueColor.withOpacity(0.3),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 6),
                        child: Text(
                          "No objectives added for this activity",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0: IntrinsicColumnWidth(),
                  2: IntrinsicColumnWidth(),
                  3: IntrinsicColumnWidth(),
                },
                children: List.generate(
                  addedObjectives.length,
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
                            addedObjectives[index],
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        TableCell(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                addedObjectives.remove(addedObjectives[index]);
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
      ],
    );
  }
}

class NewActivityToCalendarRequirements extends StatefulWidget {
  const NewActivityToCalendarRequirements({super.key});

  @override
  State<NewActivityToCalendarRequirements> createState() =>
      _NewActivityToCalendarRequirementsState();
}

class _NewActivityToCalendarRequirementsState
    extends State<NewActivityToCalendarRequirements> {
  final _formKey = GlobalKey<FormState>();
  List<String> addedRequirements = [];
  TextEditingController requirementssEditor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
            controller: requirementssEditor,
            validator: (value) {
              if (value!.isEmpty) {
                return "The activity requirement cannot be empty!!";
              } else if (value.isNotEmpty &&
                  addedRequirements.contains(value)) {
                return "This activity requirement is already added!";
              } else {
                return null;
              }
            },
            decoration: AppDecorations().inputDecoration1(
              fieldLabel: "Requirements for Activity",
              fieldHelper:
                  "Enter a requirement needed to facilitate this activity and then press the button below to add it to the list.",
              fieldIcon: CupertinoIcons.checkmark_alt,
            ),
            style: const TextStyle(
              height: 1,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              setState(() {
                addedRequirements.add(requirementssEditor.text.trim());
              });
              requirementssEditor.clear();
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
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
                  "Add Activity Requirement",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Divider(
                color: AppDecorations().mainBlueColor,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Activity Requirements".toUpperCase(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: AppDecorations().mainBlueColor,
                thickness: 2,
              ),
            ),
          ],
        ),
        addedRequirements.isEmpty
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/emptylist.png",
                        width: 150,
                        height: 150,
                        color: AppDecorations().mainBlueColor.withOpacity(0.3),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 6),
                        child: Text(
                          "No requirements added for this activity",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0: IntrinsicColumnWidth(),
                  2: IntrinsicColumnWidth(),
                  3: IntrinsicColumnWidth(),
                },
                children: List.generate(
                  addedRequirements.length,
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
                            addedRequirements[index],
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        TableCell(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                addedRequirements
                                    .remove(addedRequirements[index]);
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
      ],
    );
  }
}

class NewActivityToCalendarPreview extends StatelessWidget {
  const NewActivityToCalendarPreview({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> singleEvent = sampleCalendarBudget.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
            child: SizedBox(
              width: ScreenDimension().screenWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      singleEvent["title"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: ScreenDimension().screenWidth(context) - 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Objectives",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: singleEvent["objectives"].toList().length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text(
                              "${index + 1}. ${singleEvent["objectives"][index]}",
                              style: const TextStyle(
                                fontSize: 12,
                                height: 2,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Requirements",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: singleEvent["requirements"].toList().length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(
                              index != 0 ? 5 : 0, 2, index != 3 ? 0 : 0, 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppDecorations().mainBlueColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Text(
                              "${index + 1}. ${singleEvent["requirements"][index]}",
                              style: const TextStyle(
                                fontSize: 12,
                                //height: 2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
