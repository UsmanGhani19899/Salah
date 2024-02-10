import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:salah/Core/my_controller.dart';
import 'package:salah/Widget/ad_helper.dart';

// import 'ads_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
BannerAd? _bannerAd;
InterstitialAd? _interstitalAd;
RewardedAd? _rewardedAd;
int rewardScore = 0;
class _HomePageState extends State<HomePage> {
  var myContr = Get.put(MyController());

  @override
  void initState() {
    super.initState();
    createBannerAd();
    // createinterAdd();
    // createRewardedAd();
    myContr.loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          "Native Ads",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:_bannerAd != null?  Container(height: 52,child: AdWidget(ad: _bannerAd!),) : Column(
        children: [
          const Text("Reward Score  ",style: TextStyle(color: Colors.white ),),
          // set your according
           ElevatedButton(onPressed: _showInterAd, child: Text("SHOW BANNER",style: TextStyle(color: Colors.white ),),)
       
         ,  ElevatedButton(onPressed: showRewardAd, child: Text("SHOW Reward",style: TextStyle(color: Colors.white ),),)
       
        ],
      ),
    );
  }
    void createBannerAd(){
    _bannerAd = BannerAd(size: AdSize.fullBanner, adUnitId: AdMobService.bannerUnitId!, listener: AdMobService.bannerAdListener, request: AdRequest())..load();
  }
  void createinterAdd(){
    InterstitialAd.load(adUnitId: AdMobService.interstileUnitId!, request: AdRequest(), adLoadCallback: InterstitialAdLoadCallback(
      
      onAdLoaded: (ad)=>_interstitalAd=ad, onAdFailedToLoad: (LoadAdError error)=>_interstitalAd=null));
  }

void createRewardedAd(){
  RewardedAd.load(adUnitId: AdMobService.rewardedAdiId!, request: AdRequest(), rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad)=>setState(() =>_rewardedAd=ad), onAdFailedToLoad: (ad)=>setState(() =>_rewardedAd=null)));
}

void showRewardAd(){
  if(_interstitalAd !=null){
_interstitalAd!.fullScreenContentCallback = FullScreenContentCallback(
  onAdDismissedFullScreenContent: (ad){
    ad.dispose();
    createinterAdd();
  },
  onAdFailedToShowFullScreenContent: (ad,error){
    ad.dispose();
    createinterAdd();
  }
);
_interstitalAd!.show();
_interstitalAd=null;
  }
}

void _showInterAd(){
  if(_interstitalAd !=null){
_interstitalAd!.fullScreenContentCallback = FullScreenContentCallback(
  onAdDismissedFullScreenContent: (ad){
    ad.dispose();
    createinterAdd();
  },
  onAdFailedToShowFullScreenContent: (ad,error){
    ad.dispose();
    createinterAdd();
  }
);
_interstitalAd!.show();
_interstitalAd=null;
  }
}
}