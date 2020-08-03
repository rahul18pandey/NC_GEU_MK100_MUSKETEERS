import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:weather/weather_library.dart';

import '../app_localizations.dart';

enum AppState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }



class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String key = '61c6b4f4bfc8a3a2c06ccc9843ac5238';
  WeatherFactory ws;
  List<Weather> _data = [];
  AppState _state = AppState.NOT_DOWNLOADED;
  double lat, lon;
  Future<Weather> snapshot;
  @override
  void initState() {
    super.initState();
    ws = new WeatherFactory(key);
    getUserLocation();
  }

  void queryForecast() async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      _state = AppState.DOWNLOADING;
    });

    List<Weather> forecasts = (await ws.fiveDayForecastByLocation(lat, lon)).cast<Weather>();
    setState(() {
      _data = forecasts;
      _state = AppState.FINISHED_DOWNLOADING;
    });
  }

  void queryWeather() async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _state = AppState.DOWNLOADING;
    });

    Weather weather = (await ws.currentWeatherByLocation(lat, lon)) as Weather;
    setState(() {
      _data = [weather];
      _state = AppState.FINISHED_DOWNLOADING;
    });
  }

  Widget contentFinishedDownload() {
    if(_data[0]!=null) {
      return Center(
        child: ListView.separated(
          itemCount: _data.length,

          itemBuilder: (context, index) {

            int ind=_data[index].toString().indexOf("[");
            int date=_data[index].toString().indexOf(("Date"));
            int weather=_data[index].toString().indexOf(("Weather"));
            int temp=_data[index].toString().indexOf(("Temp"));
            int sunrise=_data[index].toString().indexOf("Sunrise");
            int sunset=_data[index].toString().indexOf("Sunset");
            int condition=_data[index].toString().indexOf("Condition");
            return ListTile(
                title: Container(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "${_data[index].toString().substring(16,ind)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/header.png'),
                                  alignment: Alignment.centerRight),
                            ),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text("Date : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                      Text(_data[index].toString().substring(date+5,date+17,),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    children: <Widget>[
                                      Text("Time : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                      Text(_data[index].toString().substring(date+17,weather-5),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                  SizedBox(height: 40.0),
                                  Text(
                                    'Day ${_data[index].toString().substring(temp+56,temp+63)}'+'° ↑' +
                                        ' • ' +
                                        'Night ${_data[index].toString().substring(temp+32,temp+36)}'+
                                        '° ↓',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "${_data[index].toString().substring(temp+58,temp+62)}"+
                                            '°',
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Container(
                                        child: Column(

                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Image.network(
                                              'http://openweathermap.org/img/wn/' +
                                                  '.png',
                                              height: 40,
                                            ),
                                            Center(
                                              child: Text("${_data[index].toString().substring(weather+8,temp)}",
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                    FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),

                                            SizedBox(height: 5.0)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Feels like ${_data[index].toString().substring(temp+91,temp+96)}'+
                                        '°',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.fromLTRB(40, 20, 40, 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Details',
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5.0)),
                                      elevation: 2.0,
                                      onPressed: null,
                                      disabledColor: Colors.white,
                                      disabledElevation: 2.0,
                                      disabledTextColor: Colors.black,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 120.0,
                                        height: 120.0,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: Container(
                                                height: 5.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5.0),
                                                    color:
                                                    Colors.lightBlueAccent),
                                              ),
                                            ),
                                            SizedBox(height: 20.0),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  'assets/images/sunny.png',
                                                  width: 20,
                                                ),
                                                Text(
                                                  "Sunrise",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 16.0),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 6.0),
                                            Text(
                                              _data[index].toString().substring(sunrise+9,sunset-2)=='${ null}'?"    ---":_data[index].toString().substring(sunrise+20,sunset-2),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 19.0),
                                            )
                                          ],
                                        ),
                                      ),
                                      color: Colors.white,
                                    ),
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5.0)),
                                      elevation: 2.0,
                                      onPressed: null,
                                      disabledColor: Colors.white,
                                      disabledElevation: 2.0,
                                      disabledTextColor: Colors.black,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 120.0,
                                        height: 120.0,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(height: 12,),
                                            Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: Container(
                                                height: 5.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5.0),
                                                    color: Colors.orangeAccent),
                                              ),
                                            ),
                                            SizedBox(height: 20.0),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  'assets/images/sunny.png',
                                                  width: 20,
                                                ),
                                                Text(
                                                  "Sunset",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 16.0),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 6.0),
                                            Text(
                                              _data[index].toString().substring(sunset+8,condition-13)=='${ null}'?"    ---":_data[index].toString().substring(sunset+19,condition-10),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 19.0),
                                            )
                                          ],
                                        ),
                                      ),
                                      color: Colors.white,
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )

            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 10,
            );
          },
        ),
      );
    }else{
      return Center(
        child: contentNotDownloaded(),
      );
    }
  }

  Widget contentDownloading() {
    return Container(
        margin: EdgeInsets.all(25),
        child: Column(children: [
          Text(
            'Fetching Weather...',
            style: TextStyle(fontSize: 20),
          ),
          Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(child: CircularProgressIndicator(strokeWidth: 10)))
        ]));
  }

  Widget contentNotDownloaded() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Press the button to download the Weather forecast',
          ),
        ],
      ),
    );
  }

  Widget _resultView() => _state == AppState.FINISHED_DOWNLOADING
      ? contentFinishedDownload()
      : _state == AppState.DOWNLOADING
      ? contentDownloading()
      : contentNotDownloaded();



  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          child:  RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 4.0,
            onPressed: queryWeather,
            disabledColor: Colors.orange,
            disabledElevation: 4.0,
            disabledTextColor: Colors.black,
            child: Container(
              alignment: Alignment.center,
              width: 80.0,
              child: Text(
                "Today",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                ),
              ),
            ),
            color: Colors.orange,
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 4.0,
            onPressed: queryForecast,
            disabledColor: Colors.orange,
            disabledElevation: 4.0,
            disabledTextColor: Colors.black,
            child: Container(
              alignment: Alignment.center,
              width: 80.0,
              child: Text(
                "Forecast",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                ),
              ),
            ),
            color: Colors.orange,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            centerTitle:true,
            title: Text(AppLocalizations.of(context).translate('first_string'), textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
            backgroundColor: Color(0xFF637BFF),
            elevation: 0,
            automaticallyImplyLeading: true,
          ),
          body:
          DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0],
                  colors: [Color(0xFF637BFF),Color(0XFF21C8F6)],
                ),
              ),

              child: Column(
                children: <Widget>[

                  _buttons(),
                  Expanded(child: _resultView())
                ],
              )),)
    );
  }
  getUserLocation() async {//call this async method from whereever you need

    LocationData myLocation;
    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }

    final coordinates = new Coordinates(
        myLocation.latitude, myLocation.longitude);
    lat=double.parse("${myLocation.latitude}");
    lon=double.parse("${myLocation.longitude}");
  }
}