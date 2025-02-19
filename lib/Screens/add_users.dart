import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offiql/Extension/theme.dart';
import 'package:provider/provider.dart';

import '../Provider/user.dart';
import '../Utils/customize_style.dart';

class AddUsers extends StatelessWidget {
  const AddUsers({super.key});

  @override
  Widget build(BuildContext context) {
    OffiqlCustomizeStyle appStyle = OffiqlCustomizeStyle();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: context.backgroundColor,
        statusBarIconBrightness:
            context.isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );

    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: context.backgroundColor,
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: appStyle.offiqlIcon(
                  Icons.arrow_back,
                  color: context.textColor,
                  sizeOfIcon: appStyle.sizes.textMultiplier * 3.0,
                ),
              ),
              title: Text(
                'Add User',
                style: appStyle.subHeaderStyle(
                  size: appStyle.sizes.textMultiplier * 2.5,
                  fontWeight: FontWeight.bold,
                  color: context.textColor,
                ),
              ),
              centerTitle: true,
              backgroundColor: context.backgroundColor,
              surfaceTintColor: Colors.transparent,
            ),
            body: SafeArea(
              child: Padding(
                padding: appStyle.offiqlAllScreenPadding(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome! Please enter your details.",
                        style: appStyle.subHeaderStyle(
                          color: context.textColor,
                          fontWeight: FontWeight.bold,
                          size: appStyle.sizes.textMultiplier * 2.5,
                        ),
                      ),
                      appStyle.offiqlVerticalGap(verticalGapSizeInPercent: 2.5),
                      appStyle.offiqlTextField(
                        controller: userProvider.nameController,
                        labelText: "Enter your name",
                        cursorColor: context.textColor,
                        textColor: context.textColor,
                        prefixIcon: Icons.person_2_outlined,
                        colorPrefix: Colors.deepPurpleAccent,
                        unFocusColor: Colors.grey.shade800,
                        focusColor: Colors.grey.shade400,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: appStyle.sizes.verticalBlockSize * 2,
                          horizontal: appStyle.sizes.horizontalBlockSize * 2,
                        ),
                      ),
                      appStyle.offiqlVerticalGap(verticalGapSizeInPercent: 2.5),
                      appStyle.offiqlTextField(
                        controller: userProvider.emailController,
                        labelText: "Enter your email",
                        unFocusColor: Colors.grey.shade800,
                        focusColor: Colors.grey.shade400,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: appStyle.sizes.verticalBlockSize * 2,
                          horizontal: appStyle.sizes.horizontalBlockSize * 2,
                        ),
                        textColor: context.textColor,
                        cursorColor: context.textColor,
                        prefixIcon: Icons.email_outlined,
                        colorPrefix: Colors.deepPurpleAccent,
                        suffixIcon: userProvider.isCorrectEmail != null &&
                                userProvider.isCorrectEmail!
                            ? Icons.check_circle_outline
                            : null,
                        colorSuffix: Colors.deepPurpleAccent,
                        onChangedText: (value) {
                          userProvider.validateEmail(value);
                        },
                      ),
                      appStyle.offiqlVerticalGap(verticalGapSizeInPercent: 2.5),
                      appStyle.offiqlTextField(
                        controller: userProvider.contactController,
                        labelText: "Contact number (+91)(10 digit)",
                        keyboardType: TextInputType.phone,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: appStyle.sizes.verticalBlockSize * 2,
                          horizontal: appStyle.sizes.horizontalBlockSize * 2,
                        ),
                        textColor: context.textColor,
                        cursorColor: context.textColor,
                        unFocusColor: Colors.grey.shade800,
                        focusColor: Colors.grey.shade400,
                        prefixIcon: Icons.phone_outlined,
                        colorPrefix: Colors.deepPurpleAccent,
                        suffixIcon: userProvider.isCorrectContact != null &&
                                userProvider.isCorrectContact!
                            ? Icons.check_circle_outline
                            : null,
                        colorSuffix: Colors.deepPurpleAccent,
                        onChangedText: (value) {
                          userProvider.validateContact(value);
                          if (userProvider.isCorrectContact == true) {
                            FocusManager.instance.primaryFocus?.nextFocus();
                          }
                        },
                      ),
                      appStyle.offiqlVerticalGap(verticalGapSizeInPercent: 3.5),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: appStyle.offiqlAllScreenPadding(),
              child: appStyle.offiqlElevatedButton(
                onPressed: () => userProvider.handleSubmit(context),
                widthInPercent: 100,
                heightInPercent: 6,
                backgroundColor: Colors.deepPurpleAccent,
                childOfButton: Text(
                  userProvider.isSubmitting ? "Submitting..." : "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: appStyle.sizes.textMultiplier * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
