import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import the Google Maps package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RoadRaze',
      theme: ThemeData(
        primaryColor: Colors.transparent, // Make the app bar transparent.
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent, // Set app bar background color to transparent.
          elevation: 0, // Remove shadow from app bar.
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RoadRaze',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the app name bold.
            color: Colors.black, // Set app name text color to black.
            fontSize: 28.0, // Increase font size for a larger heading.
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black, // Set hamburger icon color to black.
            ),
            onPressed: () {
              // Open the drawer menu when the hamburger icon is clicked.
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent, // Make the drawer header transparent.
              ),
              child: Text(
                'Menu Options',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set text color to black.
                ),
              ),
            ),
            ListTile(
              title: Text('Option 1'),
              onTap: () {
                // Handle Option 1.
              },
            ),
            ListTile(
              title: Text('Option 2'),
              onTap: () {
                // Handle Option 2.
              },
            ),
            // Add more menu options as needed.
          ],
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.7749, -122.4194), // Replace with your desired initial map coordinates.
              zoom: 12, // Adjust the initial zoom level.
            ),
            // Add other Google Map configuration options as needed.
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // Add glass effect with opacity.
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Add your option icons and labels here.
                  OptionWidget(icon: Icons.report, label: 'Report Issue'),
                  OptionWidget(icon: Icons.location_on, label: 'Nearby Incidents'),
                  OptionWidget(icon: Icons.info, label: 'About Us'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const OptionWidget({required this.icon, required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32.0, color: Colors.black), // Icon
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ), // Label
      ],
    );
  }
}
