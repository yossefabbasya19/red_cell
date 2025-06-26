import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';

class MapLocation extends StatefulWidget {
  MapLocation({super.key});

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  Set<Marker> myMarker = {};

  @override
  Widget build(BuildContext context) {
    DonationDetailsDm donationDetailsDm =
        ModalRoute.settingsOf(context)!.arguments as DonationDetailsDm;
    return Scaffold(
      appBar: AppBar(title: Text("donation Map")),
      body: GoogleMap(

        markers: myMarker,
        onMapCreated: (controller) {
          myMarker.add(
            Marker(
              infoWindow: InfoWindow(title: donationDetailsDm.pateintName),
              markerId: MarkerId('1'),
              position: LatLng(donationDetailsDm.lat, donationDetailsDm.lng),
            ),
          );
          setState(() {});
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(donationDetailsDm.lat, donationDetailsDm.lng),
          zoom: 10,
        ),
      ),
    );
  }
}
