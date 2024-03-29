import 'package:flutter/material.dart';
import 'package:world_time_app/Services/World_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png',url: 'Europe/Berlin');
    await instance.getTime();
   Navigator.pushReplacementNamed(context,'/home',arguments: {
     'location' : instance.location,
     'flag' : instance.flag,
     'time' : instance.time,
     'isDaytime' : instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: SpinKitHourGlass(
       color: Colors.greenAccent,
       size: 100.0,
        ),
      ),
    );
  }
}

