import 'package:churchgroupsmanagement/data/sample_funds.dart';
import 'package:churchgroupsmanagement/screens/requisitions/requisitions_single.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApprovedRequisitionsList extends StatefulWidget {
  const ApprovedRequisitionsList({super.key});

  @override
  State<ApprovedRequisitionsList> createState() =>
      _ApprovedRequisitionsListState();
}

class _ApprovedRequisitionsListState extends State<ApprovedRequisitionsList> {
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
                          return const ExpenseRequisitionDetails();
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
                                  "Requisition Approved on ${DateFormat.yMMMEd().format(sampleReqReturns[index]["creationDate"])} from ${DateFormat.jm().format(sampleReqReturns[index]["creationDate"])}",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Tap to view records of this expense requisition...",
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
