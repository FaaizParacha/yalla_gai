import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yalla_gai/utils/contstants.dart';
import 'package:yalla_gai/view/drop_off_point.dart';
import 'package:yalla_gai/view/pickup_point.dart';

import '../utils/routes.dart';

class MyMapScreen extends StatefulWidget {
  final String pickUpAddress,dropOffAddress;
  const MyMapScreen({super.key,required this.pickUpAddress,
  required this.dropOffAddress
  });

  @override
  State<MyMapScreen> createState() => _MyMapScreenState();
}

class _MyMapScreenState extends State<MyMapScreen> {
// created controller for displaying Google Maps
  Completer<GoogleMapController> _controller = Completer();

// given camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(19.0759837, 72.8776559),
    zoom: 15,
  );

  Uint8List? marketimages;
  List<String> images = ['assets/Car.png','assets/Car.png', 'assets/Car.png', 'assets/Car.png', 'assets/Car.png'];

// created empty list of markers
  final List<Marker> _markers = <Marker>[];

// created list of coordinates of various locations
  final List<LatLng> _latLen = <LatLng>[

    LatLng(19.0759837, 72.8776559),
    LatLng(28.679079, 77.069710),
    LatLng(26.850000, 80.949997),
    LatLng(24.879999, 74.629997),
    LatLng(16.166700, 74.833298),
    LatLng(12.971599, 77.594563),
  ];

// declared method to get Images
  Future<Uint8List> getImages(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();

  }
String address = '';

  void _handleMapTap(LatLng latLng) async {
    final List<Placemark> placemarks = await placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    if (placemarks.isNotEmpty) {
      setState(() {
         address = placemarks[0].name ?? 'Unknown Address';
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Picked Address'),
            content: Text(address),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initialize loadData method
    loadData();
  }


  loadData() async{
    for(int i=0 ;i<images.length; i++){
      final Uint8List markIcons = await getImages(images[i], 100);
      // makers added according to index
      _markers.add(
          Marker(
            // given marker id
            markerId: MarkerId(i.toString()),
            // given marker icon
            icon: BitmapDescriptor.fromBytes(markIcons),
            // given position
            position: _latLen[i],
            infoWindow: InfoWindow(
              // given title for marker
              title: 'Location: '+i.toString(),
            ),
          )
      );
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            // given camera position
            initialCameraPosition: _kGoogle,
            // set markers on google map
            markers: Set<Marker>.of(_markers),
            // on below line we have given map type
            mapType: MapType.normal,
            // on below line we have enabled location
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
           onTap: _handleMapTap,
            compassEnabled: true,
            // below line displays google map in our app
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),

          const Positioned(
              top: 40,
              left: -5,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)
                  )
                ),
            child: Padding(
              padding:  EdgeInsets.all(12.0),
              child: Icon(Icons.menu),
            ),
          )),

          widget.pickUpAddress==null||widget.pickUpAddress==''?
          Positioned(
              bottom: 100,
              right: 0,
              child: Container(
            height: 80,width: 350,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Visits',
                        style: GoogleFonts.plusJakartaSans(
                        color: appColor
                      ),),
                      Divider(thickness: 1,),

                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: 8.borderRadius,
                              border: Border.all(color: blackColor,width: 0.3)
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.location_on_sharp,color: blackColor,size: 16,),
                                Text('Country',style: 12.blackText,),
                              ],
                            )
                          ),
                          10.width,
                          Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: 8.borderRadius,
                                  border: Border.all(color: blackColor,width: 0.3)
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_sharp,color: blackColor,size: 16,),
                                  Text('Country',style: 12.blackText,),
                                ],
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                ),
          ),
          ):

          Positioned(
            bottom: 100,
            right: 0,
            child: Container(
              height: 120,width: 350,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: appColor
                        ),
                        child: Center(
                          child: Text('A',style: GoogleFonts.plusJakartaSans(
                            color: whiteColor
                          ),),
                        ),
                      ),
                      10.width,
                      Flexible(
                        child: Text(
                          widget.pickUpAddress,maxLines: 2,
                          style: GoogleFonts.plusJakartaSans(
                              color: blackColor
                          ),),
                      ),
                    ],
                  ),
                    4.height,
                    Icon(Icons.arrow_downward_rounded,color: blackColor,),
                    4.height,
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: appColor
                            ),
                              shape: BoxShape.circle,
                              color: address==''?whiteColor:appColor
                          ),
                          child: Center(
                            child: Text('B',style: GoogleFonts.plusJakartaSans(
                                color: address==''?appColor:whiteColor
                            ),),
                          ),
                        ),
                        10.width,
                        Flexible(
                          child: Text(
                            address,maxLines: 2,
                            style: GoogleFonts.plusJakartaSans(
                                color: blackColor
                            ),),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 30,
            right: 30,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 50,
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: appColor,
                  foregroundColor: whiteColor,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12)
                    )
                  )
              ),
              onPressed:
              widget.pickUpAddress==''?
                  () async{
                await  MyRouteBase().myRouteFn(context, PickUpPoint());
              }:address==''?()async{
                await  MyRouteBase().myRouteFn(context, DropOffPoint(
                  pickUpPoint: widget.pickUpAddress,
                ));
              }:(){},
              child: Text(
                widget.pickUpAddress==''?
                'Order Now':'Continue',style: GoogleFonts.plusJakartaSans(),),
          ),
            ),)
        ],
      )
    );
  }
}