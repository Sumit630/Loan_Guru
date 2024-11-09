

import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:loan_guru/splesh_scrren/view/splesh_scrren_page.dart';

import 'Ads/AdsConstants/ads_preference.dart';
import 'Ads/AppOpen/app_lifecycle.dart';
import 'country_scrren/controller/country_controller.dart';
import 'country_scrren/view/NoInternetScreen.dart';
import 'firebase_optiions.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
const String appName = "Credit card guide";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  await PreferencesManager.initRemotGetData();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  final Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isConnectionLostOneTime = false;

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log(e.toString());
      return;
    }

    if (!mounted) {
      return;
    }

    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    setState(() {
      _connectionStatus = result;
    });

    if (_connectionStatus == ConnectivityResult.mobile || _connectionStatus == ConnectivityResult.wifi) {
      if (isConnectionLostOneTime) {
        isConnectionLostOneTime = false;
        Navigator.pop(navigatorKey.currentContext!);
      }
    } else {
      if (!isConnectionLostOneTime) {
        isConnectionLostOneTime = true;
        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => NoInternetScreen()),
        );
      }
    }
  }

  // late AppLifecycleReactor _appLifecycleReactor;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark,

    ));
    return ScreenUtilInit(
      designSize: Size(360, 690), // Set the design size of your app
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  GetMaterialApp(
          navigatorKey: navigatorKey,
          title: appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: false,
            primarySwatch: Colors.blue,
          ),
          home: const SpleshScrrenPage(),
        );
      },
    );
  }
  @override
  void initState() {
    print("list Count :; ${CreditCountryController.nameOfCountryList.length}||Image ${CreditCountryController.nameOfCountryList.length}");
    AppOpenAdManager().appOpenAds();
    // _appLifecycleReactor =
    //     AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
    // _appLifecycleReactor.listenToAppStateChanges();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }
}


