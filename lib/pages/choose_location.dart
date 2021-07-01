import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:world_clock_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  List<WorldTime> locations = [
    WorldTime(location: "Abu Dhabi"),
    WorldTime(location: "AdamsTown"),
    WorldTime(location: "Amman"),
    WorldTime(location: "Amsterdam"),
    WorldTime(location: "Athens"),
    WorldTime(location: "Baghdad"),
    WorldTime(location: "Bangkok"),
    WorldTime(location: "Beijing"),
    WorldTime(location: "Beirut"),
    WorldTime(location: "Berlin"),
    WorldTime(location: "BrazzaVille(Congo)"),
    WorldTime(location: "Brussels(Belgium)"),
    WorldTime(location: "Bucharest"),
    WorldTime(location: "Budapest"),
    WorldTime(location: "Cairo"),
    WorldTime(location: "Damascus"),
    WorldTime(location: "Dhaka"),
    WorldTime(location: "GeorgeTown(Canada)"),
    WorldTime(location: "Hanoi"),
    WorldTime(location: "Harare"),
    WorldTime(location: "Havana"),
    WorldTime(location: "Islamabad"),
    WorldTime(location: "Jakarta"),
    WorldTime(location: "Jerusalem(Palestine)"),
    WorldTime(location: "Kathmandu"),
    WorldTime(location: "Kuala Lampur"),
    WorldTime(location: "Kolkata"),
    WorldTime(location: "Kuwait"),
    WorldTime(location: "London"),
    WorldTime(location: "Madrid"),
    WorldTime(location: "Mexico"),
    WorldTime(location: "Monaco"),
    WorldTime(location: "Moscow"),
    WorldTime(location: "New Delhi"),
    WorldTime(location: "New York"),
    WorldTime(location: "New Zealand"),
    WorldTime(location: "Oslo"),
    WorldTime(location: "Ottawa"),
    WorldTime(location: "Panama"),
    WorldTime(location: "Paris"),
    WorldTime(location: "Port Louis"),
    WorldTime(location: "Port of Spain"),
    WorldTime(location: "Prague"),
    WorldTime(location: "Pyongyang"),
    WorldTime(location: "Riyadh"),
    WorldTime(location: "Rome"),
    WorldTime(location: "Saint Denis"),
    WorldTime(location: "Saint George"),
    WorldTime(location: "San Marino"),
    WorldTime(location: "Santiago(Chile)"),
    WorldTime(location: "Singapore"),
    WorldTime(location: "Stockholm"),
    WorldTime(location: "Tehran"),
    WorldTime(location: "Tokyo"),
    WorldTime(location: "Vatican City"),
    WorldTime(location: "Vienna"),
    WorldTime(location: "Washington DC"),
    WorldTime(location: "Wellington(NZ)"),
    WorldTime(location: "Wellington(UK)")
  ];

  void updatetime(index) async {
    WorldTime obj = locations[index];
    await obj.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': obj.location,
      'time': obj.timeinlocation,
      'background': obj.background,
      'color': obj.color
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose a location:'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updatetime(index);
              },
              title: Text(locations[index].location),
            ),
          );
        },
      ),
    );
  }
}
