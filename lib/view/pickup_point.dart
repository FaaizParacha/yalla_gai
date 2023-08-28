import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yalla_gai/utils/routes.dart';
import 'package:yalla_gai/view/pick_up_map.dart';

import '../utils/contstants.dart';

class PickUpPoint extends StatefulWidget {
  const PickUpPoint({super.key});

  @override
  State<PickUpPoint> createState() => _PickUpPointState();
}

class _PickUpPointState extends State<PickUpPoint> {
  final searchController = TextEditingController();

  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });

  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar:  AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8,right: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: 10.borderRadius,
                  border: Border.all(color: blackColor,width: 0.8)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon:  Icon(Icons.arrow_back_ios,color: blackColor,),
                ),
              ),
            )
        ),
        title: Text('Select Pick-up Point',style: GoogleFonts.plusJakartaSans(
          color: blackColor
        ),)

      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          24.height,
          TextFormField(
            readOnly: true,
            controller: searchController,
            decoration: InputDecoration(
              hintText: _currentAddress??'select your Pick-up Point',
              hintStyle: GoogleFonts.plusJakartaSans(
                color: appColor
              ),
              suffixIcon: Icon(Icons.search_rounded,color: appColor,),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: appColor)
              )
            ),
          ),
          12.height,
          ListTile(
            title: Text('Select on map',style: 16.black500Text,),
            leading: Container(
              height: 40,
                width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: blackColor),
                shape: BoxShape.circle,
                color: whiteColor,
              ),
              child: Icon(Icons.location_on_sharp,color: appColor,),
            )
          ),
          12.height,
          ListTile(
              onTap:()async{
                await _getCurrentPosition();
                _currentAddress==null?
                null:
                await MyRouteBase().myRouteFn(context, MyMapScreen(
                  pickUpAddress: _currentAddress.toString(),
                  dropOffAddress: '',
                ));
              },
              title: Text('Add current Location',style: 16.black500Text,),
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: blackColor),
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
                child: Icon(Icons.my_location_rounded,color: appColor,),
              )
          ),
          12.height,
          Text('Recent Rides',style: GoogleFonts.plusJakartaSans(
            color: appColor,
            decoration: TextDecoration.underline
          ),),
          12.height,
          ListTile(
              title: Text('Martahalli Street',style: 16.black500Text,),
              leading: CircleAvatar(
                radius: 10,
                backgroundColor: appColor.withOpacity(0.4),
              ),
            subtitle: Text('Opposite Kalamandir road, 124 cross road, karnataka, bengaluru',style: GoogleFonts.plusJakartaSans(),),
          ),

        ],
      ),
    );
  }
}
