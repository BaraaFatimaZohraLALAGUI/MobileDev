import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: const Icon(Icons.edit_location,
                                color: Color.fromRGBO(222, 57, 173, 1),
                ),
                label: const Text('Choose Location'),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll( Color.fromRGBO(245, 213, 236, 1)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
