import 'package:consultant/search/searchList.dart';
import 'package:consultant/systemSearch/systemSearch.dart';
import 'package:consultant/widget/button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchSignDiagnosis extends StatefulWidget {
  bool trlang;
  SearchSignDiagnosis({required this.trlang});

  @override
  State<SearchSignDiagnosis> createState() => _SearchSignDiagnosisState();
}

TextEditingController signKeyword = TextEditingController();

class _SearchSignDiagnosisState extends State<SearchSignDiagnosis> {
  late List<String> systemList;
  late List<String> signList;
  late String signValue;
  late String systemValue;
  List selectedSystemList = [];
  var result;

  @override
  void initState() {
    super.initState();
    variableValues();
  }

  variableValues() {
    if (widget.trlang) {
      systemList = [
        'Tüm',
        'Akustik',
        'Kardiyovasküler',
        'Sindirim',
        'Oftalmoloji',
        'Genel',
        'Kas-İskelet',
        'Sinir',
        'Ağrı/Rahatsızlık',
        'Solunum',
        'Deri/Dokular',
        'Üreme',
        'Üriner'
      ];
      signList = [
        "Tüm",
        "Kuş",
        "Köpek",
        "Kedi",
        "Sığır",
        "At",
        "Keçi",
        "Koyun",
        "Domuz"
      ];
      signValue = signList.first;
      systemValue = systemList.first;
    } else {
      systemList = [
        'All',
        'Acoustic',
        'Cardiovascular',
        'Digestive',
        'Ophthalmology',
        'General',
        'Musculoskeletal',
        'Nervous',
        'Pain/Discomfort',
        'Respiratory',
        'Skin/Integumentary',
        'Reproductive',
        'Urinary'
      ];
      signList = [
        'All',
        'Avian',
        'Canine',
        'Feline',
        'Bovine',
        'Equine',
        'Caprine',
        'Ovine',
        'Porcine'
      ];
      signValue = signList.first;
      systemValue = systemList.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Image.asset('assets/images/animal.png'),
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
            constraints: BoxConstraints(),
            padding: EdgeInsets.only(left: 15),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Color(0xFFfefeff))),
        title: Text(
            widget.trlang == true
                ? "Tanısal Destek Sistemi"
                : "Diagnostic Support System",
            style: Theme.of(context).textTheme.titleLarge),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: GestureDetector(
                onTap: () async {
                  String url = "https://haytek.mehmetakif.edu.tr";
                  await launchUrl(Uri.parse(url));
                },
                child: Image.asset(
                  'assets/images/haytek.png',
                )),
          )
        ],
        backgroundColor: Color(0xFF012340),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                  widget.trlang == true
                      ? "Belirtilere/Semptomlara Göre Arama"
                      : "SEARCH BY SIGNS / SYMPTOMS",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Color(0xFF012340))),
              SizedBox(
                height: 30,
              ),
              Text(widget.trlang == true ? "Türler" : "Species",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Color(0xFF012340),
                      )),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  border: Border.all(
                    width: 1,
                    color: Color(0xFF012340).withOpacity(.6),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonPadding: EdgeInsets.only(right: 10),
                    isExpanded: true,
                    items: signList
                        .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Color(0xFF012340)),
                              overflow: TextOverflow.ellipsis,
                            )))
                        .toList(),
                    value: signValue,
                    onChanged: (value) {
                      setState(() {
                        signValue = value as String;
                      });
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                    iconSize: 25,
                    iconEnabledColor: Colors.black54,
                    iconDisabledColor: Colors.black54,
                    isDense: true,
                    buttonElevation: 0,
                    dropdownDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    buttonHeight: 45,
                    dropdownElevation: 0,
                    scrollbarThickness: 0,
                    scrollbarAlwaysShow: true,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(widget.trlang == true ? "Sistem" : "System",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Color(0xFF012340),
                      )),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  border: Border.all(
                    width: 1,
                    color: Color(0xFF012340).withOpacity(.6),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonPadding: EdgeInsets.only(right: 10),
                    isExpanded: true,
                    items: systemList
                        .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Color(0xFF012340)),
                              overflow: TextOverflow.ellipsis,
                            )))
                        .toList(),
                    value: systemValue,
                    onChanged: (value) {
                      setState(() {
                        systemValue = value as String;
                      });
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                    iconSize: 25,
                    iconEnabledColor: Colors.black54,
                    iconDisabledColor: Colors.black54,
                    isDense: true,
                    buttonElevation: 0,
                    dropdownDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    buttonHeight: 45,
                    dropdownElevation: 0,
                    scrollbarThickness: 0,
                    scrollbarAlwaysShow: true,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      widget.trlang == true
                          ? "Belirti / Semptom Anahtar Kelime"
                          : "Sign / Symptom Keyword",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Color(0xFF012340),
                          )),
                  GestureDetector(
                    onTap: () async {
                      result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SystemSearch(
                                  system: systemValue,
                                  trlang: widget.trlang,
                                )),
                      );
                      setState(() {
                        if (result != null &&
                            !selectedSystemList.contains(result))
                          selectedSystemList.add(result);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFF012340),
                      ),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: selectedSystemList.length < 3
                    ? (selectedSystemList.length * 70)
                    : 150,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: selectedSystemList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: Color(0xFF012340))),
                      child: ListTile(
                        title: Text(selectedSystemList[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Color(0xFF012340))),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Color(0xFF012340)),
                          onPressed: () {
                            setState(() {
                              selectedSystemList
                                  .remove(selectedSystemList[index]);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ButtonWidget(
                trlang: widget.trlang,
                onChanged: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchList(
                                id: 2,
                                species: signValue,
                                signs: selectedSystemList,
                                trlang: widget.trlang,
                              )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
