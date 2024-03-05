import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:salah/Core/dio.dart';
import 'package:salah/Core/get_api.dart';
import 'package:salah/Core/notification_service.dart';
import 'package:salah/Models/bukhari_hadis_model.dart';
import 'package:salah/Models/islamic_calender_model.dart';
import 'package:salah/Models/nearby_places_model.dart';
import 'package:salah/Models/prayer_Time_model.dart';
import 'package:salah/Models/quran_detail_model.dart';
import 'package:salah/Widget/salah_bottomBar.dart';

import '../Screens/map.dart';

class MyController extends GetxController {
  final getApi = GetApi(dio);
  NativeAd? nativeAd;
  RxBool isAdLoaded = false.obs;
  final String adUnitId = "ca-app-pub-8860966945623841/5448325650";
 BuildContext? context;

  // Handle Permission
 Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context!).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  // Handle Permission

// Time convert
 String nowTime = "";
  String now12HourFormat() {
    DateTime date = DateTime.now();
    String time = "${date.hour}:${date.minute}:${date.second}";
    final DateTime dateTime = DateFormat('HH:mm').parse(time);
    nowTime = DateFormat('h:mm a').format(dateTime);
    return DateFormat('h:mm a').format(dateTime);
  }
// Time Convert

// Notification Work
 void sendNotification() {
    final LocalNotificationService _localNotificationService =
        LocalNotificationService();
    // _localNotificationService.checkNotificationPermission();
    _localNotificationService.initializeSettings(context!);
    _localNotificationService.showSimpleNotification();
  }

// Notification Work 

//  Which Prayer
// RxString prayerName="".obs;
// RxString upcomingPrayer="".obs;
//      final DateFormat _timeFormat = DateFormat('hh:mm a');
//   final DateFormat _inputTimeFormat = DateFormat('HH:mm');
//   final String _specifiedTimeString = '12:30'; // Example specified time as string

// void prayer(){

//       DateTime currentTime = DateTime.now();
//        String currentTimeString = _timeFormat.format(currentTime);
      
//     DateTime fajrComp = _inputTimeFormat.parse(fajr.value);
//     DateTime dhurComp = _inputTimeFormat.parse(fajr.value);
//     DateTime asrComp = _inputTimeFormat.parse(fajr.value);

//     DateTime magribComp = _inputTimeFormat.parse(fajr.value);
//     DateTime ishaComp = _inputTimeFormat.parse(fajr.value);
//    try {
  
    
//   if(currentTime.isBefore(fajrComp)){
// prayerName.value ="FAJR";
// upcomingPrayer.value = "DHUR";
//   }else if(currentTime.isBefore(fajrComp)){
// prayerName.value ="DHUR";
// upcomingPrayer.value = "ASR";
//   }else if(currentTime.isBefore(dhurComp)){
// prayerName.value ="ASR";
// upcomingPrayer.value = "MAGRIB";
//   }else if(currentTime.isBefore(asrComp)){
// prayerName.value ="MAGRIB";
// upcomingPrayer.value = "ISHA";
//   }else if(currentTime.isBefore(ishaComp)){
// prayerName.value ="ISHA";
// upcomingPrayer.value = "FAJR";
//   }
//    } catch (e) {
     
//    }
// }
//  Which Prayer

// Address Cordinates Api
 Rx<Position?> currentPosition = Rx<Position?>(null);
RxString _currentAddress = "No".obs;


  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
        currentPosition.value = position;
      getAddressFromLatLng(currentPosition.value!);
    }).catchError((e) {
      debugPrint(e);
    });
  }


  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            currentPosition.value?.latitude ?? 0, currentPosition.value?.longitude ?? 0)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      
        _currentAddress.value =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
       
    }).catchError((e) {
      // debugPrint(e);
    });
  }
// Address Cordinates Api







// Nearby Places Api

 Rx<NearbyPlaces?> nearbyPlaces = Rx<NearbyPlaces?>(null);

