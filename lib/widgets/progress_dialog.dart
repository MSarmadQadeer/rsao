import 'package:flutter/material.dart';
import 'package:rsao/utils/colors.dart';

class ProgressDialog extends StatelessWidget {
  final String? message;
  const ProgressDialog({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(6),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const SizedBox(
                width: 6.0,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.greenColor),
              ),
              const SizedBox(
                width: 26.0,
              ),
              Text(
                message!,
                style: const TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
