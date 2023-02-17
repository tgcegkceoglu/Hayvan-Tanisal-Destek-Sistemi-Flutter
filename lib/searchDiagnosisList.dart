import 'package:consultant/cubit/DiagnosisCubit.dart';
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

  TextEditingController controller =TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<DiagnosisCubit>().consSearch(widget.species, widget.diagnosisKeyword);
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
          }, icon:Icon(Icons.arrow_back_ios,size: 20,color:Color(0xFF21774A),)),
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
                onkey: true,
                onChanged: (value){
                  context.read<DiagnosisCubit>().searchDiagnosisKeyword(controller.text);
                },
                controller: controller, 
                hinttext: "Arama Yap", icon:SvgPicture.asset('assets/images/search.svg')),
              SizedBox(height: 20,),
               Expanded(
                child: BlocBuilder<DiagnosisCubit,List<Cons>>(
                builder: ((context, consListesi) {
                  if(consListesi.isNotEmpty){
                    return ListView.builder(
                      itemCount: consListesi.length,
                      itemBuilder: ((context, index) {
                        var cons = consListesi[index];
                        return GestureDetector(
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
                    return Container();
                  }
                  }),
                ),
              )
            ],
          ),
        ),
    );
  }
}