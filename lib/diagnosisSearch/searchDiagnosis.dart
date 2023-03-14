import 'package:consultant/search/searchList.dart';
import 'package:consultant/widget/button.dart';
import 'package:consultant/widget/textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:consultant/constants.dart';


class SearchDiagnosis extends StatefulWidget {
  final bool trlang;
  SearchDiagnosis({required this.trlang});

  @override
  State<SearchDiagnosis> createState() => _SearchDiagnosisState();
}

final UrlLauncherPlatform launcher = UrlLauncherPlatform.instance;
TextEditingController diagnosisKeyword= TextEditingController();
late String dropdownValue;
late List<String> list;

class _SearchDiagnosisState extends State<SearchDiagnosis> {

  @override
  void initState() {
    super.initState();
    variableValues();
  }

  variableValues(){
    if(widget.trlang){
      list = ["Tüm","Kuş","Köpek","Kedi","Sığır","At","Keçi","Koyun","Domuz"];
      dropdownValue = list.first;
    }
    else{
      list =['All','Avian','Canine','Feline','Bovine','Equine','Caprine','Ovine','Porcine'];
      dropdownValue = list.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Image.asset('assets/images/animal.png'),
      backgroundColor: Color(0XFFF5F5F5),
      appBar: AppBar(
      toolbarHeight: SizedConfig.size30,
      leading:IconButton(
      constraints: BoxConstraints(),
      padding: EdgeInsets.only(left: 15),
      onPressed: (){
        Navigator.pop(context);
      }, 
      iconSize: SizedConfig.size17,
      icon:Icon(Icons.arrow_back_ios,size: SizedConfig.size17,color: Color(0xFFfefeff))),
      title:Text(widget.trlang == true ? "Tanısal Destek Sistemi" : "Diagnostic Support System",style:TextStyle(fontWeight: FontWeight.bold,fontSize:TextConfig.fontSize17)),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          child: GestureDetector(
            onTap:() async{
                String url="http://haytek.mehmetakif.edu.tr";
                if (!await launcher.launch(
                  url,
                  useSafariVC: false,
                  useWebView: false,
                  enableJavaScript: false,
                  enableDomStorage: false,
                  universalLinksOnly: false,
                  headers: <String, String>{},
                )) {
                  throw Exception('Could not launch $url');
                }
            },
            child: Container(child: Image.asset('assets/images/haytek.png',))),
        )
      ],
      backgroundColor:Color(0xFF012340),
      elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.trlang == true ? "TANIYA GÖRE ARAMA" : "SEARCH BY DIAGNOSIS",style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(height: 30,),
                  Text(widget.trlang == true ? "Tür" : "Species",style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(height: 8,),
                  Container(
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
                    dropdownMaxHeight: MediaQuery.of(context).size.height/3,
                    buttonPadding: EdgeInsets.only(right: 10),
                    isExpanded: true,
                    items: list.map((item) => DropdownMenuItem<String>(value: item,child: Text(item,style: TextStyle(fontSize: TextConfig.fontSize14,color: Colors.black,),overflow: TextOverflow.ellipsis,))).toList(),
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
                    itemHeight: 35,
                    buttonHeight: 45,
                    dropdownElevation: 0,
                    scrollbarThickness: 0,
                    scrollbarAlwaysShow: true,
                    ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text(widget.trlang == true ? " Tanı Anahtar Kelime" : "Diagnosis Keyword",style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(height: 8,),
                  TextFieldWidget(controller: diagnosisKeyword,),
                  SizedBox(height: 30,),
                  ButtonWidget(
                    trlang: widget.trlang,
                    onChanged:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchList(id: 1 ,species: dropdownValue, diagnosisKeyword: diagnosisKeyword.text,trlang: widget.trlang,))); 
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
