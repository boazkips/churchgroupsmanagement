import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:churchgroupsmanagement/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsSecurity extends StatefulWidget {
  const SettingsSecurity({super.key});

  @override
  State<SettingsSecurity> createState() => _SettingsSecurityState();
}

class _SettingsSecurityState extends State<SettingsSecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainPageAppBar(
            pageTitle: "Settings & Security",
            hasRightButtons: false,
            hasSubtext: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: ScreenDimension()
                  .defaultScreenPadding(context)
                  .copyWith(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(7, 10, 5, 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 232, 232, 232),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              width:
                                  ScreenDimension().screenWidth(context) * 0.75,
                              child: const Text(
                                "Isabel Ramirez",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 66, 65, 65),
                                ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  ScreenDimension().screenWidth(context) * 0.75,
                              child: const Text(
                                "Secretary - Woman's Guild (Parish Office)",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 2,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 66, 65, 65),
                                ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  ScreenDimension().screenWidth(context) * 0.75,
                              child: const Text(
                                "Chairperson - Youth (Parish Office)",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 2,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 66, 65, 65),
                                ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  ScreenDimension().screenWidth(context) * 0.75,
                              child: const Text(
                                "Chairperson - Youth (PCEA Kiamumbi Church)",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 2,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 66, 65, 65),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Office Tools",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/chart_simple_filled.svg",
                                width: 22,
                                height: 22,
                                color: AppDecorations().mainBlueColor,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "Office Activity Stats",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/angle_right.svg",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/template.svg",
                                width: 22,
                                height: 22,
                                color: AppDecorations().mainBlueColor,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "Document Templates",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/angle_right.svg",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/question_mark.png",
                                width: 22,
                                height: 22,
                                color: AppDecorations().mainBlueColor,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "How To Use The App",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/angle_right.svg",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/settings_general.svg",
                                width: 22,
                                height: 22,
                                color: AppDecorations().mainBlueColor,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "General",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/angle_right.svg",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/bell_filled.svg",
                                width: 22,
                                height: 22,
                                color: AppDecorations().mainBlueColor,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "Notifications",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/angle_right.svg",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/universal_access.svg",
                                width: 22,
                                height: 22,
                                color: AppDecorations().mainBlueColor,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "App Accessibility",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/angle_right.svg",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Other",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/info.svg",
                                width: 22,
                                height: 22,
                                color: AppDecorations().mainBlueColor,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "About",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/angle_right.svg",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/signature.svg",
                                width: 22,
                                height: 22,
                                color: AppDecorations().mainBlueColor,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "Terms of Service",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/angle_right.svg",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/user_lock.svg",
                                width: 22,
                                height: 22,
                                color: AppDecorations().mainBlueColor,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/angle_right.svg",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Copyright ©️2023 Pixill Illustration Studios. All Rights Reserved",
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
