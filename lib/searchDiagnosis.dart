import 'package:consultant/searchDiagnosisList.dart';
import 'package:consultant/widget/textfield/textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchDiagnosis extends StatefulWidget {
  const SearchDiagnosis({super.key});

  @override
  State<SearchDiagnosis> createState() => _SearchDiagnosisState();
}
const List<String> list = <String>['All','Avian','Canine','Feline','Bovine','Equine','Caprine','Ovine','Porcine'];
TextEditingController diagnosisKeyword= TextEditingController();
class _SearchDiagnosisState extends State<SearchDiagnosis> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 248, 238),
      // appBar: AppBar(
      //   leadingWidth: 44,
      //   leading:IconButton(
      //     padding: EdgeInsets.symmetric(horizontal: 10),
      //     onPressed: (){}, icon:Icon(Icons.arrow_back_ios,size: 20,color:Color(0xFF21774A),)),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80,left: 10,right: 10),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("TANIYA GÖRE ARAMA",style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(height: 30,),
                  Text("Tür",style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(height: 8,),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F7E0),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFF21774A),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius:3,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonPadding: EdgeInsets.only(right: 10),
                    isExpanded: true,
                    items: list.map((item) => DropdownMenuItem<String>(value: item,child: Text(item,style: const TextStyle(fontSize: 14,color: Colors.black,),overflow: TextOverflow.ellipsis,))).toList(),
                    value: dropdownValue,
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value as String;
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_rounded,),
                    iconSize:25,
                    iconEnabledColor: Colors.black54,
                    iconDisabledColor: Colors.black54,
                    isDense: true,
                    buttonElevation: 0,
                    dropdownDecoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)
                    ),
                    buttonHeight: 45,
                    dropdownElevation: 0,
                    scrollbarThickness: 0,
                    scrollbarAlwaysShow: true,
                    ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Anahtar Kelime",style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(height: 8,),
                  TextFieldWidget(controller: diagnosisKeyword,),
                  SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchDiagnosisList(species: dropdownValue, diagnosisKeyword: diagnosisKeyword.text,))); 
                      },
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.symmetric(vertical:8),
                        width:MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(
                          color:  Color(0xFF21774A),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius:3,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ],
                      ),child: Center(child: Text("ARAMA YAP",style:Theme.of(context).textTheme.headlineLarge))),
                    ),
                  ),
                  Spacer(),
                  Image.asset("assets/images/animal1.png")
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}