import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:offiql/Helper/showSnackbar.dart';
import 'package:offiql/Provider/home.dart';
import 'package:offiql/Provider/user.dart';
import 'package:offiql/Screens/home_screen.dart';
import 'package:offiql/Utils/debug_purpose.dart';
import 'package:provider/provider.dart';

import 'Provider/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()..loadTheme()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Offiql',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      home: const InternetWrapper(),
    );
  }
}

class InternetWrapper extends StatefulWidget {
  const InternetWrapper({super.key});

  @override
  State<InternetWrapper> createState() => _InternetWrapperState();
}

class _InternetWrapperState extends State<InternetWrapper> {
  late Connectivity _connectivity;
  late Stream<List<ConnectivityResult>> _connectivityStream;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeConnectivity();
    });
  }

  initializeConnectivity() async {
    _connectivity = Connectivity();
    _connectivityStream = _connectivity.onConnectivityChanged;
    _connectivityStream.listen((connectivityResult) {
      if (connectivityResult.isNotEmpty) {
        if (connectivityResult[0] == ConnectivityResult.wifi ||
            connectivityResult[0] == ConnectivityResult.mobile) {
          printGreen('Internet connection restored');
          if (mounted) {
            showSnackBar('You are connected to the internet!', context,
                bgColor: Colors.green);
            if (HomeProvider().users.isEmpty) {
              HomeProvider().fetchUsers(context);
            }
          }
        } else {
          printRed('No internet connection');

          if (mounted) {
            showSnackBar("No internet connection", context,
                bgColor: Colors.red);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
