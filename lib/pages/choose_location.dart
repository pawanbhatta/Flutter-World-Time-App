import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', flag: 'uk.png', location: 'London'),
    WorldTime(url: 'Europe/Berlin', flag: 'greece.png', location: 'Berlin'),
    WorldTime(url: 'Africa/Cairo', flag: 'egypt.png', location: 'Cairo'),
    WorldTime(url: 'Africa/Nairobi', flag: 'kenya.png', location: 'Nairobi'),
    WorldTime(url: 'America/Chicago', flag: 'usa.png', location: 'Chicago'),
    WorldTime(url: 'America/New_York', flag: 'usa.png', location: 'New York'),
    WorldTime(url: 'Asia/Seoul', flag: 'south_korea.png', location: 'Seoul'),
    WorldTime(url: 'Asia/Jakarta', flag: 'indonesia.png', location: 'Jakarta'),
    WorldTime(
        url: 'Asia/Kathmandu', flag: 'uploadimage.png', location: 'Kathmandu'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
        centerTitle: true,
        backgroundColor: Colors.grey[500],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 2.0,
              horizontal: 2.0,
            ),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/${locations[index].flag}',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
