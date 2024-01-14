import 'package:churchgroupsmanagement/screens/contact_support.dart';
import 'package:churchgroupsmanagement/screens/home_landing_screen.dart';
import 'package:churchgroupsmanagement/screens/reports/acitivity_reports_list.dart';
import 'package:churchgroupsmanagement/screens/budgets/budgets_list.dart';
import 'package:churchgroupsmanagement/screens/calendars/calendar_events_list.dart';
import 'package:churchgroupsmanagement/screens/minutes/minutes_list.dart';
import 'package:churchgroupsmanagement/screens/requisitions/requisitions_list.dart';
import 'package:churchgroupsmanagement/screens/returns/returns_list.dart';
import 'package:churchgroupsmanagement/screens/settings_security.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AppRootNavigation extends StatefulWidget {
  const AppRootNavigation({super.key});

  @override
  State<AppRootNavigation> createState() => _AppRootNavigationState();
}

final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

class _AppRootNavigationState extends State<AppRootNavigation> {
  int currentSelectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return ZoomMenuScreen(
            currentSelectedScreen: currentSelectedScreen,
            onSelectedMenuItem: (menuItem) {
              setState(() {
                currentSelectedScreen = menuItem;
              });
              zoomDrawerController.close!();
            },
          );
        },
      ),
      mainScreen: getSelectedScreen(),
      mainScreenOverlayColor: Colors.black.withOpacity(0.5),
      controller: zoomDrawerController,
      borderRadius: 30,
      style: DrawerStyle.style1,
      showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.8,
      menuScreenWidth: MediaQuery.of(context).size.width,
      duration: const Duration(milliseconds: 500),
      angle: 0.0,
      androidCloseOnBackTap: true,
      menuScreenTapClose: true,
      mainScreenTapClose: true,
    );
  }

  Widget getSelectedScreen() {
    switch (currentSelectedScreen) {
      case 0:
        return const HomeLandingScreen();
      case 1:
        return const SettingsSecurity();
      case 2:
        return const ContactSupport();
      case 3:
        return const AllGroupMinutes();
      case 4:
        return const AllActivityReports();
      case 5:
        return const AllCalendarEvents();
      case 6:
        return const AllGroupBudgets();
      case 7:
        return const AllExpenseRequisitions();
      case 8:
        return const AllReturnForms();
      default:
        return const HomeLandingScreen();
    }
  }
}

class ZoomMenuScreen extends StatelessWidget {
  const ZoomMenuScreen({
    super.key,
    required this.currentSelectedScreen,
    required this.onSelectedMenuItem,
  });

  final int currentSelectedScreen;
  final ValueChanged<int> onSelectedMenuItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/icons/user.png",
                          width: 35,
                          height: 35,
                        ),
                        const SizedBox(width: 15),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Isabel Ramirez",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 66, 65, 65),
                              ),
                            ),
                            Text(
                              "Secretary - Woman's Guild",
                              style: TextStyle(
                                fontSize: 13,
                                height: 2,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 66, 65, 65),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(appMenuItemsList[0], 0),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  buildMenuItem(appMenuItemsList[1], 1),
                  buildMenuItem(appMenuItemsList[2], 2),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  ...appMenuItemsList
                      .skip(3)
                      .map((item) => buildMenuItem(
                            item,
                            appMenuItemsList.indexOf(item),
                          ))
                      .toList(),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(
                15,
                0,
                15,
                MediaQuery.of(context).padding.bottom + 10,
              ),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: AppDecorations().mainBlueColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Sign out",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItem menuItem, int menuItemIndex) {
    return ListTileTheme(
      selectedTileColor: const Color.fromARGB(255, 230, 229, 229),
      textColor: const Color.fromARGB(255, 66, 65, 65),
      selectedColor: AppDecorations().mainBlueColor,
      child: ListTile(
        horizontalTitleGap:
            menuItem.itemIcon != null && menuItem.selectedItemIcon != null
                ? 10
                : -20,
        visualDensity: VisualDensity.compact,
        selected: currentSelectedScreen == menuItemIndex,
        leading: menuItem.itemIcon != null && menuItem.selectedItemIcon != null
            ? Icon(
                currentSelectedScreen == menuItemIndex
                    ? menuItem.selectedItemIcon
                    : menuItem.itemIcon,
                color: currentSelectedScreen == menuItemIndex
                    ? AppDecorations().mainBlueColor
                    : Colors.black,
                size: 18,
              )
            : const SizedBox(),
        title: Text(
          menuItem.itemTitle,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () => onSelectedMenuItem(menuItemIndex),
      ),
    );
  }
}

List<MenuItem> appMenuItemsList = <MenuItem>[
  MenuItem(
      itemTitle: "Home",
      itemIcon: CupertinoIcons.house_alt,
      selectedItemIcon: CupertinoIcons.house_alt_fill),
  MenuItem(
      itemTitle: "Settings and Security",
      itemIcon: CupertinoIcons.gear_alt,
      selectedItemIcon: CupertinoIcons.gear_alt_fill),
  MenuItem(
      itemTitle: "Contact Support",
      itemIcon: CupertinoIcons.chat_bubble_2,
      selectedItemIcon: CupertinoIcons.chat_bubble_2_fill),
  MenuItem(
    itemTitle: "Meeting Minutes",
  ),
  MenuItem(
    itemTitle: "Group Activity Reports",
  ),
  MenuItem(
    itemTitle: "Calendar of Events",
  ),
  MenuItem(
    itemTitle: "Group Budget",
  ),
  MenuItem(
    itemTitle: "Expense Requisitions",
  ),
  MenuItem(
    itemTitle: "Expenditure Returns",
  ),
];

class MenuItem {
  final String itemTitle;
  final IconData? itemIcon;
  final IconData? selectedItemIcon;

  MenuItem({
    required this.itemTitle,
    this.itemIcon,
    this.selectedItemIcon,
  });
}
