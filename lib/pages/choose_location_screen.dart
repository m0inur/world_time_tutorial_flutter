import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flagPath: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flagPath: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flagPath: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flagPath: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flagPath: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flagPath: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flagPath: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flagPath: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    // navigate to home screen
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flagPath,
      "time": instance.time,
      "isDayTime": instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card (
              child: ListTile(
                onTap: () {
                  updateTime(i);
                },
                title: Text(locations[i].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/${locations[i].flagPath}"),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
