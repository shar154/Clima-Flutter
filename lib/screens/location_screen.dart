import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';


class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});

  final dynamic locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}


class _LocationScreenState extends State<LocationScreen> {

  double temperature;
  String description;
  int conditionNumber;
  String cityName;

  WeatherModel weather = WeatherModel();

  @override

  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  updateUI(dynamic weatherData)
  {
    setState(() {
      if (weatherData == null)
        {
          description = 'Unable to get weather data';
          temperature = 0;
          cityName = '';
          conditionNumber = 0;
        }
      else{
        description = weatherData['weather'][0]['description'];
        temperature = weatherData['main']['temp'];
        cityName = weatherData['name'];
        conditionNumber = weatherData['weather'][0]['id'];
        print('Temperature: $temperature City : $cityName Condition: $conditionNumber Description $description' );
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                      },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typeName = await Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          }
                      ));
                      if (typeName != null) {
                        var weatherData = await  weather.getCityWeather(typeName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      temperature.toStringAsFixed(0) + '°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weather.getWeatherIcon(conditionNumber),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  weather.getMessage(temperature.toInt()) + ' in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
