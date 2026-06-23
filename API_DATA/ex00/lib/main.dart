import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = "";

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }
  Future<Position> getCurrentLocation() async{
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      setState(() {
         city = "permission denied";
      });
      permission = await Geolocator.requestPermission();
    }
    location = await Geolocator.getCurrentPosition();
    setState(() {
      city = location.latitude;
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (value){
              setState(() {
                city = value;
              });
              print(city);
            },
            decoration: InputDecoration(
              hintText: "Search a city",
              border: InputBorder.none,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                print("");
              }, 
              icon: Icon(Icons.my_location)
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Currently\n${city}")),
            Center(child: Text("Today\n${city}")),
            Center(child: Text("Weekly\n${city}")),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: TabBar(
            tabs: [
              Tab(text: "Currently", icon: Icon(Icons.timer)),
              Tab(text: "Today", icon: Icon(Icons.today)),
              Tab(text: "Weekly", icon: Icon(Icons.calendar_month)),
            ],
          ),
        ),
      ),
    );
  }
}
