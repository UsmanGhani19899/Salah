import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salah/Models/asma_ul_husna_model.dart';
import 'package:salah/Models/islamic_calender_model.dart';
import 'package:salah/Models/prayer_Time_model.dart';
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
      @Path('latitude') String latitude, @Path('longitude') String longitude);
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
}
