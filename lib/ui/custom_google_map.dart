import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker {
  final String markerId;
  final String infoWindow;

  const CustomMarker({
    required this.markerId,
    required this.infoWindow,
  });
}

class CustomGoogleMap extends StatelessWidget {
  final CustomMarker? marker;
  final double size;
  final double lat;
  final double lng;
  final double zoom;

  const CustomGoogleMap({
    super.key,
    this.marker,
    this.size = 300,
    required this.lat,
    required this.lng,
    this.zoom = 15.0,
  });

  static GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: marker == null
            ? {}
            : {
                Marker(
                  markerId: MarkerId(marker!.markerId),
                  position: LatLng(lat, lng),
                  infoWindow: InfoWindow(title: marker!.infoWindow),
                )
              },
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lng),
          zoom: zoom,
        ),
      ),
    );
  }
}
