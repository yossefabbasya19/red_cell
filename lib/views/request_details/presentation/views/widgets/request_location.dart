import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:red_cell/core/widgets/custom_eleveted_button.dart';
import 'package:red_cell/views/request_details/presentation/view_model/add_donation_cubit.dart';

class RequestLocation extends StatefulWidget {
  const RequestLocation({super.key});

  @override
  State<RequestLocation> createState() => _RequestLocationState();
}

class _RequestLocationState extends State<RequestLocation> {
  LatLng? _currentPosition;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      _currentPosition = location;
      _isLoading = false;
    });
  }

  Set<Marker> myMarker = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GoogleMap(
                    onTap: (argument) {
                      myMarker.add(
                        Marker(
                          markerId: MarkerId('1'),
                          position: LatLng(
                            argument.latitude,
                            argument.longitude,
                          ),
                        ),
                      );
                      BlocProvider.of<AddDonationCubit>(context).lat =
                          argument.latitude;
                      BlocProvider.of<AddDonationCubit>(context).long =
                          argument.longitude;

                      setState(() {});
                    },
                    markers: myMarker,
                    initialCameraPosition: CameraPosition(
                      target: _currentPosition!,
                      zoom: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: CustomElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      widget: Text(
                        "save",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
