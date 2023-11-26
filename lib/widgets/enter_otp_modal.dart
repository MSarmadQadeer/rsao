import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rsao/utils/app_constants.dart';

class EnterOTPModal extends StatelessWidget {
  final String verificationId;
  final Function onSubmitOTP;
  EnterOTPModal({
    super.key,
    required this.verificationId,
    required this.onSubmitOTP,
  });

  final TextEditingController _codecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Enter OTP",
        style: GoogleFonts.poppins(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _codecontroller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: AppConstants.enterOtp,
              hintStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors
                      .black, // set the color of the bottom border when the TextField is active
                ),
              ),
            ),
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => onSubmitOTP(
            context: context,
            verificationId: verificationId,
            smsCode: _codecontroller.text,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(
                0xFFC4FF61), // set the background color of the button // set the elevation of the button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  10), // set the rounded corners of the button
            ),
          ),
          child: const Text(
            'Done',
            style: TextStyle(
              color: Color(0xFF1A1A1A), // set the text color of the button
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
