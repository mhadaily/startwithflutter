import 'package:flutter/material.dart';
import '../data/weather_data_provider.dart';
import '../models/weather.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  double opacityLevel = 1.0;
  WeatherInfo weatherInfo;

  AnimationController controller;
  Animation<double> animation;
  Animation<Offset> weatherIconOffsetAnimation;
  Animation<Offset> dateOffsetAnimation;
  Animation<Offset> weatherDescOffsetAnimation;
  Animation<Offset> locationOffsetAnimation;
  Animation<Offset> temperatureOffsetAnimation;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final WeatherInfo value = await fetchWeatherInfo();
      setState(() {
        weatherInfo = value;
      });
    });

    controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    weatherIconOffsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.4),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.500,
          curve: Curves.easeIn,
        ),
      ),
    );
    dateOffsetAnimation = Tween<Offset>(
      begin: Offset(-0.5, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.300,
          curve: Curves.ease,
        ),
      ),
    );
    weatherDescOffsetAnimation = Tween<Offset>(
      begin: Offset(-0.5, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.1,
          0.400,
          curve: Curves.ease,
        ),
      ),
    );
    locationOffsetAnimation = Tween<Offset>(
      begin: Offset(-0.5, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.2,
          0.600,
          curve: Curves.ease,
        ),
      ),
    );
    temperatureOffsetAnimation = Tween<Offset>(
      begin: Offset(-0.5, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.4,
          0.900,
          curve: Curves.ease,
        ),
      ),
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: weatherInfo != null
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.shade900,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: <Widget>[
                  _cloudIcon(),
                  _temperature(),
                  _location(),
                  _date(),
                  _weatherDesc(),
                  _hourlyWeather(),
                  _weeklyWeather(),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.shade900,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
    );
  }

  Widget _weeklyWeather() {
    return Expanded(
      child: FadeTransition(
        opacity: animation,
        child: ListView.builder(
          itemCount: weatherInfo.days.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 30.0,
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Text(
                      weatherInfo.days[index].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Icon(
                      Icons.cloud_queue,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        weatherInfo.temps[index].toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _hourlyWeather() {
    return FadeTransition(
      opacity: animation,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white.withOpacity(0.3),
            ),
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
        ),
        height: 100.0,
        child: ListView.builder(
          itemCount: weatherInfo.times.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 50.0,
              child: Card(
                color: Colors.transparent,
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          weatherInfo.times[index].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        Icon(Icons.cloud_queue, color: Colors.white),
                        Text(
                          weatherInfo.temps[index].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _cloudIcon() {
    return Container(
      height: 200.0,
      child: Center(
        child: SlideTransition(
          position: weatherIconOffsetAnimation,
          child: FadeTransition(
            opacity: animation,
            child: Image.network(
              'https://assets.codepen.io/1666433/snow-ios.png',
              height: 90.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _temperature() {
    return SlideTransition(
      position: temperatureOffsetAnimation,
      child: FadeTransition(
        opacity: animation,
        child: Container(
          padding: EdgeInsets.only(left: 20.0),
          alignment: Alignment.centerLeft,
          child: Text(
            '-10\u00B0',
            style: TextStyle(
              color: Colors.white,
              fontSize: 84.0,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }

  Widget _location() {
    return SlideTransition(
      position: locationOffsetAnimation,
      child: FadeTransition(
        opacity: animation,
        child: Container(
          padding: EdgeInsets.only(left: 20.0),
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.place, color: Colors.white),
              Text(
                'Moscow,Russia',
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _date() {
    return SlideTransition(
      position: dateOffsetAnimation,
      child: FadeTransition(
        opacity: animation,
        child: Container(
          padding: EdgeInsets.only(left: 20.0, top: 10.0),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  'TODAY',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0),
                ),
              ),
              Text(
                '20.10.2020',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _weatherDesc() {
    return SlideTransition(
      position: weatherDescOffsetAnimation,
      child: FadeTransition(
        opacity: animation,
        child: Container(
          padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Snow turn to cloud',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
