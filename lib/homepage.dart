import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF012340),
      body: Padding(
        padding: const EdgeInsets.only(right: 10,left: 10,top: 80),
        child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  child: Text("Hayvan Tanısal Destek Sistemi",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24, 
                    color:Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationColor:Colors.white,
                    shadows: [
                      Shadow(
                          color:Colors.white,
                          offset: Offset(0, -5))
                    ],
                    
                    ),)),
                SizedBox(height: 24,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18,vertical: 28),
                  decoration: BoxDecoration(
                    gradient:LinearGradient(
                    colors: [ Color(0xFF012340),Color(0xFF023059)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,),
                    boxShadow: [
                         BoxShadow(
                          color: Color.fromARGB(255, 3, 56, 102),
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
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
                      child: SvgPicture.asset('assets/images/diagnosis.svg',height: 36, width:36,fit: BoxFit.cover)),
                      SizedBox(height: 25,),
                      Text("Tanıya Göre Arama",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 8,),
                      Text("Hayvanın türü ve tanı anahtar kelimesi ile arama yapmak için aşağıdaki butona tıklayınız.",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
                      SizedBox(height: 25,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.white),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text("Arama Yap",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)),
                      ),
                    ],
                  ) ,
                ),
                SizedBox(height: 18,),
                _container(context, "signslist.svg", "İşaretlere / Semptomlara Göre Arama", "Hayvanın türü, tanı ve semptomlara göre aramak için aşağıdaki butona tıklayınız."),
                Spacer(),
                Image.asset("assets/images/animal2.png")
          ],
        ),
      ),
    );
  }
}

_container(BuildContext context,String iconName, String header,String description){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18,vertical: 28),
    decoration: BoxDecoration(
      gradient:LinearGradient(
      colors: [Color(0xFF023059),Color(0xFF012340)],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,),
      boxShadow: [
            BoxShadow(
            color: Color.fromARGB(255, 3, 56, 102),
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
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
        child: SvgPicture.asset('assets/images/$iconName',height: 36, width:36,fit: BoxFit.cover)),
        SizedBox(height: 25,),
        Text(header,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 8,),
        Text(description,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
        SizedBox(height: 25,),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            
          ),
          child: Center(child: Text("Arama Yap",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)),
        ),
      ],
    ) ,
  );
}
