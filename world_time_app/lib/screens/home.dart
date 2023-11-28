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
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    String bgImage = data['daytime'] ? 'assets/day.png' : 'assets/night.png';

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic res =
                        await Navigator.pushNamed(context, '/location');

                    setState(() {
                      data = {
                        'time': res['time'],
                        'location': res['location'],
                        'daytime': res['daytime'],
                        'flag': res['flag'],
                      };
                    });
                    res;
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: Color.fromRGBO(222, 57, 173, 1),
                  ),
                  label: const Text(
                    'Choose Location',
                    style: TextStyle(color: Color.fromRGBO(149, 71, 126, 1)),
                  ),
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
                          color: Color.fromARGB(255, 255, 112, 217)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                  child: Text(
                    data['time'],
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(179, 0, 125, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
