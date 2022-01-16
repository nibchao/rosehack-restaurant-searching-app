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

import 'dart:async';
import 'dart:math';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
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
    Random random = Random();
    int randomNumber = random.nextInt(3);
    var latitude = latArray[randomNumber]; var longitude = longArray[randomNumber];
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(latitude, longitude), zoom: 18.5)));
  }
}

var latArray = [33.974221, 33.976037, 33.974729];
var longArray = [-117.328810, -117.338161, -117.347125];


