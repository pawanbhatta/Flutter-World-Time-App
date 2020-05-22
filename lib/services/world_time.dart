import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // The location in the UI
  String time; //The time in the given location
  String flag; //The flag icon of location
  String url; //  Location url for the api endpoint
  bool isDayTime; //  To check if its day time or night time

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //make the request
      Response timeData =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(timeData.body);
      // print(data);

      //get properties from data
      String dateTime = data['datetime'];
      String offsetHr = data['utc_offset'].substring(1, 3);
      String offsetMin = data['utc_offset'].substring(4, 6);

      //create dateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(
          Duration(hours: int.parse(offsetHr), minutes: int.parse(offsetMin)));

      // Set the time property
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught Some Error :: $e');
      time = 'Could not get the time data';
    }
  }
}
