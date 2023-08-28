import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yalla_gai/utils/contstants.dart';
import 'package:flutter_svg/flutter_svg.dart';


class GenderSelector extends StatefulWidget {
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  List<Gender> genders = [];

  @override
  void initState() {
    super.initState();
    genders.add( Gender("Male", 'assets/male.svg', true));
    genders.add( Gender("Female", 'assets/female.svg', false));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.only(left: 40,right: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          childAspectRatio: 2,
        ),
        shrinkWrap: true,
        primary: false,
        itemCount: genders.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: appColor,
            onTap: () {
              setState(() {
                genders.forEach((gender) => gender.isSelected = false);
                genders[index].isSelected = true;
              });
            },
            child: CustomRadio(genders[index]),
          );
        });
  }
}

class CustomRadio extends StatelessWidget {
  final Gender _gender;

  CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
              borderRadius: 6.borderRadius,
              border: Border.all(
                color: _gender.isSelected ? appColor : blackColor,

              )
          ),
          child:   Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              _gender.icon,
              color: _gender.isSelected ? appColor : blackColor,
              height: 20,
            ),
          ),

        ),
        Text(
          _gender.name,
          style: GoogleFonts.plusJakartaSans(
            color:  _gender.isSelected ? appColor : blackColor,),
        ),

      ],
    );
  }
}




class Gender {
  String name;
  String icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}