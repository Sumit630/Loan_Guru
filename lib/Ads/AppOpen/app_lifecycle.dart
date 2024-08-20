import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../AdsConstants/ads_constants.dart';
import '../AdsConstants/ads_preference.dart';


class AppLifecycleReactor {
  final AppOpenAdManager appOpenAdManager;

  AppLifecycleReactor({required this.appOpenAdManager});

  void listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => _onAppStateChanged(state));
  }

  void _onAppStateChanged(AppState appState) {
    print('New AppState state: $appState');
    if (appState == AppState.foreground) {
      appOpenAdManager.showAdIfAvailable();
    }
  }
}

class AppOpenAdManager {
  final Duration maxCacheDuration = const Duration(hours: 4);
  DateTime? _appOpenLoadTime;

  AppOpenAd? _appOpenAd;
  bool _isShowingAd = false;


  appOpenAds() {
    if (PreferencesManager.get_Status == "on") {
      loadAdmobAds();
    }
  }

  AppOpenAd?appOpenAd;
  void loadAdmobAds() {;
  AppOpenAd.load(
      adUnitId:Platform.isAndroid?'${PreferencesManager.admobOpen}':'${PreferencesManager.admobOpen}',
      request: AdRequest(),
    adLoadCallback:AppOpenAdLoadCallback(onAdLoaded: (ad) {
    appOpenAd=ad;
    appOpenAd!.show();
    }, onAdFailedToLoad:(error) {
    print("Error::${error}");
    },));
  }


  bool get isAdAvailable {
    return _appOpenAd != null;
  }

  void showAdIfAvailable() {
    if (!isAdAvailable) {
      debugPrint('Tried to show ad before available.');
      appOpenAds();
      return;
    }
    if (_isShowingAd) {
      debugPrint('Tried to show ad while already showing an ad.');
      return;
    }
    if (DateTime.now().subtract(maxCacheDuration).isAfter(_appOpenLoadTime!)) {
      debugPrint('Maximum cache duration exceeded. Loading another ad.');
      _appOpenAd!.dispose();
      _appOpenAd = null;
      appOpenAds();
      return;
    }
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        debugPrint('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        debugPrint('$ad onAdDismissedFullScreenContent');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        appOpenAds();
      },
    );
    debugPrint('-------------------------------- 111111111111111');
    _appOpenAd!.show();
    debugPrint('-------------------------------- 222222222222222');
  }
}
//import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// void main()async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await MobileAds.instance.initialize();
//   runApp(GetMaterialApp(
//     home: OpnaAds(),
//   ));
// }
// class OpnaAds extends StatefulWidget {
//   const OpnaAds({super.key});
//
//   @override
//   State<OpnaAds> createState() => _OpnaAdsState();
// }
//
// class _OpnaAdsState extends State<OpnaAds> {
//   @override
//   Widget build(BuildContext context) {
//     loandOpenAds();
//     return SafeArea(
//       child: Scaffold(
//         body: Text("sadfg"),
//       ),
//     );
//   }
// }
// AppOpenAd?appOpenAd;
// loandOpenAds(){
//   AppOpenAd.load(
//       adUnitId:Platform.isAndroid?'ca-app-pub-3940256099942544/9257395921':'ca-app-pub-3940256099942544/3419835294',
//       request: AdRequest(),
//       adLoadCallback:AppOpenAdLoadCallback(onAdLoaded: (ad) {
//         appOpenAd=ad;
//         appOpenAd!.show();
//       }, onAdFailedToLoad:(error) {
//         print("Error::${error}");
//           },),
//   );
// }