import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService{
static String? get bannerUnitId{
if(Platform.isAndroid){
return 'ca-app-pub-8860966945623841/2119756052';
}else if(Platform.isIOS){
return 'ca-app-pub-8860966945623841/2119756052';
}
return null;
}

static String? get interstileUnitId{
if(Platform.isAndroid){
return 'ca-app-pub-8860966945623841~1290971684';
}else if(Platform.isIOS){
return 'ca-app-pub-8860966945623841~1290971684';
}
return null;
}
static String? get rewardedAdiId{
if(Platform.isAndroid){
return 'ca-app-pub-8860966945623841~1290971684';
}else if(Platform.isIOS){
return 'ca-app-pub-8860966945623841~1290971684';
}
return null;
}


static final BannerAdListener bannerAdListener = BannerAdListener(
  onAdLoaded:(ad)=> (ad,error){
ad.dispose();
debugPrint("Ad Failed To Load $error");
  },
  onAdOpened: (ad)=>debugPrint("Ad opended"),
  onAdClosed: (ad)=>debugPrint("Ad Closed")
);
}