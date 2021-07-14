import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // Location name for the UI
  late String time; // The time in that location
  late String flagPath; // url to an asset flag path
  late String url; // Location URL for API endpoint
  late bool isDayTime;

  WorldTime(
      {required this.location, required this.flagPath, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // Get properties from data
      String dateTime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);

      // Create DateTIme object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property
      isDayTime = now.hour > 6 && now.hour < 20;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Error found $e");
      time = "Could not get time data";
    }
  }
}
