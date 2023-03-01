import 'package:async/async.dart';
import 'package:consultant/cubit/DiagnosisCubit.dart';
import 'package:consultant/cubit/systemCubit.dart';
import 'package:consultant/search/diagnosisDetail.dart';
import 'package:consultant/widget/searchContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SystemSearch extends StatefulWidget {
  String system;
  SystemSearch({super.key,required this.system});

  @override
  State<SystemSearch> createState() => _SystemSearchState();
}

const List<String> list = <String>['All','Acoustic','Cardiovascular','Digestive','Ophthalmology','General','Musculoskeletal','Nervous','Pain/Discomfort','Respiratory','Skin/Integumentary','Reproductive','Urinary'];
TextEditingController controller=TextEditingController();

class _SystemSearchState extends State<SystemSearch> {
  late CancelableOperation<void> cancellableOperation;
  final _delayTime = Duration(milliseconds: 700);
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.text="";
    context.read<SystemCubit>().systemJsonRead(list, widget.system);
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
      context.read<SystemCubit>().searchSignTextfield(controller.text);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF012340),
        leading: Icon(Icons.search),
        title: TextField(
          cursorColor: Color(0xFF023059),
          style: TextStyle(
            color: Colors.white,
          ),
          controller: controller,
          onChanged: _onItemChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Look for Signs/Symptoms...",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child:BlocBuilder<SystemCubit,List<String>>(
            builder: ((context,  systemListesi) {
              if(systemListesi.isNotEmpty){
                return ListView.builder(
                  itemCount: systemListesi.length,
                  itemBuilder: ((context, index) {
                    var system = systemListesi[index];
                    return  GestureDetector(
                      onTap: (){
                        Navigator.pop(context,system);
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
                        ),
                        child:Text(system),),
                    );
                  }),
                );
              }
              else{
                return Center(
                  child: Text("Herhangi Bir Sonuç Bulunamadı!"),
                );
              }
              }))
          )
        ],
      ),
    );
  }
}

