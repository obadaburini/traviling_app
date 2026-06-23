import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './app_data.dart';
import './models/trip.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './screens/trip_detail_screen.dart';
import './screens/category_trips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availableTrips = tripsData;
  final List<Trip> _favoriteTrips = [];

  // ==============================
  // FILTER LOGIC
  // ==============================
  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters
        ..clear()
        ..addAll(filterData);

      _availableTrips = tripsData.where((trip) {
        if (_filters['summer'] == true && !trip.isInSummer) {
          return false;
        }
        if (_filters['winter'] == true && !trip.isInWinter) {
          return false;
        }
        if (_filters['family'] == true && !trip.isForFamilies) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // ==============================
  // FAVORITE LOGIC
  // ==============================
  void _toggleFavorite(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);

    setState(() {
      if (existingIndex >= 0) {
        _favoriteTrips.removeAt(existingIndex);
      } else {
        final trip =
            tripsData.firstWhere((trip) => trip.id == tripId);
        _favoriteTrips.add(trip);
      }
    });
  }

  bool _isFavorite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'AE'),
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ).copyWith(
          secondary: Colors.amber,
        ),
        fontFamily: 'ElMessiri',
      ),
      initialRoute: '/',
      routes: {
'/': (ctx) => TabsScreen(_availableTrips, _favoriteTrips),
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(_availableTrips),
        TripDetailScreen.screenRoute: (ctx) =>
            TripDetailScreen(_toggleFavorite, _isFavorite),
        FiltersScreen.screenRoute: (ctx) =>
            FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}
