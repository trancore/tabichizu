import 'package:flutter/material.dart';
import 'package:tabichizu/ui/common/icon/custom_icon.dart';
import 'package:tabichizu/ui/custom_google_map.dart';

class LocationWidget extends StatefulWidget {
  final double lat;
  final double lng;
  final String? id;
  final String? title;
  final String? prefecture;
  final Function(String title, String prefecture, double lat, double lng)?
      registerLocation;
  final Function(String id)? deleteLocation;

  const LocationWidget({
    super.key,
    required this.lat,
    required this.lng,
    this.id,
    this.title,
    this.prefecture,
    this.registerLocation,
    this.deleteLocation,
  });

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomGoogleMap(
          marker: CustomMarker(markerId: "", infoWindow: widget.title ?? ""),
          lat: widget.lat,
          lng: widget.lng,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40, bottom: 84),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              widget.registerLocation != null && widget.prefecture != null
                  ? IconButton(
                      onPressed: () {
                        widget.registerLocation!(widget.title ?? "無題",
                            widget.prefecture ?? "", widget.lat, widget.lng);
                      },
                      icon: const CustomIcon(
                        icon: Icons.add,
                        size: 64,
                      ),
                    )
                  : const SizedBox(),
              widget.deleteLocation != null && widget.id != null
                  ? IconButton(
                      onPressed: () {
                        widget.deleteLocation!(widget.id!);
                      },
                      icon: const CustomIcon(
                        icon: Icons.delete,
                        size: 64,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}
