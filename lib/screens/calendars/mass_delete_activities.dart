import 'package:churchgroupsmanagement/data/sample_budget.dart';
import 'package:churchgroupsmanagement/data/sample_calendar_list.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MassDeleteCalendarActivities extends StatefulWidget {
  const MassDeleteCalendarActivities({super.key});

  @override
  State<MassDeleteCalendarActivities> createState() =>
      _MassDeleteCalendarActivitiesState();
}

class _MassDeleteCalendarActivitiesState
    extends State<MassDeleteCalendarActivities> {
  final _formKey = GlobalKey<FormState>();

  String newActivityTitle = "";
  String newActivityMonthYear = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addNewActivityForm(context);
        },
        backgroundColor: AppDecorations().mainBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        icon: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
        label: const Text(
          "Quick Add",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
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
                      "Manage Calendar Activities",
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
      body: ListView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
        children: [
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
              2: IntrinsicColumnWidth(),
              3: IntrinsicColumnWidth(),
            },
            children: List.generate(
              sampleCalendarBudget.length,
              (index) {
                return TableRow(
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${index + 1}.",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${sampleCalendarBudget[index]["title"]}",
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 1.7,
                              ),
                            ),
                            Text(
                              "${sampleCalendarBudget[index]["month"]}",
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.grey,
                                //height: 1.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TableCell(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.pencil_outline,
                          color: AppDecorations().mainBlueColor,
                        ),
                      ),
                    ),
                    TableCell(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> addNewActivityForm(BuildContext context) {
    return showDialog(
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
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Quick Add Activity to Calendar",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                height: 2,
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: TextFormField(
                                  style: const TextStyle(
                                    height: 1,
                                    fontSize: 13,
                                  ),
                                  onChanged: (value) =>
                                      setState(() => newActivityTitle = value),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "The activity title for the activity to be added to the calendar must be provided!!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: AppDecorations().inputDecoration1(
                                    fieldLabel: "Activity Title",
                                    fieldHelper:
                                        "Enter a descriptive title for the activity you are about to add to the calendar",
                                    fieldIcon: CupertinoIcons.textformat,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                              child: DropdownSearch(
                                items: sampleMonthsList,
                                onChanged: (value) => setState(
                                    () => newActivityMonthYear = value),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "You must select the month when the activity is expected to take place!!";
                                  } else {
                                    return null;
                                  }
                                },
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  baseStyle: const TextStyle(
                                    height: 1,
                                    fontSize: 13,
                                  ),
                                  dropdownSearchDecoration:
                                      AppDecorations().inputDecoration1(
                                    fieldLabel: "Activity Month",
                                    fieldHelper:
                                        "Select the projected month when you plan this activity to take place",
                                    fieldIcon: CupertinoIcons.calendar,
                                  ),
                                ),
                                popupProps: PopupProps.modalBottomSheet(
                                  fit: FlexFit.loose,
                                  listViewProps: const ListViewProps(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 15, 10),
                                  ),
                                  modalBottomSheetProps: ModalBottomSheetProps(
                                    clipBehavior: Clip.hardEdge,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text(
                                      "Discard Changes",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        sampleCalendarBudget.add(
                                          {
                                            'title': newActivityTitle,
                                            'month': newActivityMonthYear,
                                            'budget': {
                                              'budgetAmount': "(not set)",
                                              'kittyAmount': "(not set)",
                                              'total': "(not set)",
                                            },
                                            'objectives': [],
                                            'requirements': [],
                                          },
                                        );
                                        Navigator.pop(context);
                                      }
                                    },
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
                                      "Quick Add Activity",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
