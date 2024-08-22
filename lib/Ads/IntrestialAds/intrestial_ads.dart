
import 'package:easy_audience_network/ad/interstitial_ad.dart' as F;
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../AdsConstants/ads_constants.dart';
import '../AdsConstants/ads_loading_dialog.dart';
import '../AdsConstants/ads_preference.dart';

class InterstitialAds {
  static InterstitialAd? interstitialAd;

  static Future showAds({required Function callBack}) async {
    print("dsgeas");
    print("Satatus ${PreferencesManager.get_Status}");
    if (PreferencesManager.get_Status == "on") {
      print("Step12");
      if (PreferencesManager.get_Click_Flag == "on") {
        if (Constant.IS_TIME_INTERVAL == true) {
           if (PreferencesManager.get_Adstyle == "normal") {
            if (Constant.Alt_Cnt_Inter == 2) {
              Constant.Alt_Cnt_Inter = 1;
              //loadRewardedAd(callBack);
              admobInterstitialAdsCreate(callBack);
            } else {
              Constant.Alt_Cnt_Inter++;
              admobInterstitialAdsCreate(callBack);
            }
          } else if (PreferencesManager.get_Adstyle == "fb") {
            loadFaceBookInterstitialAd(callBack);
          } else {
            callBack();
          }
        } else {
          print("time interval");
          callBack();
        }
      } else {
        String? getClick = PreferencesManager.get_Click as String?;
        if (Constant.Front_Counter % int.parse(getClick!) == 0) {
          if (PreferencesManager.get_Adstyle == "normal") {
            //  if (PreferencesManager.get_Ad_Flag == "admob") {
            //admobInterstitialAdsCreate(callBack);
            if (Constant.Alt_Cnt_Inter == 2) {
              Constant.Alt_Cnt_Inter = 1;
              //loadRewardedAd(callBack);
              admobInterstitialAdsCreate(callBack);
            } else {
              Constant.Alt_Cnt_Inter++;
              admobInterstitialAdsCreate(callBack);
            }
            // } else {
            //   callBack();
            // }
          } else if (PreferencesManager.get_Adstyle == "ALT") {
            if (Constant.Alt_Cnt_Inter == 2) {
              Constant.Alt_Cnt_Inter = 1;
              loadRewardedAd(callBack);
              // admobInterstitialAdsCreate(callBack);
            } else {
              Constant.Alt_Cnt_Inter++;
              loadRewardedAd(callBack);
              // loadFaceBookInterstitialAd(callBack);
            }
          } else if (PreferencesManager.get_Adstyle == "fb") {
            loadFaceBookInterstitialAd(callBack);
          } else {
            callBack();
          }
        } else {
          Constant.Front_Counter++;
          callBack();
        }
      }
    }
    else {
      print("esadgzersg");
      callBack();
    }
  }
  static RewardedAd? _rewardedAd;
  bool _isRewardedAdReady = false;
  static admobInterstitialAdsCreate(Function callBack) {
    //AdsLoader.showLoader();
    InterstitialAd.load(
      adUnitId:
      PreferencesManager.admobFull,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              ad.dispose();
              Constant.Front_Counter = 1;
              Constant.IS_TIME_INTERVAL = false;
              Future.delayed(
                  Duration(
                      milliseconds: int.parse((
                          PreferencesManager.get_AD_Time)) *
                          10), () {
                debugPrint(
                    'Time ----------- ${int.parse((PreferencesManager.get_AD_Time)) * 2}');
                Constant.IS_TIME_INTERVAL = true;
              });
            },
            // onAdFailedToShowFullScreenContent:
            //     (InterstitialAd ad, AdError error) {
            //   ad.dispose();
            // },
          );
          callBack();
          //AdsLoader.hideLoader();
          interstitialAd!.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          interstitialAd = null;
        //  AdsLoader.hideLoader();
          callBack();
        },
      ),
    );
  }
  /// Reword Ads
  static loadRewardedAd(Function callBack) {
    AdsLoader.showLoader();
    RewardedAd.load(
      adUnitId:  PreferencesManager.admobReward,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          _rewardedAd = ad;
          // _isRewardedAdReady = true;
          _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (RewardedAd ad) {
              ad.dispose();
              _rewardedAd?.dispose();
              Constant.Front_Counter = 1;
              Constant.IS_TIME_INTERVAL = false;
              Future.delayed(
                  Duration(
                      milliseconds: int.parse((
                          PreferencesManager.get_AD_Time)) *
                          10), () {
                debugPrint(
                    'Time ----------- ${int.parse((PreferencesManager.get_AD_Time)) * 10}');
                Constant.IS_TIME_INTERVAL = true;
              });
              callBack();
            },
            // onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
            //   ad.dispose();
            //   loadRewardedAd(callBack: callBack()); // Load a new ad
            // },
          );
          AdsLoader.hideLoader();
          _rewardedAd!.show(onUserEarnedReward: (ad, reward) {
            //  ad.dispose();
          },);
        },
        onAdFailedToLoad: (LoadAdError error) {
          // _isRewardedAdReady = false;
          AdsLoader.hideLoader();
          callBack();
          print('RewardedAd failed to load: $error');
        },
      ),
    );
  }
  /// FaceBook Ads -----
  static void loadFaceBookInterstitialAd(Function callBack) {
// AdsLoader.showLoader();
    callBack();
// final interstitialAd = F.InterstitialAd(F.InterstitialAd.testPlacementId);
    final interstitialAd = F.InterstitialAd(PreferencesManager.FBFull);

    interstitialAd.listener = F.InterstitialAdListener(
      onLoaded: () {
        interstitialAd.show();
      },
      onDismissed: () {
        interstitialAd.destroy();
        print('Interstitial dismissed');
// Additional logic when the ad is dismissed
        Constant.Front_Counter = 1;
        AdsLoader.hideLoader();
        Constant.IS_TIME_INTERVAL = false;
        Future.delayed(
          Duration(
            milliseconds: int.parse((PreferencesManager.getPref(
                PreferencesManager.get_AD_Time) as String)) * 10,
          ), () {
          debugPrint(
              'Time ----------- ${int.parse(PreferencesManager.get_AD_Time) * 10}');
          Constant.IS_TIME_INTERVAL = true;
        },
        );

        callBack();
      },
      onError: (code, message) {
        print('Interstitial error: $message');
        AdsLoader.hideLoader();
        callBack();
      },

    );

    interstitialAd.load();

// FacebookInterstitialAd.loadInterstitialAd(
//   placementId: PreferencesManager.FBFull,
//   listener: (result, value) {
//     print(">> FAN > Interstitial Ad: $result --> $value");
//     if (result == InterstitialAdResult.LOADED)
//       FacebookInterstitialAd.showInterstitialAd();
//     if (result == InterstitialAdResult.DISMISSED &&
//         value["invalidated"] == true) {
//       Constant.Front_Counter = 1;
//       AdsLoader.hideLoader();
//
//       Constant.IS_TIME_INTERVAL = false;
//       Future.delayed(
//           Duration(
//               milliseconds: int.parse((PreferencesManager.getPref(
//                   PreferencesManager.get_AD_Time) as String)) *
//                   10), () {
//         debugPrint(
//             'Time ----------- ${int.parse(PreferencesManager.get_AD_Time)* 10}');
//         Constant.IS_TIME_INTERVAL = true;
//       });
//
//       callBack();
//     }
//     if (result == InterstitialAdResult.ERROR) {
//       AdsLoader.hideLoader();
//       callBack();
//     }
//
//   },
// );
  }
}


