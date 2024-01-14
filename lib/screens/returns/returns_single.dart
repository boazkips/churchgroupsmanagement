import 'package:churchgroupsmanagement/screens/returns/approval_status.dart';
import 'package:churchgroupsmanagement/screens/returns/edit_selected_return.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpenditureReturnsDetails extends StatefulWidget {
  const ExpenditureReturnsDetails({super.key});

  @override
  State<ExpenditureReturnsDetails> createState() =>
      _ExpenditureReturnsDetailsState();
}

class _ExpenditureReturnsDetailsState extends State<ExpenditureReturnsDetails> {
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
                      "Community Outreach Day",
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
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const UpdateExpenditureReturn();
              }));
            },
            icon: Icon(
              CupertinoIcons.pencil_outline,
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
                      return const UpdateExpenditureReturn();
                    }));
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/file_edit_outline.svg",
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      const Text("Update Return"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return const ReturnApprovalStatus();
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
                      const Text("Approval Status"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/signature.svg",
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      const Text("Publish Return"),
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
                      const Text("Export & Share Return"),
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
                        "Request Return Delete",
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
    );
  }
}
