import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_services/shared/components/content_container.dart';

class ServiceMapScreen extends StatefulWidget {
  const ServiceMapScreen({super.key});

  @override
  State<ServiceMapScreen> createState() => _ServiceMapScreenState();
}

class _ServiceMapScreenState extends State<ServiceMapScreen> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};

  static const LatLng _center = LatLng(-23.5505, -46.6333); // São Paulo

  @override
  void initState() {
    super.initState();

    _markers.addAll([
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(-23.552, -46.634),
        infoWindow: InfoWindow(title: "Service 1", snippet: "Rua tal, 123"),
      ),
      Marker(
        markerId: MarkerId("2"),
        position: LatLng(-23.548, -46.630),
        infoWindow: InfoWindow(title: "Service 2", snippet: "Rua outra, 456"),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentContainer(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: _center, zoom: 14),
          onMapCreated: (controller) {
            _mapController = controller;
          },
          markers: _markers,
          myLocationEnabled: true,
        ),
      ),
    );
  }
}
