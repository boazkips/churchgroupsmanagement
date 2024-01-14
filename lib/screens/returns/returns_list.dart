import 'package:churchgroupsmanagement/screens/returns/approved_returns.dart';
import 'package:churchgroupsmanagement/screens/returns/create_new_return.dart';
import 'package:churchgroupsmanagement/screens/returns/draft_returns.dart';
import 'package:churchgroupsmanagement/screens/returns/prepared_returns.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllReturnForms extends StatefulWidget {
  const AllReturnForms({super.key});

  @override
  State<AllReturnForms> createState() => _AllReturnFormsState();
}

class _AllReturnFormsState extends State<AllReturnForms>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
            return const CreateExpenditureReturn();
          }));
        },
        backgroundColor: AppDecorations().mainBlueColor,
        label: const Text(
          "New Return",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
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
              width: ScreenDimension().screenWidth(context) * 0.60,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Expenditure Returns",
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
        bottom: TabBar(
          controller: tabController,
          isScrollable: false,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          indicatorPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(
              text: "Confirmed",
            ),
            Tab(
              text: "Prepared",
            ),
            Tab(
              text: "Drafts",
            ),
          ],
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: 0.5,
            color: Colors.grey,
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            fontSize: 14,
            color: AppDecorations().mainBlueColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.search),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          ApprovedReturnsList(),
          PreparedReturnsList(),
          DraftReturnsList(),
        ],
      ),
    );
  }
}
