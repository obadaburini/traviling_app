import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';

  final List<Trip> availableTrips;

  const CategoryTripsScreen(this.availableTrips, {Key? key})
      : super(key: key);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;

  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_loadedInitData) return;

    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    if (routeArgument == null) return;

    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'] ?? '';

    displayTrips = widget.availableTrips.where((trip) {
      return categoryId != null &&
          trip.categories.contains(categoryId);
    }).toList();

    _loadedInitData = true;
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: displayTrips.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'لا توجد رحلات متاحة هنا 😅',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: displayTrips.length,
              itemBuilder: (ctx, index) {
                final trip = displayTrips[index];

                return TripItem(
                  id: trip.id,
                  title: trip.title,
                  imageUrl: trip.imageUrl,
                  duration: trip.duration,
                  tripType: trip.tripType,
                  season: trip.season,
                  removeItem: _removeTrip,
                );
              },
            ),
    );
  }
}
