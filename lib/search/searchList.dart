import 'package:consultant/cubit/DiagnosisCubit.dart';
import 'dart:async';
import 'package:async/async.dart';
import 'package:consultant/search/diagnosisDetail.dart';
import 'package:consultant/entity/veriler.dart';
import 'package:consultant/widget/searchContainer.dart';
import 'package:consultant/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchList extends StatefulWidget {
  int id;
  bool trlang;
  String? species;
  String? diagnosisKeyword;
  String? signKeyword;
  List? signs;
  SearchList({required this.id,this.species,this.diagnosisKeyword,this.signKeyword,this.signs,required this.trlang});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {

  late CancelableOperation<void> _cancellableOperation;
  final _delayTime = Duration(milliseconds: 700);
  TextEditingController controller =TextEditingController();

  List searchList=[];
  
  @override
  void initState() {
    super.initState();
    searchList=[];
    widget.id == 1 ? context.read<DiagnosisCubit>().consSearch(widget.species!, widget.diagnosisKeyword!,widget.trlang) : context.read<DiagnosisCubit>().signSearch(widget.species!,widget.signs!,widget.trlang);
    _start();
  }
  
  void _start() {
  _cancellableOperation = CancelableOperation.fromFuture(
    Future.delayed(_delayTime),
  );
  }

  void _onItemChanged(String value) {
    _cancellableOperation.cancel();
    _start();
    _cancellableOperation.value.whenComplete(() {
      context.read<DiagnosisCubit>().searchDiagnosisKeyword(controller.text);
    });
  }

  bool close(){
    Navigator.pop(context);
    return true;
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
       return close();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          leadingWidth: 44,
          leading:IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10),
            onPressed: (){
              Navigator.pop(context);
            }, icon:Icon(Icons.arrow_back_ios,size: 20,color:Color(0xFF012340))),
          backgroundColor: Colors.transparent,
          elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("SEARCH RESULTS",style: Theme.of(context).textTheme.labelLarge),
                SizedBox(height: 20,),
                TextFieldWidget(
                  onChanged: _onItemChanged,
                  controller: controller, 
                  hinttext: "Search...", 
                  icon:SvgPicture.asset('assets/images/search.svg')),
                  SizedBox(height: 20,),
                 Expanded(
                  child:BlocBuilder<DiagnosisCubit,List<Cons>>(
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DiagnosisDetail(cons: cons,trlang: widget.trlang,))); 
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
                  )),
              ]
            ),
          ),
      ),
    );
  }
}