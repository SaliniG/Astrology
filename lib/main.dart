import 'package:astrology/pages/apod_page.dart';
import 'package:astrology/view%20models/planetary_data_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Astrology Picture of the Day",
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (context) => PlanetaryDataViewModel(),
          child: APODPage(),
        ));
  }
}
