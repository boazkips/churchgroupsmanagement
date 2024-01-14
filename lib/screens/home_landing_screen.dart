import 'package:churchgroupsmanagement/screens/budgets/budgets_list.dart';
import 'package:churchgroupsmanagement/screens/calendars/calendar_events_list.dart';
import 'package:churchgroupsmanagement/screens/minutes/minutes_list.dart';
import 'package:churchgroupsmanagement/screens/reports/acitivity_reports_list.dart';
import 'package:churchgroupsmanagement/screens/requisitions/requisitions_list.dart';
import 'package:churchgroupsmanagement/screens/returns/returns_list.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLandingScreen extends StatefulWidget {
  const HomeLandingScreen({super.key});

  @override
  State<HomeLandingScreen> createState() => _HomeLandingScreenState();
}

class _HomeLandingScreenState extends State<HomeLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              MediaQuery.of(context).padding.top,
              15,
              5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 3),
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Mrs. Isabel Ramirez",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: Color.fromARGB(255, 147, 149, 152),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      barrierDismissible: false,
                      title: "Are you sure?",
                      text:
                          "You are about to logout from the dashboard. Ensure all changes are saved before you leave!",
                      confirmBtnColor: AppDecorations().mainBlueColor,
                      confirmBtnText: "Stay",
                      showCancelBtn: true,
                      cancelBtnText: "Logout",
                      confirmBtnTextStyle: const TextStyle(
                        fontFamily: "Poppins",
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      cancelBtnTextStyle: const TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppDecorations().mainBlueColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: AppDecorations().mainBlueColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                    child: Stack(
                      children: [
                        Container(
                          width: ScreenDimension().screenWidth(context),
                          height: ScreenDimension().screenHeight(context) * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/template.png",
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: SizedBox(
                            width: ScreenDimension().screenWidth(context) * 0.6,
                            height:
                                ScreenDimension().screenHeight(context) * 0.19,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 12, 5, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Woman's Guild",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Group Secretary",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Parish Office",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      roleSwitchModal(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 5, 8, 5),
                                        child: Text(
                                          "Change Group",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color:
                                                AppDecorations().mainBlueColor,
                                          ),
                                        ),
                                      ),
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
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
                    child: Text(
                      "Quick Stats",
                      style: TextStyle(
                        fontFamily: "OpenSansSemiCondensed",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(-3, 3),
                            blurRadius: 10,
                            color: Colors.grey.withOpacity(0.3),
                          )
                        ],
                        borderRadius: BorderRadius.circular(18),
                        color: const Color.fromARGB(187, 255, 255, 255),
                      ),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SingleAnalyticItem(
                                numberCount: "5",
                                tallyDesc: "Pending \nDocuments",
                                artLocation: "assets/icons/time_management.png",
                              ),
                              SingleAnalyticItem(
                                numberCount: "47",
                                tallyDesc: "% Budget \nUtilisation",
                                artLocation: "assets/icons/speedometer.png",
                              ),
                              SingleAnalyticItem(
                                numberCount: "80",
                                tallyDesc: "% Audit \nScore",
                                artLocation: "assets/icons/trophy.png",
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
                    child: Text(
                      "Group Documents",
                      style: TextStyle(
                        fontFamily: "OpenSansSemiCondensed",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.4,
                    ),
                    children: const [
                      SingleDocumentThumbnail(
                        documentTitle: "Group Minutes",
                        documentPermision: "View, create and update records",
                        documentsThumb: "assets/images/meeting.png",
                        rerouteNavigation: AllGroupMinutes(),
                      ),
                      SingleDocumentThumbnail(
                        documentTitle: "Calendar of Events",
                        documentPermision: "View, create and update records",
                        documentsThumb: "assets/images/calendars.png",
                        rerouteNavigation: AllCalendarEvents(),
                      ),
                      SingleDocumentThumbnail(
                        documentTitle: "Group Activity Reports",
                        documentPermision: "View, create and update records",
                        documentsThumb: "assets/images/dashboard.png",
                        rerouteNavigation: AllActivityReports(),
                      ),
                      SingleDocumentThumbnail(
                        documentTitle: "Group Budgets",
                        documentPermision: "View group records",
                        documentsThumb: "assets/images/planning.png",
                        rerouteNavigation: AllGroupBudgets(),
                      ),
                      SingleDocumentThumbnail(
                        documentTitle: "Expense Requisitions",
                        documentPermision: "View group records",
                        documentsThumb: "assets/images/earning.png",
                        rerouteNavigation: AllExpenseRequisitions(),
                      ),
                      SingleDocumentThumbnail(
                        documentTitle: "Expenditure Returns",
                        documentPermision: "View group records",
                        documentsThumb: "assets/images/accounting.png",
                        rerouteNavigation: AllReturnForms(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> roleSwitchModal(BuildContext context) {
    return showModalBottomSheet(
      isDismissible: true,
      shape: const RoundedRectangleBorder(),
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 5,
      context: context,
      builder: (context) {
        return IntrinsicHeight(
          child: Container(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Image.asset(
                        "assets/icons/close.png",
                        width: 15,
                        color: const Color.fromARGB(255, 108, 104, 104),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Switch Official Roles",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Divider(),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Text(
                    "You can select a different group from the available church groups that you are part of the team of officials. If you do not see any group that you officiate, contact the support team.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const OfficialRoleTile(
                  roleChurchGroup: "Woman's Guild",
                  roleChurchLevel: "Parish Office",
                  roleTitle: "Group Secretary",
                  selected: true,
                ),
                const OfficialRoleTile(
                  roleChurchGroup: "Youth",
                  roleChurchLevel: "PCEA Kiamumbi Church",
                  roleTitle: "Group Chairperson",
                  selected: false,
                ),
                const OfficialRoleTile(
                  roleChurchGroup: "Youth",
                  roleChurchLevel: "Parish Office",
                  roleTitle: "Group Chairperson",
                  selected: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppDecorations().mainBlueColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Text(
                              "Switch Active Group",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppDecorations().mainBlueColor,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: AppDecorations().mainBlueColor,
                              ),
                            ),
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
      },
    );
  }
}

class OfficialRoleTile extends StatelessWidget {
  const OfficialRoleTile({
    super.key,
    required this.roleTitle,
    required this.roleChurchLevel,
    required this.roleChurchGroup,
    required this.selected,
  });

  final String roleTitle;
  final String roleChurchLevel;
  final String roleChurchGroup;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/user.png",
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ScreenDimension().screenWidth(context) * 0.70,
                child: Text(
                  roleChurchGroup,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 66, 65, 65),
                  ),
                ),
              ),
              SizedBox(
                width: ScreenDimension().screenWidth(context) * 0.70,
                child: Text(
                  "$roleTitle - $roleChurchLevel",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 2,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 66, 65, 65),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          selected
              ? Icon(
                  CupertinoIcons.checkmark_alt_circle_fill,
                  color: AppDecorations().mainBlueColor,
                  size: 20,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class SingleDocumentThumbnail extends StatelessWidget {
  const SingleDocumentThumbnail({
    super.key,
    required this.documentTitle,
    required this.documentPermision,
    required this.documentsThumb,
    required this.rerouteNavigation,
  });

  final String documentTitle;
  final String documentPermision;
  final String documentsThumb;
  final Widget rerouteNavigation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return rerouteNavigation;
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(-3, 3),
              blurRadius: 10,
              color: Colors.grey.withOpacity(0.3),
            )
          ],
          borderRadius: BorderRadius.circular(7),
          color: const Color.fromARGB(187, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              documentsThumb,
              width: 40,
              height: 40,
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  documentTitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins",
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  documentPermision,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SingleAnalyticItem extends StatelessWidget {
  const SingleAnalyticItem({
    super.key,
    required this.numberCount,
    required this.tallyDesc,
    required this.artLocation,
  });

  final String numberCount;
  final String tallyDesc;
  final String artLocation;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color.fromARGB(255, 64, 156, 255),
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: ScreenDimension().screenWidth(context) * .2,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    numberCount,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 3,
                      height: 1.5,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    tallyDesc,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 241, 241, 241),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: -5,
                top: -5,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    artLocation,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
