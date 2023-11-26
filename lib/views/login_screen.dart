import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:rsao/global/global.dart';
import 'package:rsao/utils/app_constants.dart';
import 'package:rsao/viewmodels/login_viewmodel.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppConstants.getMovingWithGreenTaxi,
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Consumer<LoginViewModel>(
                      builder: (
                        BuildContext context,
                        LoginViewModel loginViewModel,
                        Widget? child,
                      ) {
                        return Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  spreadRadius: 2,
                                  blurRadius: 5)
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () => context
                                      .read<LoginViewModel>()
                                      .onCountryChange(context),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      CountryCodeFlagWidget(
                                        countryCode: loginViewModel.countryCode,
                                        width: 32,
                                        alignment: Alignment.centerLeft,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        loginViewModel.countryCode.dialCode,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      ),
                                      const Icon(
                                          Icons.keyboard_arrow_down_rounded)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 55,
                                color: Colors.black.withOpacity(0.2),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextField(
                                    keyboardType: TextInputType.phone,
                                    onSubmitted: (String phoneNumber) => context
                                        .read<LoginViewModel>()
                                        .signInWithMobileNumber(
                                            phoneNumber: phoneNumber,
                                            context: context),
                                    decoration: InputDecoration(
                                        hintStyle: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                        hintText:
                                            AppConstants.enterMobileNumber,
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          children: [
                            const TextSpan(
                              text: "${AppConstants.byCreating} ",
                            ),
                            TextSpan(
                              text: "${AppConstants.termsOfService} ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(
                              text: "and ",
                            ),
                            TextSpan(
                              text: "${AppConstants.privacyPolicy} ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
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
