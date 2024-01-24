library my_prj.globals;

import 'package:get_storage/get_storage.dart';

const String GOOGLE_MAPS_API_KEY = "API_KEY_HERE";

// double? latitude;
// double? longitude;
class Constant {
  final box = GetStorage();

  String format(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);

    String formattedDuration = '';

    if (hours > 0) {
      formattedDuration += '${_pluralize(hours, ':')} ';
    }

    if (minutes > 0) {
      formattedDuration += '${_pluralize(minutes, ':')}';
    }

    return formattedDuration.trim();
  }

  String _pluralize(int value, String unit) {
    if (value == 1) {
      return '$value $unit';
    } else {
      return '$value ${unit}';
    }
  }
}