RxList<Result> result = <Result>[].obs;
RxString placeName = "Loading".obs;
  Future<void> getPlaces() async {
    try {
      nearbyPlaces.value = await getApi.getNearbyPlaces(
          currentPosition.value?.latitude ?? 0, currentPosition.value?.longitude ?? 0);
// placeName.value =nearbyPlaces?.results?[index].name
      print('${nearbyPlaces}nearbys');

      // print('$address addd');
      log('hello');
      // setState(() {});
    } catch (e) {}
  }


 RxList<map.Marker>? markers = RxList<map.Marker>();
  Future<void> getMarkers() async {
    // map.BitmapDescriptor? icon;
    map.BitmapDescriptor icon = await map.BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        devicePixelRatio: 1.1,
        size: Size(10, 30),
      ),
      "assets/images/marker.png",
    );
    // setState(() {
    //   this.icon = icon;
    // });
    // setState(() {});
    markers?.value = List.generate(
      nearbyPlaces.value!.results!.length,
      (index) => map.Marker(
        markerId: map.MarkerId('${ nearbyPlaces.value?.results?[index].name}'),
        position: map.LatLng(
            nearbyPlaces.value?.results?[index].geometry?.location?.lat ?? 0,
            nearbyPlaces.value?.results?[index].geometry?.location?.lng ?? 0),
        infoWindow: map.InfoWindow(
          title: '${nearbyPlaces.value?.results?[index].name}',
        ),
      ),
    );
  }
// Nearby Places Api

// Prayer Time Api
Rx<PrayerTimeModel?> prayerTimeModel= Rx<PrayerTimeModel?>(null);
String? _selectedValue;
  RxString fajr = "".obs;
  RxString dhuhr = "".obs;
  RxString asr = "".obs;
  RxString magrib = "".obs;
  RxString isha = "".obs;
 Future<void> getTime() async {
    try {
      prayerTimeModel.value = await getApi.getPrayerTime(
          constant.box.read('selectedCountry'),
          constant.box.read('selectedCity'),
      
          // 'Australia',"Sydney",
          '${_selectedValue}');
      // print('$address addd');

      // log('${prayerTimeModel?.data?.timings?.Asr} fajren');
       

      fajr.value = convertTo12HourFormat(prayerTimeModel.value!.data.timings.Fajr);
      dhuhr.value = convertTo12HourFormat(prayerTimeModel.value!.data.timings.Dhuhr);
      asr.value = convertTo12HourFormat(prayerTimeModel.value!.data.timings.Asr);
      magrib.value = convertTo12HourFormat(prayerTimeModel.value!.data.timings.Maghrib);
      isha.value = convertTo12HourFormat(prayerTimeModel.value!.data.timings.Isha);
       
      // constant.box.write('magrib', convertTo12HourFormat('10:00'));
    } catch (e) {
      print("$e erer");
    }
  }

// Prayer Time Api


// Islamic Calender Api
  RxString day = "".obs;
  RxString month = "".obs;
  RxString year = "".obs;
  RxString fullDate = "".obs;
Rx<IslamicCalenderModel?> islamicCalenderModel = Rx<IslamicCalenderModel?>(null);
Future<void> getCalender() async {
    try {
       DateTime now = DateTime.now();

  // Format the date as "day-month-year"
  String formattedDate = DateFormat('d-M-yyyy').format(now);
      islamicCalenderModel.value = await getApi.getCalender(formattedDate);
      // print('$date dateislamic');
      day .value= islamicCalenderModel.value!.data.hijri.day;
      month .value= islamicCalenderModel.value!.data.hijri.month.en;
      year .value= islamicCalenderModel.value!.data.hijri.year;
      fullDate .value= islamicCalenderModel.value!.data.gregorian.date;
      // setState(() {});
    } catch (e) {}
  }
  // Islamic Calender Api



// Converte To 12 Hour Function

 String convertTo12HourFormat(String time24Hour) {
    final DateTime dateTime = DateFormat('HH:mm').parse(time24Hour);
    return DateFormat('h:mm a').format(dateTime);
  }
  // Converte To 12 Hour Function


