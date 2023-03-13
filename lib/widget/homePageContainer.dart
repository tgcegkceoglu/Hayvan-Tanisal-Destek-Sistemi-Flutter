import 'package:flutter/material.dart';
import 'package:consultant/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:consultant/constants.dart';


class HomePageContainer extends StatelessWidget {
  String iconName;
  String button;
  String header;
  String description;
  var page;
  HomePageContainer({super.key,required this.iconName, required this.header, required this.description, required this.page,required this.button});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18,vertical: 28),
      decoration: BoxDecoration(
        color:Color(0xFF023059).withOpacity(.91),
        borderRadius: BorderRadius.circular(10)
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:Color(0xFF012340) ,
            borderRadius: BorderRadius.circular(34),
            border: Border.all(width: 1,color: Colors.white)
          ),
          child: SvgPicture.asset('assets/images/$iconName',height: HeightWidthConfig.height36, width:HeightWidthConfig.width36,fit: BoxFit.cover)),
          SizedBox(height: 25,),
          Text(header,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:TextConfig.fontSize18)),
          SizedBox(height: 8,),
          Text(description,style: TextStyle(color: Colors.white,fontSize: TextConfig.fontSize12,fontWeight: FontWeight.w500),),
          SizedBox(height: 25,),
          GestureDetector(
            onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text(button,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize:TextConfig.fontSize14),)),
            ),
          ),
        ],
      ) ,
    );
  }
}