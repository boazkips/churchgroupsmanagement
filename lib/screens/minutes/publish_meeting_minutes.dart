import 'package:churchgroupsmanagement/data/sample_attendance.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/text_form_field.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecretaryConfirmMinutes extends StatefulWidget {
  const SecretaryConfirmMinutes({super.key});

  @override
  State<SecretaryConfirmMinutes> createState() =>
      _SecretaryConfirmMinutesState();
}

class _SecretaryConfirmMinutesState extends State<SecretaryConfirmMinutes> {
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
                      "Confirm Meeting Minutes",
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
                    "Community Outreach Program",
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
            child: Text(
              "You are confirming the minutes for the above referenced meeting. You will require to selewct the names of the proposer and the seconder for these minutes, along with a date for when these minutes were read out to the officials.",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
            child: DropdownSearch<Map<String, String>>(
              items: meetingAttendanceList
                  .where((element) => element["attendance"] == "Present")
                  .toList(),
              itemAsString: (Map<String, String> selectedItem) {
                return "${selectedItem["full_names"]} - ${selectedItem["position"]}";
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                baseStyle: const TextStyle(
                  height: 1,
                  fontSize: 13,
                ),
                dropdownSearchDecoration: AppDecorations().inputDecoration1(
                  fieldLabel: "Minutes Proposer",
                  fieldHelper:
                      "Select the names of the member who proposed these minutes.",
                  fieldIcon: CupertinoIcons.person_alt,
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
            child: DropdownSearch<Map<String, String>>(
              items: meetingAttendanceList
                  .where((element) => element["attendance"] == "Present")
                  .toList(),
              itemAsString: (Map<String, String> selectedItem) {
                return "${selectedItem["full_names"]} - ${selectedItem["position"]}";
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                baseStyle: const TextStyle(
                  height: 1,
                  fontSize: 13,
                ),
                dropdownSearchDecoration: AppDecorations().inputDecoration1(
                  fieldLabel: "Minutes Seconder",
                  fieldHelper:
                      "Select the names of the member who seconded these minutes.",
                  fieldIcon: CupertinoIcons.person_alt,
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
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 20),
            child: IconTextField(
              fieldLabel: "Confirmation Date",
              fieldHelper:
                  "Set the date when the minutes were read, proposed and seconded",
              fieldIcon: CupertinoIcons.calendar,
            ),
          ),
          GestureDetector(
            onTap: () {
              CoolAlert.show(
                context: context,
                type: CoolAlertType.loading,
                text: "Publishing meeting minutes...",
                autoCloseDuration: const Duration(seconds: 3),
              ).then((value) => Navigator.pop(context));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                width: ScreenDimension().screenWidth(context),
                decoration: BoxDecoration(
                  color: AppDecorations().mainBlueColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/signature.svg",
                      width: 15,
                      height: 15,
                      fit: BoxFit.cover,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Confirm Meeting Minutes",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
