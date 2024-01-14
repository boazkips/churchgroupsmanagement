import 'package:churchgroupsmanagement/data/sample_budget.dart';
import 'package:churchgroupsmanagement/screens/calendars/add_activity_to_calendar.dart';
import 'package:churchgroupsmanagement/screens/calendars/calendar_info.dart';
import 'package:churchgroupsmanagement/screens/calendars/duplicate_event.dart';
import 'package:churchgroupsmanagement/screens/calendars/edit_activity_in_calendar.dart';
import 'package:churchgroupsmanagement/screens/calendars/mass_delete_activities.dart';
import 'package:churchgroupsmanagement/screens/calendars/publish_calendar.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SingleCalendarofEvents extends StatefulWidget {
  const SingleCalendarofEvents({super.key});

  @override
  State<SingleCalendarofEvents> createState() => _SingleCalendarofEventsState();
}

class _SingleCalendarofEventsState extends State<SingleCalendarofEvents> {
  final List<String> monthsList = [
    'October 2023',
    'November 2023',
    'December 2023',
    'January 2024',
    'February 2024',
    'March 2024',
    'April 2024',
    'May 2024',
    'June 2024',
    'July 2024',
    'August 2024',
    'September 2024',
  ];

  int scrollingTabView = 0;
  PanelController panelController = PanelController();

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
              width: ScreenDimension().screenWidth(context) * 0.50,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Church Year 2023 - 2024",
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
        actions: [
          IconButton(
            onPressed: () async {
              panelController.isPanelOpen
                  ? await panelController.close()
                  : await panelController.open();
            },
            icon: Icon(
              !panelController.isAttached
                  ? CupertinoIcons.rectangle_3_offgrid
                  : panelController.isPanelOpen
                      ? CupertinoIcons.rectangle_3_offgrid
                      : CupertinoIcons.list_bullet,
              color: AppDecorations().mainBlueColor,
              size: 25,
            ),
          ),
          PopupMenuButton(
            padding: const EdgeInsets.all(8).copyWith(right: 0),
            color: Theme.of(context).scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            icon: Icon(
              CupertinoIcons.ellipsis_vertical,
              color: AppDecorations().mainBlueColor,
              size: 25,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return const CalendarEventsInfo();
                    }));
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/info.svg",
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      const Text("Calendar Details"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return const AddActivityToCalendar();
                    }));
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/apps_add_outline.svg",
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      const Text("Add Event to Calendar"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return const MassDeleteCalendarActivities();
                    }));
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/menu_burger.svg",
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      const Text("Mass Manage Activities"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return const PublishCalendarToOffice();
                    }));
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/signature.svg",
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      const Text("Publish Calendar of Events"),
                    ],
                  ),
                ),
                const PopupMenuItem(child: PopupMenuDivider()),
                PopupMenuItem(
                  onTap: () {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.loading,
                      text: "Preparing calendar of events...",
                      autoCloseDuration: const Duration(seconds: 3),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/share_outline.svg",
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      const Text("Export & Share Calendar"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      barrierDismissible: false,
                      title: "Are you sure?",
                      text:
                          "You are about to send a request to the admin to delete records for this meeting from the database!",
                      confirmBtnColor: AppDecorations().mainBlueColor,
                      confirmBtnText: "Keep It",
                      showCancelBtn: true,
                      cancelBtnText: "Delete",
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
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/delete_document_outline.svg",
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Request Calendar Delete",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SlidingUpPanel(
        controller: panelController,
        color: Theme.of(context).scaffoldBackgroundColor,
        minHeight: ScreenDimension().screenHeight(context) * 0.0,
        maxHeight: ScreenDimension().screenHeight(context) * 0.9,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        body: MasonryGridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).padding.bottom +
                ScreenDimension().screenHeight(context) * 0.1 +
                10,
          ),
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: monthsList.length,
          itemBuilder: (context, monthsIndex) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  scrollingTabView = monthsIndex;
                });
                panelController.open();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(
                  monthsIndex.isOdd ? 5 : 0,
                  10,
                  monthsIndex.isOdd ? 0 : 5,
                  10,
                ),
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppDecorations().mainBlueColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          monthsList[monthsIndex],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppDecorations().mainBlueColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: sampleCalendarBudget
                              .where((activity) =>
                                  activity["month"] == monthsList[monthsIndex])
                              .isEmpty
                          ? Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/emptylist.png",
                                    width: 60,
                                    height: 60,
                                    color: AppDecorations()
                                        .mainBlueColor
                                        .withOpacity(0.3),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 6),
                                    child: Text(
                                      "No activities added to this month",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                              shrinkWrap: true,
                              itemCount: sampleCalendarBudget
                                  .where((activity) =>
                                      activity["month"] ==
                                      monthsList[monthsIndex])
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text(
                                  "${index + 1}. ${sampleCalendarBudget.where((activity) => activity["month"] == monthsList[monthsIndex]).toList()[index]["title"]}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    height: 2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              },
                            ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        panelBuilder: (scrollConroller) {
          return PreviewPanel(
            scrollController: scrollConroller,
            monthTabs: monthsList,
            monthIndex: scrollingTabView,
          );
        },
      ),
    );
  }
}

