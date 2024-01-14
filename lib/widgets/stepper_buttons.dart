import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/material.dart';

class CustomStepperButtons extends StatelessWidget {
  const CustomStepperButtons({
    super.key,
    required this.onTapContinue,
    required this.onTapCancel,
    required this.continueText,
    required this.cancelText,
  });

  final void Function() onTapContinue;
  final void Function() onTapCancel;
  final String continueText;
  final String cancelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.all(5),
          //   child: Divider(
          //     thickness: 1,
          //     color: Colors.black,
          //   ),
          // ),
          // const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: onTapContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppDecorations().mainBlueColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  continueText,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: onTapCancel,
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide(
                    width: 1,
                    color: AppDecorations().mainBlueColor,
                  ),
                ),
                child: Text(
                  cancelText,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    color: AppDecorations().mainBlueColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
