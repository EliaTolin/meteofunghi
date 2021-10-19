import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meteo Funghi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MapPage extends StatefulWidget {
  MapPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(44.6261685308702, 10.949406098680658),
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;
  Marker _origin = Marker(
    markerId: const MarkerId('origin'),
    position: const LatLng(44.6261685308702, 10.949406098680658),
  );

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        zoomControlsEnabled: true,
        myLocationButtonEnabled: false,
        onMapCreated: (controller) => _googleMapController = controller,
        markers: <Marker>{_origin},
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
