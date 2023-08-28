import 'package:flutter/material.dart';
import 'package:yalla_gai/utils/contstants.dart';
import 'package:yalla_gai/view/extra.dart';
import 'package:yalla_gai/view/pick_up_map.dart';
import '../utils/routes.dart';

class SelectType extends StatelessWidget {
  const SelectType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(40),
        child:  AppBar(
          centerTitle: true,
          backgroundColor: whiteColor,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: 10.borderRadius,
                border: Border.all(color: blackColor,width: 0.8)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: IconButton(
                  onPressed: (){},
                  icon:  Icon(Icons.arrow_back_ios,color: blackColor,),
                ),
              ),
            )
          ),
          title: Image.asset('assets/logo.png',color: blackColor,height: 40,),
          actions: [

          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            36.height,
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/boy.png'),
                  VerticalDivider(
                    color: Colors.grey, // Divider color
                    thickness: 1, // Divider thickness
                  ),
                  Image.asset('assets/boyWithCar.png')
                ],
              ),
            ),
            24.height,
            Text('Are you Passenger or a Driver?',style: 18.black500Text,),
            24.height,
            Text('You can change the mode later',style: 14.blackText,),
            const Padding(
              padding:  EdgeInsets.all(40.0),
              child: Divider(
                thickness: 1,
              ),

            ),
            24.height,
            SizedBox(
              width: MediaQuery.sizeOf(context).width/2,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: appColor,
                      elevation: 0,
                      shape: 14.roundedRectangleBorder
                  ),
                  onPressed: (){
                    // MyRouteBase().myRouteFn(context, MyMapScreen(
                    //   pickUpAddress: '',
                    //   dropOffAddress: '',
                    // ));
                    MyRouteBase().myRouteFn(context, abc());
                  },
                  child: Text('Passenger',style: 18.whiteText,)),
            ),
            24.height,
            SizedBox(
              width: MediaQuery.sizeOf(context).width/2,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: appColor,
                      elevation: 0,
                      shape: 14.roundedRectangleBorder
                  ),
                  onPressed: (){

                  },
                  child: Text('Driver',style: 18.whiteText,)),
            ),
          ],
        ),
      ),
    );
  }
}
