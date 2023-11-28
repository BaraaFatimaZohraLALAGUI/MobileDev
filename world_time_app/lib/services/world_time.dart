import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  late String time; // time in the location
  late String location; // location name for the UI
  late String flag; // url to an asset flag icon
  late String url; //location url for api end point
  bool daytime = true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // make request for data from api
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));

      // convert data from string to map
      Map data = jsonDecode(response.body);

      // get properties
      String datetime = data['datetime'].toString();
      String offset = data['utc_offset'].substring(1, 3);

      // making datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      daytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.yMd().add_jm().format(now).toString();
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
