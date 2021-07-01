import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name
  var mylocationtime;
  var utctime;
  var offset;
  var opdecider;
  var timeinlocation;
  var wallbool;
  var background;
  var color;
  //String flag;
  //String url;//location url for API

  WorldTime({required this.location});

  Future<void> getTime() async {
    try {
      mylocationtime = DateTime.now();
      print('$mylocationtime');

      utctime = mylocationtime.toUtc();
      print('$utctime');

      var data = rootBundle.loadString('Assets/offset.json');
      var mydata = json.decode(await data);

      print(mydata);

      offset = mydata["$location"].toString();
      print('$offset');

      opdecider = offset.substring(0, 1);
      print(opdecider);

      if (opdecider == "+") {
        timeinlocation = utctime.add(Duration(
          hours: int.parse(offset.substring(1, 3)),
          minutes: int.parse(offset.substring(4, 6)),
        ));
        wallbool = timeinlocation.hour;
        print(timeinlocation);
        print(wallbool);
        timeinlocation = DateFormat.jm().format(timeinlocation);
        print(timeinlocation);
      } else {
        timeinlocation = utctime.subtract(Duration(
          hours: int.parse(offset.substring(1, 3)),
          minutes: int.parse(offset.substring(4, 6)),
        ));
        wallbool = timeinlocation.hour;
        print(timeinlocation);
        print(wallbool);
        timeinlocation = DateFormat.jm().format(timeinlocation);
        print(timeinlocation);
      }
    } catch (e) {
      timeinlocation = 'Could not retreive data, try again later!';
      print('$e');
    }
    if (wallbool >= 0 && wallbool < 4) {
      background = 'Night.jpg';
      color = Colors.black38;
    } else if (wallbool >= 4 && wallbool < 12) {
      background = 'Morning.jpg';
      color = Colors.grey;
    } else if (wallbool >= 12 && wallbool < 16) {
      background = 'Noon.jpg';
      color = Colors.white60;
    } else {
      background = 'Evening.jpg';
      color = Colors.blueGrey;
    }
  }
}
