import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offiql/Extension/theme.dart';
import 'package:offiql/Models/user_model.dart';
import 'package:shimmer/shimmer.dart';

import '../Utils/customize_style.dart';

class UserDetailsScreen extends StatefulWidget {
  final UserModel user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  OffiqlCustomizeStyle appStyle = OffiqlCustomizeStyle();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.deepPurpleAccent,
        statusBarIconBrightness:
            context.isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: appStyle.offiqlIcon(Icons.arrow_back,
              color: Colors.white,
              sizeOfIcon: appStyle.sizes.textMultiplier * 3.0),
        ),
        title: Text(
          'User Details',
          style: appStyle.subHeaderStyle(
            size: appStyle.sizes.textMultiplier * 2.5,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: appStyle.sizes.verticalBlockSize * 10,
                margin: EdgeInsets.only(
                    bottom: appStyle.sizes.verticalBlockSize * 7.5),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: appStyle.offiqlAllScreenPadding(ver: 1, hor: 1),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.backgroundColor,
                  ),
                  child: Container(
                    width: appStyle.sizes.verticalBlockSize * 14,
                    height: appStyle.sizes.verticalBlockSize * 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurpleAccent,
                      gradient: LinearGradient(
                        colors: [
                          // Colors.purpleAccent.shade400,
                          Colors.deepPurple.shade600,
                          Colors.deepPurpleAccent.shade200,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.user.name.substring(0, 1).toUpperCase(),
                        style: TextStyle(
                            fontSize: appStyle.sizes.textMultiplier * 8.0,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Shimmer.fromColors(
              baseColor: Colors.deepPurpleAccent,
              highlightColor: context.textColor,
              period: Duration(seconds: 5),
              child: Text(
                widget.user.name,
                style: appStyle.subHeaderStyle(
                  size: appStyle.sizes.textMultiplier * 2.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: appStyle.offiqlAllScreenPadding(),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // _buildUserInfo("Name", widget.user.name),
                    _buildUserInfo("Username", widget.user.username,
                        icon: Icons.person),
                    _buildUserInfo("Email", widget.user.email, icon: Icons.email),
                    _buildUserInfo("Phone", widget.user.phone, icon: Icons.phone),
                    _buildUserInfo("Website", widget.user.website, icon: Icons.web),
                    Divider(),
                    _buildUserInfo("Company", widget.user.company['name'] ?? ''),
                    _buildUserInfo(
                        "Catchphrase", widget.user.company["catchPhrase"] ?? ''),
                    Divider(),
                    _buildUserInfo("Address",
                        "${widget.user.address.street}, ${widget.user.address.suite}, ${widget.user.address.city} - ${widget.user.address.zipcode}"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(String title, String value, {IconData? icon}) {
    return Padding(
      padding: appStyle.offiqlAllScreenPadding(hor: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: appStyle.subHeaderStyle(
              size: appStyle.sizes.textMultiplier * 1.8,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Row(
            spacing: appStyle.sizes.horizontalBlockSize * 1.5,
            children: [
              if (icon != null)
                Container(
                    padding: appStyle.offiqlAllScreenPadding(ver: 1, hor: 1),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Colors.deepPurpleAccent.shade100),
                        shape: BoxShape.circle),
                    child: Icon(
                      icon,
                      color: Colors.deepPurpleAccent,
                      size: appStyle.sizes.horizontalBlockSize * 4,
                    )),
              Expanded(
                child: Text(
                  value,
                  style: appStyle.subHeaderStyle(
                    size: appStyle.sizes.textMultiplier * 2,
                    color: context.textColor,
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
