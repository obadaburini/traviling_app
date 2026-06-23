import 'package:flutter/material.dart';
import '../app_data.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';

  final void Function(String) toggleFavorite;
  final bool Function(String) isFavorite;

  const TripDetailScreen(this.toggleFavorite, this.isFavorite, {Key? key})
      : super(key: key);

  Widget _buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId =
        ModalRoute.of(context)!.settings.arguments as String;

    final selectedTrip =
        tripsData.firstWhere((trip) => trip.id == tripId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),

            _buildSectionTitle(context, 'الأنشطة'),
            _buildContainer(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child:
                        Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            _buildSectionTitle(context, 'البرنامج اليومي'),
            _buildContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title:
                          Text(selectedTrip.program[index]),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavorite(tripId);
        },
        child: Icon(
          isFavorite(tripId)
              ? Icons.star
              : Icons.star_border,
        ),
      ),
    );
  }
}
