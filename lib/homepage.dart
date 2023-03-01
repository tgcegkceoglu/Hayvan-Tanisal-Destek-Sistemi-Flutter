import 'package:consultant/widget/homePageContainer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF012340),
      body: Padding(
        padding: const EdgeInsets.only(right: 10,left: 10),
        child: 
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: Text("Diagnostic Support System",
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
                    HomePageContainer(iconName:"diagnosis.svg", header:"Search By Diagnosis",description:"Click the button below to search by animal species and diagnosis keyword.",pushNamed:"/searchDiagnosis"),
                    SizedBox(height: 18,),
                    HomePageContainer(iconName:"signslist.svg",header:"Search By Signs/Symptoms", description:"Click the button below to search by type and sign.",pushNamed:"/searchSign"),
                        ],
                      ),
              ),
            ),
      ),
    );
  }
}
