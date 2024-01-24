import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salah/Models/asma_ul_husna_model.dart';
import 'package:salah/Models/city_model.dart';
import 'package:salah/Models/countries_model.dart';
import 'package:salah/Models/direction_model.dart';
import 'package:salah/Models/islamic_calender_model.dart';
import 'package:salah/Models/prayer_Time_model.dart';
import 'package:salah/Models/quran_detail_model.dart';
import 'package:salah/Models/quran_reciters_model.dart';
import 'package:salah/Models/surah_model.dart';
import '../Models/nearby_places_model.dart';
import '../Core/get_constants.dart' as globals;
part 'get_api.g.dart';
// import 'package:task_practise/Models/top_stories_model.dart';

@RestApi()
abstract class GetApi {
  factory GetApi(Dio dio, {String baseUrl}) = _GetApi;

  @GET(
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=near by masjid&location={latitude}%2C{longitude}&radius=1500&type=masjid&key=AIzaSyALAfKe5ueBePbjdDKSgmxeEAaqouHemq4")
  Future<NearbyPlaces> getNearbyPlaces(
      @Path('latitude') double latitude, @Path('longitude') double longitude);
  @GET(
      'http://api.aladhan.com/v1/timingsByCity?&country={country}&city={city}&method={day}')
  Future<PrayerTimeModel>? getPrayerTime(@Path('country') String country,
      @Path('city') String city, @Path('day') String day);

  @GET('http://api.aladhan.com/v1/asmaAlHusna')
  Future<AsmaUlHusnaModel> getName();

  @GET('https://api.aladhan.com/v1/gToH/{date}')
  Future<IslamicCalenderModel> getCalender(
    @Path('date') String date,
  );

  @GET('https://www.mp3quran.net/api/v3/reciters?language=eng')
  Future<QuranReciter> getReciters();

  @GET('https://www.mp3quran.net/api/v3/suwar?language=eng')
  Future<SurahModel> getSurah();

  @GET('https://api.alquran.cloud/v1/quran/ar.alafasy')
  Future<QuranDetailTextModel> getDetailSSurah();

  @GET(
      'https://maps.googleapis.com/maps/api/directions/json?destination=-33.923740%2C150.920166&mode=walking&origin={latitude}%2C{longitude}&key=AIzaSyALAfKe5ueBePbjdDKSgmxeEAaqouHemq4')
  Future<GooleMapDirectionModel> getDirection(
      @Path('latitude') double latitude, @Path('longitude') double longitude);

  @GET('https://countriesnow.space/api/v0.1/countries/flag/images')
  Future<CountriesModel> getCountries();

  @GET(
      'http://api.geonames.org/searchJSON?country={country}&featureClass=P&maxRows=10&username=usmanghani19899')
  Future<CityModel> getCity(@Path('country') String country);
}
