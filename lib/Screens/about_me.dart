import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:offiql/Extension/theme.dart';
import 'package:offiql/Helper/showSnackbar.dart';
import 'package:offiql/Utils/customize_style.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  OffiqlCustomizeStyle appStyle = OffiqlCustomizeStyle();

  List<Map<String, String>> skills = [
    {
      "title": "Python",
      "desc":
          "A versatile programming language used for web development, data analysis, machine learning, and more."
    },
    {
      "title": "Java",
      "desc":
          "A popular object-oriented language for building robust, platform-independent applications."
    },
    {
      "title": "Dart",
      "desc":
          "A programming language optimized for building mobile, desktop, server, and web applications, especially with Flutter."
    },
    {
      "title": "C",
      "desc":
          "A foundational programming language widely used for system-level programming and embedded systems."
    },
    {
      "title": "Flutter",
      "desc":
          "A powerful UI toolkit for building natively compiled mobile, web, and desktop applications from a single codebase."
    },
    {
      "title": "Git",
      "desc":
          "A distributed version control system for tracking changes in source code during software development."
    },
    {
      "title": "GitHub",
      "desc":
          "A platform for hosting Git repositories and collaborating on open-source and private projects."
    },
    {
      "title": "SQL",
      "desc":
          "A standardized language for managing and querying relational databases."
    },
    {
      "title": "Firestore",
      "desc":
          "A NoSQL document database from Firebase for real-time data storage and synchronization."
    },
    {
      "title": "WebSockets",
      "desc":
          "A protocol for real-time, full-duplex communication between client and server over a single, long-lived connection."
    },
    {
      "title": "Teamwork",
      "desc":
          "Working collaboratively with others to achieve shared goals efficiently and effectively."
    },
    {
      "title": "RESTful APIs",
      "desc":
          "An architectural style for building scalable web services that communicate using HTTP methods."
    },
    {
      "title": "Mobile App Development",
      "desc":
          "The process of creating applications for mobile devices, focusing on performance and user experience."
    },
    {
      "title": "UI/UX Design",
      "desc":
          "The practice of designing user interfaces and experiences that are intuitive, efficient, and enjoyable."
    },
    {
      "title": "Communication",
      "desc":
          "The ability to convey ideas effectively and collaborate with others in a team setting."
    },
    {
      "title": "Presentation Skills",
      "desc":
          "The ability to deliver information clearly and confidently to audiences in meetings or formal settings."
    },
    {
      "title": "Time Management",
      "desc":
          "The ability to prioritize tasks, manage deadlines, and complete projects within the given time constraints."
    }
  ];
  List<Map<String, String>> projects = [
    {
      "title": "AgroVia – A Smart Agricultural Platform",
      "link": "https://drive.google.com/file/d/1Tw4MOEkc_sl0Jf1sI_DTY6LZNbRliE_u/view?usp=sharing",
      "desc":
          "\t\t\tAgroVia is an innovative mobile application designed to empower farmers with an e-commerce platform for buying and selling agricultural products, AI-driven crop health detection, real-time weather insights, and government scheme updates. It enhances productivity and reduces manual effort for farmers. \n- Technologies: Dart, Flutter, Firebase, Firestore, WebSocket."
    },
    {
      "title": "Kaarva – A Real-Time Messaging Application",
      "link": "https://drive.google.com/file/d/1Xfg9j3-_VZo2ZxE2UZhfDV9-q8kPf-_f/view?usp=sharing",
      "desc":
          "\t\t\tKaarva is a real-time messaging application that supports one-on-one messaging with seamless, secure, and instant communication. It focuses on fast message delivery and end-to-end encryption to provide enhanced security and a smooth user experience. \n- Technologies: Dart, Flutter, WebSocket."
    }
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.deepPurpleAccent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: appStyle.offiqlIcon(
            Icons.arrow_back,
            color: Colors.white,
            sizeOfIcon: appStyle.sizes.textMultiplier * 3.0,
          ),
        ),
        title: Text(
          'About Me',
          style: appStyle.subHeaderStyle(
            size: appStyle.sizes.textMultiplier * 2.5,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        surfaceTintColor: Colors.deepPurpleAccent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    top: appStyle.sizes.horizontalBlockSize,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: appStyle.offiqlAllScreenPadding(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final url = Uri.parse(
                                  "https://github.com/Kajal-Kushwaha24/offiql");
                              if (!await launchUrl(url,
                                  mode: LaunchMode.externalApplication)) {
                                showSnackBar(
                                    "Something went wrong, Failed to open the github account!",
                                    context);
                              }
                            },
                            child: Icon(
                              Bootstrap.github,
                              size: appStyle.sizes.horizontalBlockSize * 10,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final url = Uri.parse(
                                  "https://www.linkedin.com/in/kajal-kushwaha2402");
                              if (!await launchUrl(url,
                                  mode: LaunchMode.externalApplication)) {
                                showSnackBar(
                                    "Something went wrong, Failed to open the linkedIn account!",
                                    context);
                              }
                            },
                            child: Icon(
                              Bootstrap.linkedin,
                              size: appStyle.sizes.horizontalBlockSize * 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )),
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
                          'K',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // spacing: appStyle.sizes.horizontalBlockSize,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.deepPurpleAccent,
                    highlightColor: context.textColor,
                    period: Duration(seconds: 5),
                    child: Text(
                      "Kajal Kushwaha",
                      style: appStyle.subHeaderStyle(
                        size: appStyle.sizes.textMultiplier * 2.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'kajalkush2402@gmail.com',
                        query: encodeQueryParameters(<String, String>{
                          'subject':
                              'Exciting Job Opportunity at [Company Name]',
                          'body': 'Dear Kajal,\n\n'
                              'We are pleased to inform you that we have reviewed your profile and are impressed with your skills and experience. '
                              'We would like to invite you to discuss an exciting job opportunity with us at [Company Name].\n\n'
                              'Please let us know your availability for a quick interview or a phone call. We believe you would be a great fit for our team and are excited about the possibility of working with you.\n\n'
                              'Looking forward to hearing from you soon!\n\n'
                              'Best regards,\n'
                              '[HR Name]\n'
                              '[Company Name]'
                        }),
                      );

                      try {
                        launchUrl(emailLaunchUri);
                      } catch (e) {
                        showSnackBar(
                            'No email app found or failed to launch: $e',
                            context);
                      }
                    },
                    child: Row(
                      spacing: appStyle.sizes.horizontalBlockSize,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.email_outlined),
                        Text(
                          "kajalkush2402@gmail.com",
                          style: appStyle.subHeaderStyle(
                            size: appStyle.sizes.textMultiplier * 1.5,
                            fontWeight: FontWeight.bold,
                            color: context.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: appStyle.offiqlAllScreenPadding(),
                  child: Column(
                    spacing: appStyle.sizes.horizontalBlockSize,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appStyle.offiqlHeader("Skills",
                          textColor: context.textColor),
                      Wrap(
                        spacing: appStyle.sizes.horizontalBlockSize * 2,
                        runSpacing: appStyle.sizes.horizontalBlockSize * 2,
                        children: skills.map((skill) {
                          return GestureDetector(
                            onTap: () => showSnackBar(
                                skill["desc"].toString(), context,
                                bgColor: Colors.green.shade100),
                            child: Container(
                              padding: appStyle.offiqlAllScreenPadding(ver: 1),
                              decoration: BoxDecoration(
                                  // color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(
                                      appStyle.sizes.horizontalBlockSize * 3),
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: Text(
                                skill['title'].toString(),
                                style: TextStyle(
                                  color: context.textColor,
                                  fontSize: appStyle.sizes.textMultiplier * 1.5,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Divider(),
                      appStyle.offiqlHeader("Projects",
                          textColor: context.textColor),
                      Column(
                        spacing: appStyle.sizes.horizontalBlockSize * 2,
                        children: projects.map((e) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: appStyle.sizes.horizontalBlockSize,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.start),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e["title"].toString(),
                                          style: TextStyle(
                                            fontSize:
                                                appStyle.sizes.textMultiplier *
                                                    2.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            final url = e["link"].toString();
                                            if (await canLaunchUrl(
                                                Uri.parse(url))) {
                                              await launchUrl(Uri.parse(url));
                                            } else {
                                              throw Exception(
                                                  'Could not launch $url');
                                            }
                                          },
                                          child: Text(
                                           "Apk Drive Link",
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                e["desc"].toString(),
                                textAlign: TextAlign.justify,
                                softWrap: true,
                                style: TextStyle(
                                    fontSize:
                                        appStyle.sizes.textMultiplier * 1.5),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                      appStyle.offiqlVerticalGap(verticalGapSizeInPercent: 1)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
