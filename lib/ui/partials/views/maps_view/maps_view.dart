import 'package:Covid19_PH/ui/partials/views/maps_view/_CaseCoordinates.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class MapsView extends StatelessWidget {
  final List<CaseCoordinates> coordinates = [
    CaseCoordinates(cases: 1000, latitude: 13.019, longitude: 122.767),
    CaseCoordinates(cases: 100, latitude: 11.019, longitude: 122.167),
    CaseCoordinates(cases: 50, latitude: 14.019, longitude: 122.467),
    CaseCoordinates(cases: 10, latitude: 15.019, longitude: 122.367),
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(13.019, 121.767),
        zoom: 5.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(
          markers: _buildMarkers(coordinates),
        ),
      ],
    );
  }

  List<Marker> _buildMarkers(List<CaseCoordinates> coordinates) {
    List<Marker> res = [];

    coordinates.forEach((coordinate) {
      res.add(Marker(
        width: 30.0,
        height: 30.0,
        point: LatLng(coordinate.latitude, coordinate.longitude),
        builder: (ctx) => Container(
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.colorBurn,
                shape: BoxShape.circle,
                color: Colors.red),
          ),
        ),
      ));
    });

    return res;
  }
}
