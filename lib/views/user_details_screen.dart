import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rsao/utils/app_constants.dart';

class UserDetailsScreen extends StatelessWidget {
  final Function saveUserInfo;
  const UserDetailsScreen({super.key, required this.saveUserInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: Image.asset(
                  'images/mask.png',
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.helloNiceToMeetYou,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Text(
                      AppConstants.introYourself,
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 3,
                              blurRadius: 3)
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 1,
                            height: 55,
                            color: Colors.black.withOpacity(0.2),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                onSubmitted: (String name) {
                                  saveUserInfo(name);
                                },
                                decoration: InputDecoration(
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                                    hintText: AppConstants.enterYourName,
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 12),
                            children: [
                              const TextSpan(
                                text: "${AppConstants.byCreating} ",
                              ),
                              TextSpan(
                                  text: "${AppConstants.termsOfService} ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold)),
                              const TextSpan(
                                text: "and ",
                              ),
                              TextSpan(
                                  text: "${AppConstants.privacyPolicy} ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold)),
                            ]),
                      ),
                    )
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
