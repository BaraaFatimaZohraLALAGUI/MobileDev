import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(222, 57, 173, 1),
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              color: const Color.fromRGBO(245, 213, 236, 1),
              child: ListTile(
                onTap: () async {
                      WorldTime instance = locations[index];
                      await instance.getTime();

                      Map result = {
                        'location': instance.location,
                        'flag': instance.flag,
                        'time': instance.time,
                        'daytime': instance.daytime,
                      };

                      Navigator.pop(context, result);
                },
                title: Text(
                  locations[index].location,
                  style: const TextStyle(
                      color: Color.fromRGBO(179, 0, 125, 1),
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic),
                ),
                leading: Container(
                  margin: const EdgeInsets.fromLTRB(2.0, 8.0, 15.0, 8.0),
                  child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}')),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
