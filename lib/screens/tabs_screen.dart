import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> availableTrips;
  final List<Trip> favoriteTrips;

  const TabsScreen(this.availableTrips, this.favoriteTrips, {Key? key})
      : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() => _selectedScreenIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    final screens = [
      CategoriesScreen(widget.availableTrips),
      FavoritesScreen(widget.favoriteTrips),
    ];

    final titles = [
      'تصنيفات الرحلات',
      'الرحلات المفضلة',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedScreenIndex]),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: secondaryColor,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
