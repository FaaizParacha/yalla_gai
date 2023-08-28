import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';



import '../utils/contstants.dart';


class DropOffPoint extends StatefulWidget {
  final String? pickUpPoint;
  const DropOffPoint({super.key,this.pickUpPoint});

  @override
  State<DropOffPoint> createState() => _DropOffPointState();
}

class _DropOffPointState extends State<DropOffPoint> {
  final searchController = TextEditingController();

  

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
          title: Text('Select Drop off Point',style: GoogleFonts.plusJakartaSans(
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
                hintText: 'select your Drop-off Point',
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
            onTap: (){
              Navigator.pop(context);
            },
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
