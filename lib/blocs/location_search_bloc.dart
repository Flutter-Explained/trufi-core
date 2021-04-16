import 'package:flutter/material.dart';

import '../blocs/bloc_provider.dart';
import '../location/location_search_storage.dart';
import '../trufi_models.dart';

class LocationSearchBloc extends BlocBase {
  static LocationSearchBloc of(BuildContext context) {
    return BlocProvider.of<LocationSearchBloc>(context);
  }

  LocationSearchBloc(BuildContext context) {
    storage.load(context, "assets/data/search.json");
  }

  final LocationSearchStorage storage = LocationSearchStorage();

  // Dispose

  @override
  void dispose() {}

  // Fetch

  Future<List<TrufiLocation>> fetchPlaces(BuildContext context) {
    return storage.fetchPlaces(context);
  }

  Future<List<LevenshteinObject>> fetchPlacesWithQuery(String query) {
    return storage.fetchPlacesWithQuery(query);
  }

  Future<List<LevenshteinObject>> fetchStreetsWithQuery(String query) {
    return storage.fetchStreetsWithQuery(query);
  }
}
