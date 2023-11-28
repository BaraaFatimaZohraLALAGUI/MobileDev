import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
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
                icon: const Icon(
                  Icons.edit_location,
                  color: Color.fromRGBO(222, 57, 173, 1),
                ),
                label: const Text('Choose Location'),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(245, 213, 236, 1)),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: const Color.fromARGB(255, 101, 45, 86)
                    ),
                  )
                ],
              ),
              // const SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(255, 77, 205, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
