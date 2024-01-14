import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

class ReturnApprovalStatus extends StatefulWidget {
  const ReturnApprovalStatus({super.key});

  @override
  State<ReturnApprovalStatus> createState() => _ReturnApprovalStatusState();
}

class _ReturnApprovalStatusState extends State<ReturnApprovalStatus> {
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
                      "Return Approval Status",
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
                    "Community Outreach Day",
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
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Text(
                "Track the approval status for this expenditure return. Officials will be notified of any updates to the status of the document. Signing the document will take place in hierarchy.In case of any challenges you can contact the Support Team.",
                style: TextStyle(),
              ),
            ),
            ApprovalStatusCard(
              churchOfficial: "Treasurer's Approval",
              approvalStatus:
                  "Mrs. Maryann Macharia signed this document on Saturday, 22nd Jan 2023 at 7:34 PM",
              isOfficialSigned: true,
            ),
            ApprovalStatusCard(
              churchOfficial: "Secretary's Approval",
              approvalStatus:
                  "This expenditure return has not been signed off by the Secretary. Tap the button below to sign it.",
              isOfficialSigned: false,
              showApprovalButton: true,
            ),
            ApprovalStatusCard(
              churchOfficial: "Chairperson's Approval",
              approvalStatus:
                  "Waiting for other officials to sign off on this document before the approval process can proceed.",
              isOfficialSigned: false,
            ),
            ApprovalStatusCard(
              churchOfficial: "Patron's Approval",
              approvalStatus:
                  "Waiting for other officials to sign off on this document before the approval process can proceed.",
              isOfficialSigned: false,
            ),
            ApprovalStatusCard(
              churchOfficial: "Finance Chair's Approval",
              approvalStatus:
                  "Waiting for other officials to sign off on this document before the approval process can proceed.",
              isOfficialSigned: false,
            ),
            ApprovalStatusCard(
              churchOfficial: "Session Clerk's Approval",
              approvalStatus:
                  "Waiting for other officials to sign off on this document before the approval process can proceed.",
              isOfficialSigned: false,
            ),
          ],
        ),
      ),
    );
  }
}

class ApprovalStatusCard extends StatelessWidget {
  const ApprovalStatusCard({
    super.key,
    required this.churchOfficial,
    this.showApprovalButton = false,
    required this.approvalStatus,
    required this.isOfficialSigned,
  });

  final String churchOfficial;
  final bool showApprovalButton;
  final bool isOfficialSigned;
  final String approvalStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      //surfaceTintColor: Colors.transparent,
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 7,
              color: AppDecorations().mainBlueColor,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                isOfficialSigned
                    ? "assets/images/checked.png"
                    : "assets/images/wall-clock.png",
                width: 30,
                color: Colors.grey,
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: ScreenDimension().screenWidth(context) * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      churchOfficial,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      approvalStatus,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 137, 136, 136),
                        height: 1.7,
                      ),
                    ),
                    showApprovalButton
                        ? GestureDetector(
                            onTap: () {
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.loading,
                                text:
                                    "Appending signature to expenditure return...",
                                autoCloseDuration: const Duration(seconds: 3),
                              );
                            },
                            child: Container(
                              width: double.maxFinite,
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppDecorations().mainBlueColor,
                              ),
                              child: const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15, 8, 15, 8),
                                child: Text(
                                  "Approve Expenditure Return",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
