import 'package:flutter/material.dart';
import '../services/webservice.dart';
import './planetary_view_model.dart';

class PlanetaryDataViewModel extends ChangeNotifier {
  PlanetaryViewModel data = PlanetaryViewModel();
  var loading = false;

  Future<void> fetchAstroDetails(String keyword) async {
    loading = true;
    notifyListeners();
    final results = await Webservice().fetchDetails(keyword);
    this.data = PlanetaryViewModel(planetary: results);
    loading = false;
    notifyListeners();
  }
}
