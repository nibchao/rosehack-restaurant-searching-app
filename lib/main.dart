/*
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class _HomeScreenState extends State<HomeScreen> {
  Widget customSearchBar = const Text('Restaurant Selector');
  Widget searchDescription = const Text('Enter your address and select a search radius');
  Widget buttonName = const Text('Search for Restaurants');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        automaticallyImplyLeading: false,
        centerTitle: true
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton (
              child: buttonName,
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage())),
            )

            ),
          ],
      ),
      );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super( key : key );

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
      title: Container(
        width: double.infinity,
        height: 40,
        decoration: const BoxDecoration(
        color: Colors.white),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                  onPressed: () => GoogleMaps(),
              ),
              hintText: 'Search...',
              border: InputBorder.none),
            ),
          ),
        ),
      )
    );
  }
}

class GoogleMaps extends State<StatefulWidget> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Bar',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  //_HomePageState createState() => _HomePageState();
  _HomeScreenState createState() => _HomeScreenState();
}*/

/*
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Maps Test',
      home: SimpleMap(),
    );
  }
}

class SimpleMap extends StatefulWidget {
  const SimpleMap({Key? key}) : super(key: key);
  @override
  _SimpleMapState createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  static const LatLng _kMapCenter = LatLng(33.9737, -117.3281);

  static const CameraPosition _kInitialPosition = CameraPosition(target: _kMapCenter, zoom: 15.5, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Test'),
    ),
      body: const GoogleMap(
        initialCameraPosition: _kInitialPosition,
      ),
    );
  }
}*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'UCR Restaurant Picker',
      debugShowCheckedModeBanner: false,
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  Widget destination = const Text('Random Destination');

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.9737, -117.3281),
    zoom: 15,
  );

  static const CameraPosition _kDestination = CameraPosition(
      target: LatLng(33.973337, -117.328162),
      zoom: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToDestination,
        label: destination,
        icon: const Icon(Icons.directions_car),
      ),
    );
  }

  Future<void> _goToDestination() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kDestination));
  }
}
