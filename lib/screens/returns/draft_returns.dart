import 'package:churchgroupsmanagement/data/sample_funds.dart';
import 'package:churchgroupsmanagement/screens/returns/returns_single.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DraftReturnsList extends StatefulWidget {
  const DraftReturnsList({super.key});

  @override
  State<DraftReturnsList> createState() => _DraftReturnsListState();
}

class _DraftReturnsListState extends State<DraftReturnsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
        child: SingleChildScrollView(
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: List.generate(
              sampleReqReturns.length,
              (index) => TableRow(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: index.isEven
                      ? Colors.grey.withOpacity(0.2)
                      : index.isOdd
                          ? Colors.white.withOpacity(0.3)
                          : Colors.grey.withOpacity(0.2),
                ),
                children: [
                  TableCell(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(CupertinoPageRoute(builder: (context) {
                          return const ExpenditureReturnsDetails();
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sampleReqReturns[index]["title"],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  "Returns Created on ${DateFormat.yMMMEd().format(sampleReqReturns[index]["creationDate"])} from ${DateFormat.jm().format(sampleReqReturns[index]["creationDate"])}",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Tap to view records of this expenditure return...",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
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
          ),
        ),
      ),
    );
  }
}
