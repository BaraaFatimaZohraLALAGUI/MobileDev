import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

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
    Navigator.pushReplacementNamed(context, '/home', arguments: {'location': thing.location, 'flag': thing.flag, 'time': thing.time });
  }

  @override
  void initState() {
    super.initState();

    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(load),
            ),
          ],
        )),
      ),
    );
  }
}
