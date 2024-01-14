import 'package:churchgroupsmanagement/data/sample_budget.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class PublishCalendarToOffice extends StatefulWidget {
  const PublishCalendarToOffice({super.key});

  @override
  State<PublishCalendarToOffice> createState() =>
      _PublishCalendarToOfficeState();
}

class _PublishCalendarToOfficeState extends State<PublishCalendarToOffice> {
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
              width: ScreenDimension().screenWidth(context) * 0.80,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Submit Calendar For Approval",
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
                    "Church Year 2023 - 2024",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GroupedListView(
            shrinkWrap: true,
            sort: false,
            elements: sampleCalendarBudget,
            groupBy: (eachActivity) => eachActivity["month"],
            groupHeaderBuilder: (element) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  element["month"],
                  style: const TextStyle(),
                ),
              );
            },
            itemBuilder: (context, element) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  element["title"],
                  style: const TextStyle(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
