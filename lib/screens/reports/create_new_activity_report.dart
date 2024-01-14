import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/stepper_buttons.dart';
import 'package:churchgroupsmanagement/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CreateNewActivityReport extends StatefulWidget {
  const CreateNewActivityReport({super.key});

  @override
  State<CreateNewActivityReport> createState() =>
      _CreateNewActivityReportState();
}

class _CreateNewActivityReportState extends State<CreateNewActivityReport> {
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
              width: ScreenDimension().screenWidth(context) * 0.60,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Create New Activity Report",
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
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: activeStep,
        margin: EdgeInsets.zero,
        elevation: 0,
        onStepTapped: (value) => setState(() => activeStep = value),
        steps: newActivityReportSteps,
        controlsBuilder: (context, details) {
          return CustomStepperButtons(
            onTapContinue: () {
              if (activeStep + 1 < newActivityReportSteps.length) {
                setState(() {
                  activeStep++;
                });
              } else if (activeStep + 1 == newActivityReportSteps.length) {
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
                    ? "Activity Report"
                    : activeStep == 2
                        ? "Attatchments"
                        : "Upload Report",
            cancelText: activeStep == 0 ? "Discard" : "Go Back",
          );
        },
      ),
    );
  }

  List<Step> get newActivityReportSteps {
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
        content: const NewActivityReportInfo(),
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
        content: const NewActivityReportAbout(),
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
                "Activity",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewActivityReportBio(),
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
                "Attachments",
                style: TextStyle(
                  fontFamily: "OpenSansCondensed",
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
        content: const NewActivityReportFiles(),
      ),
    ];
  }
}

class NewActivityReportInfo extends StatelessWidget {
  const NewActivityReportInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "These are the steps to create a new activity report for this group. You can save the progress at any point as a draft to be completed later then shared to other officials.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(
            "1. Activity Info",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
        Text(
          "Enter the basic information about this activity, including the activity title, the duration when this activity was held, an approximate number of the people in attendance, some key roles including deviotion and facilitaion.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(
            "2. Activity Report",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
        Text(
          "Give a detailed report for the different highlights of this activity, the achievements and challenges in line with the objectives of the activity, the main lessons learnt from this activity and/or some general remarks",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(
            "3. Attachments",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
        Text(
          "To add a new attachment to the activity i.e. photos, documents, receipts etc, click on the Add New Attatchment button. Provide a brief description for this attachment, maybe a title or a name, then click on the browse icon to choose whether to take an image of upload from local storage. Once done, click the Add button and the attatchment will appear on the list.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class NewActivityReportAbout extends StatelessWidget {
  const NewActivityReportAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: IconTextField(
            fieldLabel: "Activity Title",
            fieldHelper: "Enter a brief title for this group activity",
            fieldIcon: CupertinoIcons.textformat,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Activity Venue",
            fieldHelper: "Enter the venue where this group activity was held",
            fieldIcon: CupertinoIcons.map_pin_ellipse,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Activity Date & Time",
            fieldHelper:
                "Pick the date and time when this group activity started",
            fieldIcon: CupertinoIcons.calendar,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Devotion Leader",
            fieldHelper:
                "Enter the names of the person who led the devotion during this group activity",
            fieldIcon: CupertinoIcons.person_alt,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Bible Readings",
            fieldHelper:
                "Enter the bible readings referenced during the devotion for this group activity",
            fieldIcon: CupertinoIcons.book,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Facilitator Names",
            fieldHelper:
                "Enter the names of the facilitator for this group activity",
            fieldIcon: CupertinoIcons.person_alt,
          ),
        ),
      ],
    );
  }
}

class NewActivityReportBio extends StatelessWidget {
  const NewActivityReportBio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: IconTextField(
            fieldLabel: "Key Highlights",
            fieldHelper: "Enter a brief title for this group activity",
            fieldIcon: CupertinoIcons.camera_viewfinder,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Main Achievements",
            fieldHelper: "Enter the venue where this group activity was held",
            fieldIcon: CupertinoIcons.hand_thumbsup_fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Main Challenges",
            fieldHelper:
                "Pick the date and time when this group activity started",
            fieldIcon: CupertinoIcons.hand_thumbsdown_fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Main Lessons Learnt",
            fieldHelper:
                "Enter the names of the person who led the devotion during this group activity",
            fieldIcon: CupertinoIcons.smiley_fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: IconTextField(
            fieldLabel: "Activity Remarks",
            fieldHelper:
                "Enter the bible readings referenced during the devotion for this group activity",
            fieldIcon: CupertinoIcons.chat_bubble_2_fill,
          ),
        ),
      ],
    );
  }
}

class NewActivityReportFiles extends StatelessWidget {
  const NewActivityReportFiles({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> possibleDocuments = [
      "assets/images/doc_file.png",
      //"assets/images/error_file.png",
      //"assets/images/gen_file.png",
      "assets/images/jpg_file.png",
      "assets/images/pdf_file.png",
      "assets/images/png_file.png",
      //"assets/images/wait_file.png",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              builder: (context) {
                return IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      15,
                      15,
                      15,
                      MediaQuery.of(context).padding.bottom + 10,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: AppDecorations().mainBlueColor,
                                radius: 30,
                                child: const Icon(
                                  CupertinoIcons.camera,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Open Camera",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: AppDecorations().mainBlueColor,
                                radius: 30,
                                child: const Icon(
                                  CupertinoIcons.photo,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Browse Storage",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                ),
                              ),
                            ],
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
                  "Add New Attatchment",
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
        GridView.custom(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            pattern: [
              const WovenGridTile(1),
              const WovenGridTile(
                5 / 7,
                crossAxisRatio: 0.9,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: possibleDocuments.length,
            (context, index) => Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(149, 206, 205, 205),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image.asset(
                  possibleDocuments[index],
                  width: 65,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
