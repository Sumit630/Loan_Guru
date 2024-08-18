
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:loan_guru/splesh_scrren/view/splesh_scrren_page.dart';

import 'country_scrren/controller/country_controller.dart';


const String appName = "Credit card guide";
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // add your url
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
 // await PreferencesManager.initRemotGetData();
 // MobileAds.instance.initialize();
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
      child: GetMaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.blue,
        ),
        home: const SpleshScrrenPage(),
      ),
    );
  }
  @override
  void initState() {
    print("list Count :; ${CreditCountryController.nameOfCountryList.length}||Image ${CreditCountryController.nameOfCountryList.length}");
  //  AppOpenAdManager().appOpenAds();
    // _appLifecycleReactor =
    //     AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
    // _appLifecycleReactor.listenToAppStateChanges();
    super.initState();
  }
}
