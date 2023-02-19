import 'package:consultant/cubit/DiagnosisCubit.dart';
import 'dart:async';
import 'package:async/async.dart';
import 'package:consultant/diagnosisDetail.dart';
import 'package:consultant/entity/veriler.dart';
import 'package:consultant/widget/textfield/container.dart';
import 'package:consultant/widget/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDiagnosisList extends StatefulWidget {
  String species;
  String diagnosisKeyword;
  SearchDiagnosisList({required this.species, required this.diagnosisKeyword});

  @override
  State<SearchDiagnosisList> createState() => _SearchDiagnosisListState();
}

class _SearchDiagnosisListState extends State<SearchDiagnosisList> {

  late CancelableOperation<void> cancellableOperation;
  final _delayTime = Duration(milliseconds: 700);
  TextEditingController controller =TextEditingController();

  List searchList=[];
  bool searchZeroLength=false;
  
  @override
  void initState() {
    super.initState();
    searchList=[];
    context.read<DiagnosisCubit>().consSearch(widget.species, widget.diagnosisKeyword);
    _start();
  }
  
  void _start() {
  cancellableOperation = CancelableOperation.fromFuture(
    Future.delayed(_delayTime),
  );
  }

  void _onItemChanged(String value) {
    cancellableOperation.cancel();
    _start();
    cancellableOperation.value.whenComplete(() {
      if(controller.text.length==0){
        setState(() {
           searchZeroLength=true;
        });
      }
      else{
        setState(() {
          searchZeroLength=false;
          context.read<DiagnosisCubit>().searchDiagnosisKeyword(controller.text);
        });
      }
    });
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 248, 238),
      appBar: AppBar(
        leadingWidth: 44,
        leading:IconButton(
          padding: EdgeInsets.symmetric(horizontal: 10),
          onPressed: (){
            Navigator.pushNamed(context, "/searchDiagnosis");
          }, icon:Icon(Icons.arrow_back_ios,size: 20)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ARAMA SONUÇLARI",style: Theme.of(context).textTheme.labelLarge),
              SizedBox(height: 20,),
              TextFieldWidget(
                onChanged: _onItemChanged,
                controller: controller, 
                hinttext: "Arama Yap", icon:SvgPicture.asset('assets/images/search.svg')),
                SizedBox(height: 20,),
               Expanded(
                child: searchZeroLength == false ? BlocBuilder<DiagnosisCubit,List<Cons>>(
                builder: ((context, consListesi) {
                  if(consListesi.isNotEmpty){
                    if(searchList.length==0){
                      searchList=consListesi;
                    }
                    return ListView.builder(
                      itemCount: consListesi.length,
                      itemBuilder: ((context, index) {
                        var cons = consListesi[index];
                        return  GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DiagnosisDetail(cons: cons,dropDownValue:widget.species, diagnosisKeyword: widget.diagnosisKeyword,))); 
                          },
                          child: Column(
                            children: [
                              ContainerWidget(
                                speciesText: cons.species,
                                headerText: cons.header,
                                descText: cons.description,
                                signsText: cons.signs,
                              )
                            ],
                          ),
                        );
                      }),
                    );
                  }
                  else{
                    return Center(
                      child: Text("Herhangi Bir Sonuç Bulunamadı!"),
                    );
                  }
                  }),
                )
                :
                ListView.builder(
                  itemCount: searchList.length,
                  itemBuilder: ((context, index) {
                    var cons = searchList[index];
                    return  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DiagnosisDetail(cons: cons,dropDownValue:widget.species, diagnosisKeyword: widget.diagnosisKeyword,))); 
                      },
                      child: Column(
                        children: [
                          ContainerWidget(
                            speciesText: cons.species,
                            headerText: cons.header,
                            descText: cons.description,
                            signsText: cons.signs,
                          )
                        ],
                      ),
                    );
                  }),
                )),
            ]
          ),
        ),
    );
  }
}