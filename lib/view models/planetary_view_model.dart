import 'package:astrology/models/planetary.dart';

class PlanetaryViewModel {
  final Planetary planetary;

  PlanetaryViewModel({this.planetary});

  String get title {
    return this.planetary.title;
  }

  String get url {
    return this.planetary.url;
  }
}
