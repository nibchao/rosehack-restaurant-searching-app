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

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter_svg/flutter_svg.dart';


void main() => runApp(const MyApp());

List<String> locations = ["Panda Express", "Kimchichanga", "Rising Savor", "Wingstop", "Boba Tea House"];
int size = locations.length;
var latArray = [33.974221, 33.976037, 33.974729, 33.973720, 33.9830878];
var longArray = [-117.328810, -117.338161, -117.347125, -117.349570, -117.3285733];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'UCR Restaurant Picker',
      debugShowCheckedModeBanner: false,
      //home: MapSample(),
      home: test(),
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
  final Map<String, Marker> _markers = {};
  Widget destination = const Text('Random Destination');
  static const UCR = LatLng(33.9737, -117.3281);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: UCR,
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Food places by UCR'),
            backgroundColor: Colors.blue,
          ),
          body: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: _markers.values.toSet(),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _goToDestination,
            label: destination,
            icon: const Icon(Icons.directions_car),
          ),
        ));
  }

  String Address = 'Placeholder';

  Future<void> _goToDestination() async {
    final GoogleMapController controller = await _controller.future;
    Random random = Random();
    int randomNumber = random.nextInt(size);
    var latitude = latArray[randomNumber]; var longitude = longArray[randomNumber];
    Future<void> GetAddressFromLatLong(Position position) async {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

      _markers.clear();
      for (int cnt = 0; cnt < size; cnt++)
      {
        final marker = Marker(markerId: MarkerId(locations[cnt]),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: InfoWindow(
            title: locations[cnt],
            snippet: Address,
          ),
        );
        _markers[locations[cnt]] = marker;
      }
    }
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(latitude, longitude), zoom: 18.5)));
  }
}

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 445, height: 1500,
        child: Stack(children: <Widget>[Positioned(top: 0, left: 0, child: Container(width: 500, height: 1080, decoration: const BoxDecoration(color : Color.fromRGBO(212, 134, 134, 1)))),
          Positioned(top: 211, left: 53, child: SvgPicture.asset('assets/images/ellipse2.svg', semanticsLabel: 'ellipse2')),
          Positioned(top: 287, left: 277, child: SvgPicture.asset('assets/images/ellipse5.svg', semanticsLabel: 'ellipse5')),
          Positioned(top: 287, left: 0, child: SvgPicture.asset('assets/images/ellipse4.svg', semanticsLabel: 'ellipse4')),
          Positioned(top: 211, left: 277, child: SvgPicture.asset('assets/images/ellipse3.svg', semanticsLabel: 'ellipse3')),
          Positioned(top: 359, left: 111, child: SvgPicture.asset('assets/images/ellipse1.svg', semanticsLabel: 'ellipse1')),
          Positioned(top: 174, left: 169, child: SvgPicture.asset('assets/images/ellipse6.svg', semanticsLabel: 'ellipse6')),
          //Positioned(top: 252, left: 178, child: Container(width: 90, height: 97, decoration: const BoxDecoration(image : DecorationImage(image: AssetImage('assets/images/asset1.png'), fit: BoxFit.fitWidth)))),
          const Positioned(top: 440,left: 111,child: Text('test text', textAlign: TextAlign.left, style: TextStyle(color: Color.fromRGBO(174, 70, 70, 1),fontFamily: 'Risque',fontSize: 60,letterSpacing: 0))),
          //fontWeight: FontWeight.normal, height: 1))),
]
)
);
  }
}

