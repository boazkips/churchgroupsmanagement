import 'dart:math';

import 'package:churchgroupsmanagement/screens/budgets/budgets_single.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AllGroupBudgets extends StatefulWidget {
  const AllGroupBudgets({super.key});

  @override
  State<AllGroupBudgets> createState() => _AllGroupBudgetsState();
}

class _AllGroupBudgetsState extends State<AllGroupBudgets> {
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
                      "Group Budgets",
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
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.search),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 25),
        children: const [
          SingleBudgetListItem(
            budgetStatus: "Proposed",
            budgetYear: "2023 - 2024",
            budgetTotal: "378,500",
          ),
          SingleBudgetListItem(
            budgetStatus: "Current",
            budgetYear: "2022 - 2023",
            budgetTotal: "240,760",
          ),
          SingleBudgetListItem(
            budgetStatus: "Closed",
            budgetYear: "2021 - 2022",
            budgetTotal: "200,540",
          ),
          SingleBudgetListItem(
            budgetStatus: "Closed",
            budgetYear: "2020 - 2021",
            budgetTotal: "150,290",
          ),
          SingleBudgetListItem(
            budgetStatus: "Closed",
            budgetYear: "2019 - 2020",
            budgetTotal: "200,180",
          ),
        ],
      ),
    );
  }
}

class SingleBudgetListItem extends StatelessWidget {
  const SingleBudgetListItem({
    super.key,
    required this.budgetYear,
    required this.budgetTotal,
    required this.budgetStatus,
  });

  final String budgetYear;
  final String budgetTotal;
  final String budgetStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return const SingleGroupBudget();
        }));
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
        elevation: 1,
        child: Stack(
          children: [
            Container(
              width: ScreenDimension().screenWidth(context),
              height: ScreenDimension().screenHeight(context) * 0.16,
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 12, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Financial Year",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            budgetYear,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: budgetStatus == "Proposed"
                      ? Colors.amber
                      : budgetStatus == "Current"
                          ? Colors.green
                          : Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
                  child: Text(
                    budgetStatus.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 10),
                width: ScreenDimension().screenWidth(context) - 30,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 3),
                    Text(
                      "KShs. $budgetTotal proposed total",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    LinearPercentIndicator(
                      lineHeight: 7.0,
                      progressColor: AppDecorations().mainBlueColor,
                      percent: Random().nextDouble(),
                      padding: const EdgeInsets.only(right: 10),
                      barRadius: const Radius.circular(3),
                      trailing: Text(
                        "${Random().nextInt(100)}% utilised!",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
