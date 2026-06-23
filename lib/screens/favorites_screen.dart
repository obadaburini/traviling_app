import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../models/trip.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;

  const FavoritesScreen(this.favoriteTrips, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return const Center(
        child: Text(
          'ليس لديك أي رحلة في قائمة المفضلة',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'ElMessiri',
          ),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteTrips.length,
        itemBuilder: (ctx, index) {
          final trip = favoriteTrips[index];

          return TripItem(
            id: trip.id,
            title: trip.title,
            imageUrl: trip.imageUrl,
            duration: trip.duration,
            tripType: trip.tripType,
            season: trip.season,
          );
        },
      );
    }
  }
}
