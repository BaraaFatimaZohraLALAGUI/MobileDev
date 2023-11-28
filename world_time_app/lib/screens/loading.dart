import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String load = 'Loading ...';

  void setupWorldTime() async {
    WorldTime thing = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await thing.getTime();
    
    setState(() {
      load = thing.time;
    });

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': thing.location,
      'flag': thing.flag,
      'time': thing.time,
      'daytime': thing.daytime
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
      backgroundColor: Color.fromRGBO(249, 228, 243, 1),
      body: Center(
        child: SpinKitChasingDots(
          color: Color.fromRGBO(222, 57, 173, 1),
          size: 80.0,
        ),
      ),
    );
  }
}