// Activty Api
Rx<QuranDetailTextModel?> quranDetailTextModel= Rx<QuranDetailTextModel?>(null);
 Future<void> getDetailedSurah() async {
    quranDetailTextModel.value = await getApi.getDetailSSurah();

  }

// Activity Api



// Add Work
static const String bannerAdUnitId = "ca-app-pub-8860966945623841/2119756052";
// BannerAd? bannerAd;
  
 
 BannerAd bannerAd = BannerAd(
    adUnitId: bannerAdUnitId,
    size: AdSize.banner,
    request: const AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (Ad ad) => print('BannerAd loaded.'),
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
       
        print('BannerAd failed to load: $error');
      },
    ),
  );
  // Load the banner ad
 

// Add WOrk
// INtersttile Add
InterstitialAd? _interstitialAd;
int _numInterstitialLoadAttempts = 0;
static const String interstitialAdUnitId = 'ca-app-pub-8860966945623841/7527995405';
void createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
        
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < 3) {
              createInterstitialAd();
            }
          },
        ));
  }
void showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }
  // Interstitle Add


// Rewarded Add
static const String rewardedAdUnitId = 'ca-app-pub-8860966945623841/9085824932';
Rx<RewardedAd?> rewardedAd= Rx<RewardedAd?>(null);
int _numRewardedLoadAttempts = 0;

void createRewardedAd() {
    RewardedAd.load(
        adUnitId: rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            rewardedAd.value = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            rewardedAd.value = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < 3) {
              createRewardedAd();
            }
          },
        ));
  }
 
  // AppOpenAdLoadTime loadTime = AppOpenAdLoadTime.now;

 AppOpenAd? openAd;

Future<void> loadAd() async {
  await AppOpenAd.load(
      adUnitId: 'ca-app-pub-8860966945623841/6374372434',
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad){
            print('openad is loaded');
            openAd = ad;
            // openAd!.show();
          },
          onAdFailedToLoad: (error) {
            print('openad failed to load $error');
          }), orientation: AppOpenAd.orientationPortrait
  );
}

void showAd() {
  if(openAd == null) {
    print('trying tto show before loading');
    loadAd();
    return;
  }

  openAd!.fullScreenContentCallback = FullScreenContentCallback(
    onAdShowedFullScreenContent: (ad) {
      print('onAdShowedFullScreenContent');
    },
    onAdFailedToShowFullScreenContent: (ad, error){
      ad.dispose();
      print('failed to load $error');
      openAd = null;
      loadAd();
    },
    onAdDismissedFullScreenContent: (ad){
      ad.dispose();
      print('dismissed');
      openAd = null;
      loadAd();
    }
  );

  openAd!.show();
}


void showRewardedAd() {
    if (rewardedAd.value == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    rewardedAd.value!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
      createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      createRewardedAd();
      },
    );

    rewardedAd.value!.setImmersiveMode(true);
    rewardedAd.value!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
        });
    rewardedAd.value = null;
  }
// Rewarded Add
  loadAdS() {
    nativeAd = NativeAd(
        adUnitId: adUnitId,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            isAdLoaded.value = true;
            log("Ad Loaded");
          },
          onAdFailedToLoad: (ad, error) {
            isAdLoaded.value = false;
          },
        ),
        request: const AdRequest(),
        nativeTemplateStyle: NativeTemplateStyle(templateType: TemplateType.small));
    nativeAd!.load();
  }

  @override
  void dispose() {
    nativeAd?.dispose();
    super.dispose();
  }

  // BUkhari Hadith
  BukhariHadithModel? bukhariHadithModel;
Future<void> getBukhariHadith()async{
bukhariHadithModel = await getApi.bukhariHadith();
print('${bukhariHadithModel} bukhariHadith');
}
  // Bukhari Hadith

  // Upcoming and Now Prayer

}

  // Upcoming and Now Prayer
 