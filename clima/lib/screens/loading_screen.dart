import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  //initState
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=780724d76e5dbd3215c622ff6539eca2");
    var weatherData = await networkHelper.getData();
    print(weatherData);
  }

  // build
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  //deacticate- destroy
}

/*



      "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=780724d76e5dbd3215c622ff6539eca2");
 


var temp = jsonDecode(data)['main']['temp'];
    var id = jsonDecode(data)['weather'][0]['id'];
    var city = jsonDecode(data)['name'];
    print(temp);
    print(id);
    print(city);



*/
