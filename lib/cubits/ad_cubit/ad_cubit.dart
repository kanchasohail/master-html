import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../constants/consts.dart';

class AdCubit extends Cubit<AdCubitState> {
  AdCubit() : super(AdCubitInitialState()) {
    if (!isAdMobInitialized) {
      initializeAdMob();
    }
  }

  bool isAdMobInitialized = false;

  void initializeAdMob() async {
    var devices = ["549142D95B5AF1D157C5A6EC81CA76A2"];
    WidgetsFlutterBinding.ensureInitialized();
    await MobileAds.instance.initialize();
    RequestConfiguration requestConfiguration = RequestConfiguration(
      testDeviceIds: devices,
    );
    MobileAds.instance.updateRequestConfiguration(requestConfiguration);
    isAdMobInitialized = true;
    debugPrint("Ad Mob Initialized *********");
  }

  bool isRewardedAdLoaded = false;

  late RewardedAd rewardedAd;

  var rewardedAdUnitId = "ca-app-pub-3940256099942544/5224354917";

  initRewardedAd() {
    RewardedAd.load(
        adUnitId: rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
          rewardedAd = ad;
          isRewardedAdLoaded = true;
          rewardedAd.fullScreenContentCallback =
              FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
            ad.dispose();
            isRewardedAdLoaded = false;
          }, onAdFailedToShowFullScreenContent: (ad, error) {
            ad.dispose();
            isRewardedAdLoaded = false;
            debugPrint(error.toString());
          });
        }, onAdFailedToLoad: (error) {
          isRewardedAdLoaded = false;
        }));
  }


  Future<bool> isInternetConnected() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}

abstract class AdCubitState {}

class AdCubitInitialState extends AdCubitState {}
