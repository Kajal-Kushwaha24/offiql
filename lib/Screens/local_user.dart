import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offiql/Db/base.dart';
import 'package:offiql/Extension/theme.dart';
import 'package:offiql/Helper/tile_loader.dart';
import 'package:offiql/Models/local_user.dart';
import 'package:offiql/Screens/add_users.dart';
import 'package:offiql/Utils/colors.dart';

import '../Utils/customize_style.dart';

class LocalUser extends StatefulWidget {
  const LocalUser({super.key});

  @override
  State<LocalUser> createState() => _LocalUserState();
}

class _LocalUserState extends State<LocalUser> {
  OffiqlCustomizeStyle appStyle = OffiqlCustomizeStyle();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: context.backgroundColor,
      statusBarIconBrightness:
          context.isDarkMode ? Brightness.light : Brightness.dark,
    ));

    return Stack(
      children: [
        Scaffold(
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
              'Local Users',
              style: appStyle.subHeaderStyle(
                size: appStyle.sizes.textMultiplier * 2.5,
                fontWeight: FontWeight.bold,
                color: context.textColor,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return AddUsers();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            SlideTransition(
                      position: animation.drive(Tween(
                          begin: const Offset(0.0, 1.0), end: Offset.zero)),
                      child: child,
                    ),
                  ),
                ),
                child: Container(
                  padding: appStyle.offiqlAllScreenPadding(ver: 2, hor: 2),
                  margin: EdgeInsets.only(
                      right: appStyle.sizes.horizontalBlockSize * 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade700, width: 1),
                    borderRadius: BorderRadius.circular(
                        appStyle.sizes.horizontalBlockSize * 4),
                  ),
                  child: Row(
                    spacing: appStyle.sizes.horizontalBlockSize,
                    children: [
                      Icon(Icons.add),
                      Text("Add User"),
                    ],
                  ),
                ),
              )
            ],
            centerTitle: true,
            backgroundColor: context.backgroundColor,
            surfaceTintColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: FutureBuilder<List<LocalUserModel>>(
                  future: DbHelper().getUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: ListShimmer(
                          itemCount: 5,
                          color: context.isDarkMode ? cardDark : Colors.grey,
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(child: Text("Error"));
                    }
                    if (!snapshot.hasData ||
                        snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            appStyle.offiqlLottieImage(
                                'assets/json/no_data.json',
                                widthInPercent: 100),
                            Padding(
                              padding: appStyle.offiqlAllScreenPadding(),
                              child: Text(
                                "No User found, Please add some user in the app through Add user screen.",
                                textAlign: TextAlign.center,
                                style: context.textTheme.headlineSmall!
                                    .copyWith(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    List<LocalUserModel> localUsers = snapshot.data!;

                    return ListView.builder(
                      itemCount: localUsers.length,
                      padding: appStyle.offiqlAllScreenPadding(),
                      itemBuilder: (context, index) {
                        LocalUserModel user = localUsers[index];
                        return Container(
                          padding: appStyle.offiqlAllScreenPadding(),
                          margin: EdgeInsets.only(
                              bottom: appStyle.sizes.horizontalBlockSize * 2.5),
                          decoration: BoxDecoration(
                              color: context.backgroundColor,
                              borderRadius: BorderRadius.circular(
                                  appStyle.sizes.textMultiplier * 3.5),
                              border: Border.all(
                                  width: 1,
                                  color: context.isDarkMode
                                      ? greyColor.withValues(alpha: 0.3)
                                      : Colors.black12)),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              backgroundColor: Colors.deepPurpleAccent,
                              radius: appStyle.sizes.imageSizeMultiplier * 7,
                              child: Icon(
                                Icons.person,
                                size: appStyle.sizes.textMultiplier * 4.5,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(user.name,
                                style: appStyle.subHeaderStyle(
                                    size: appStyle.sizes.textMultiplier * 1.8,
                                    color: context.textColor)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.email,
                                    style: appStyle.subHeaderStyle(
                                        color: Colors.grey[700])),
                                Text(user.phone,
                                    style: appStyle.subHeaderStyle(
                                        color: Colors.grey[700])),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
