
import 'package:consultant/cubit/systemCubit.dart';
import 'package:consultant/search/searchList.dart';
import 'package:consultant/systemSearch/systemSearch.dart';
import 'package:consultant/widget/button.dart';
import 'package:consultant/widget/textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SearchSignSearch extends StatefulWidget {
 const SearchSignSearch({super.key});

  @override
  State<SearchSignSearch> createState() => _SearchSignSearchState();
}

const List<String> systemList = <String>['All','Acoustic','Cardiovascular','Digestive','Ophthalmology','General','Musculoskeletal','Nervous','Pain/Discomfort','Respiratory','Skin/Integumentary','Reproductive','Urinary'];
const List<String> signList = <String>['All','Avian','Canine','Feline','Bovine','Equine','Caprine','Ovine','Porcine'];
TextEditingController signKeyword= TextEditingController();
class _SearchSignSearchState extends State<SearchSignSearch> {
  List selectedSystemList=[];
  var result;
  String signValue = signList.first;
  String systemValue = systemList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Image.asset('assets/images/animal2.png'),
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
          leadingWidth: 44,
          leading:IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10),
            onPressed: (){
              Navigator.pop(context);
            }, icon:Icon(Icons.arrow_back_ios,size: 20,color: Color(0xFF012340),)),
          backgroundColor: Colors.transparent,
          elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80,left: 10,right: 10),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("SEARCH BY SIGNS / SYMPTOMS",style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(height: 30,),
                  Text("Species",style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(height: 8,),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      border: Border.all(
                        width: 1,
                        color:Color(0xFF012340).withOpacity(.6),
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
                    items: signList.map((item) => DropdownMenuItem<String>(value: item,child: Text(item,style: const TextStyle(fontSize: 14,color: Colors.black,),overflow: TextOverflow.ellipsis,))).toList(),
                    value: signValue,
                    onChanged: (value) {
                      setState(() {
                        signValue = value as String;
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
                  Text("System",style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(height: 8,),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      border: Border.all(
                        width: 1,
                        color:Color(0xFF012340).withOpacity(.6),
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
                    items: systemList.map((item) => DropdownMenuItem<String>(value: item,child: Text(item,style: const TextStyle(fontSize: 14,color: Colors.black,),overflow: TextOverflow.ellipsis,))).toList(),
                    value: systemValue,
                    onChanged: (value) {
                      setState(() {
                        systemValue = value as String;
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sign / Symptom Keyword",style: Theme.of(context).textTheme.labelLarge),
                      GestureDetector(
                        onTap: () async{
                          result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SystemSearch(system: systemValue)),
                          );
                          setState(() {
                            if(result !=null && !selectedSystemList.contains(result))
                            selectedSystemList.add(result);
                          });
                        },
                        child: Container(decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFF012340),
                        ),child: Icon(Icons.add,color: Colors.white,),),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: selectedSystemList.length <3 ? (selectedSystemList.length*70):150,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: selectedSystemList.length,
                      itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1, color: Color(0xFF012340))
                        ),
                        child: ListTile(
                          title: Text(selectedSystemList[index],style: TextStyle(color: Color(0xFF012340))),
                          trailing: IconButton(icon: Icon(Icons.delete,color: Color(0xFF012340),),onPressed: (){
                            setState(() {
                                selectedSystemList.remove(selectedSystemList[index]);
                            });
                          
                          },),
                        ),
                      );
                    },),
                  ),
                  SizedBox(height: 8,),
                  ButtonWidget(onChanged:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchList(id: 2,species: signValue, signs:selectedSystemList,signKeyword: signKeyword.text,))); 
                  },),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}