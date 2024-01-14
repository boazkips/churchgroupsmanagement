import 'package:churchgroupsmanagement/screens/root_navigation.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPageAppBar extends StatelessWidget {
  const MainPageAppBar({
    super.key,
    required this.pageTitle,
    this.pageSubtitle = "",
    this.onTapSearch,
    this.onTapAdd,
    this.hasSubtext = true,
    this.hasRightButtons = true,
  });

  final String pageTitle;
  final String? pageSubtitle;
  final void Function()? onTapSearch;
  final void Function()? onTapAdd;
  final bool hasSubtext;
  final bool hasRightButtons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenDimension().screenWidth(context),
      height: ScreenDimension().screenHeight(context) * 0.13,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          15,
          MediaQuery.of(context).padding.top,
          20,
          0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
              hasSubtext ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => zoomDrawerController.toggle!(),
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: AppDecorations().mainBlueColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/menu_burger.svg",
                      color: Colors.white,
                      width: 17,
                      height: 17,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: hasSubtext
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: hasSubtext ? 0 : 10),
                      child: Text(
                        pageTitle,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.7,
                          height: 1.5,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    hasSubtext
                        ? Text(
                            pageSubtitle!,
                            style: const TextStyle(
                              letterSpacing: 0.7,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
            hasRightButtons
                ? Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: onTapSearch!,
                          child: Icon(
                            CupertinoIcons.search,
                            color: AppDecorations().mainBlueColor,
                            size: 25,
                          ),
                        ),
                        const SizedBox(width: 25),
                        GestureDetector(
                          onTap: onTapAdd!,
                          child: Image.asset(
                            "assets/icons/people.png",
                            color: AppDecorations().mainBlueColor,
                            width: 25,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
