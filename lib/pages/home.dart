import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

   data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
   print(data);

   // set background
   String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';


    return Scaffold(
      body: SafeArea(
         child: Container(
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/$bgImage'),
               fit: BoxFit.cover,
             )
           ),
           child: Padding(
             padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
             child: Column(
             children: <Widget>[
               TextButton.icon(onPressed: () async {
               dynamic result = await Navigator.pushNamed(context,'/location');
                 data = {
                   'time': result['time'],
                   'location': result['location'],
                   'isDaytime': result['isDaytime'],
                   'flag': result['flag'],

               };
               },
                icon: const Icon(Icons.edit_location),
                label: const Text('Edit Location'),
               ),
              const SizedBox(height: 20.0,),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  data['location'],
                  style: const TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                  ),
                ),
                ],
                ),
               const SizedBox(height: 20.0),
               Text(
                 data['time'],
                 style: const TextStyle(
                   fontSize: 50.0
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