class PreviewPanel extends StatefulWidget {
  const PreviewPanel({
    super.key,
    required this.scrollController,
    required this.monthTabs,
    required this.monthIndex,
  });

  final ScrollController scrollController;
  final List<String> monthTabs;
  final int monthIndex;

  @override
  State<PreviewPanel> createState() => _PreviewPanelState();
}

class _PreviewPanelState extends State<PreviewPanel>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: widget.monthTabs.length,
      vsync: this,
      initialIndex: widget.monthIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
            indicator: BoxDecoration(
              color: AppDecorations().mainBlueColor,
              borderRadius: BorderRadius.circular(5),
            ),
            labelColor: const Color.fromARGB(255, 255, 255, 255),
            unselectedLabelColor: const Color.fromARGB(255, 144, 143, 143),
            controller: tabController,
            tabs: List.generate(
              widget.monthTabs.length,
              (index) => Tab(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.monthTabs[index]
                          .split(" ")[0]
                          .substring(0, 3)
                          .toUpperCase(),
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      widget.monthTabs[index].split(" ")[1],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: List.generate(
                widget.monthTabs.length,
                (index) {
                  return sampleCalendarBudget
                          .where((activity) =>
                              activity["month"] == widget.monthTabs[index])
                          .toList()
                          .isEmpty
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/emptylist.png",
                                width: ScreenDimension().screenWidth(context) *
                                    0.5,
                                color: AppDecorations()
                                    .mainBlueColor
                                    .withOpacity(0.2),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(5, 20, 5, 6),
                                child: Text(
                                  "No activities added to this month",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ActivitiesPerMonthList(
                          eventsPerMonthList: sampleCalendarBudget
                              .where((activity) =>
                                  activity["month"] == widget.monthTabs[index])
                              .toList(),
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActivitiesPerMonthList extends StatefulWidget {
  const ActivitiesPerMonthList({super.key, required this.eventsPerMonthList});

  final List<Map<String, dynamic>> eventsPerMonthList;

  @override
  State<ActivitiesPerMonthList> createState() => _ActivitiesPerMonthListState();
}

class _ActivitiesPerMonthListState extends State<ActivitiesPerMonthList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.eventsPerMonthList.length,
      itemBuilder: (context, index) {
        return IndividualActivityDetails(
          singleEvent: widget.eventsPerMonthList[index],
        );
      },
    );
  }
}

class IndividualActivityDetails extends StatelessWidget {
  const IndividualActivityDetails({super.key, required this.singleEvent});

  final Map<String, dynamic> singleEvent;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
        child: SizedBox(
          width: ScreenDimension().screenWidth(context) - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: ScreenDimension().screenWidth(context) * 0.7,
                      child: Text(
                        singleEvent["title"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoActionSheet(
                              title: Text(
                                singleEvent["title"],
                                style: const TextStyle(),
                              ),
                              message: const Text(
                                "Choose from the management options below to make changes to the calendar or just this activity.",
                                style: TextStyle(),
                              ),
                              actions: [
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.of(context).push(
                                        CupertinoPageRoute(builder: (context) {
                                      return const EditCalendarActivity();
                                    }));
                                  },
                                  child: const Text(
                                    "Update Activity",
                                    style: TextStyle(),
                                  ),
                                ),
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.of(context).push(
                                        CupertinoPageRoute(builder: (context) {
                                      return const DuplicateCalendarEvent();
                                    }));
                                  },
                                  child: const Text(
                                    "Duplicate Activity",
                                    style: TextStyle(),
                                  ),
                                ),
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.error,
                                      barrierDismissible: false,
                                      title: "Are you sure?",
                                      text:
                                          "You are about to delete this activity from the existing calendar of activities. The same changes will be reflected on the database!",
                                      confirmBtnColor:
                                          AppDecorations().mainBlueColor,
                                      confirmBtnText: "Keep It",
                                      showCancelBtn: true,
                                      cancelBtnText: "Delete",
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
                                  isDestructiveAction: true,
                                  child: const Text(
                                    "Delete Activity",
                                    style: TextStyle(),
                                  ),
                                ),
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                isDefaultAction: true,
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  "Close Dialog",
                                  style: TextStyle(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Icon(
                        CupertinoIcons.question_circle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.only(left: 5),
                padding: const EdgeInsets.only(left: 10),
                width: ScreenDimension().screenWidth(context) - 80,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 5,
                      color: AppDecorations().mainBlueColor,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Objectives",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 1.8,
                      ),
                    ),
                    singleEvent["objectives"].toList().isEmpty
                        ? const Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Text(
                              "No objectives have been listed to be achieved from this activity",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                singleEvent["objectives"].toList().length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                "${index + 1}. ${singleEvent["objectives"][index]}",
                                style: const TextStyle(
                                  fontSize: 13,
                                  height: 1.7,
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
              singleEvent["requirements"].toList().isEmpty
                  ? const Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text(
                        "No requirements have been listed to be needed to facilitate this activity",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
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
    );
  }
}
