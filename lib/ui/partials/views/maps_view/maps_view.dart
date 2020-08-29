import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class MapsView extends StatelessWidget {
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
          markers: [
            Marker(
              width: 30.0,
              height: 30.0,
              point: LatLng(13.019, 122.767),
              builder: (ctx) => Container(
                child: Container(width: 80.0, height: 80.0, decoration: BoxDecoration(backgroundBlendMode: BlendMode.colorBurn,shape: BoxShape.circle, color: Colors.red),),
              ),
            ),
            Marker(
              width: 30.0,
              height: 30.0,
              point: LatLng(11.019, 121.767),
              builder: (ctx) => Container(
                child: Container(width: 80.0, height: 80.0, decoration: BoxDecoration(backgroundBlendMode: BlendMode.colorBurn,shape: BoxShape.circle, color: Colors.red),),
              ),
            ),
            Marker(
              width: 40.0,
              height: 40.0,
              point: LatLng(14.019, 121.767),
              builder: (ctx) => Container(
                child: Container(width: 80.0, height: 80.0, decoration: BoxDecoration(backgroundBlendMode: BlendMode.colorBurn,shape: BoxShape.circle, color: Colors.red),),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
