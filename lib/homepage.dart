import 'package:consultant/about.dart';
import 'package:consultant/diagnosisSearch/searchDiagnosis.dart';
import 'package:consultant/systemSearch/searchSignDiagnosis.dart';
import 'package:consultant/widget/homePageContainer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool trlang = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TextButton(
        child: Text(trlang == true ? "Hakkımda" : "About Me",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AboutMe(
                        trlang: trlang,
                      )));
        },
      ),
      backgroundColor: Color(0xFF012340),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/haytek.png"),
                  fit: BoxFit.contain,
                  opacity: .6)),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        children: [
                          Text(
                            trlang == true
                                ? "Tanısal Destek Sistemi"
                                : "Diagnostic Support System",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              decorationColor: Colors.white,
                              shadows: [
                                Shadow(
                                    color: Colors.white, offset: Offset(0, -5))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (() {
                            setState(() {
                              if (!trlang) {
                                trlang = true;
                              }
                            });
                          }),
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                                color: trlang == true
                                    ? Colors.white
                                    : Color.fromARGB(255, 3, 56, 102),
                              ),
                              child: Text("TR",
                                  style: TextStyle(color: Color(0xFF012340)))),
                        ),
                        GestureDetector(
                          onTap: (() {
                            setState(() {
                              if (trlang) {
                                trlang = false;
                              }
                            });
                          }),
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                color: trlang == false
                                    ? Colors.white
                                    : Color.fromARGB(255, 3, 56, 102),
                              ),
                              child: Text("EN",
                                  style: TextStyle(color: Color(0xFF012340)))),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    HomePageContainer(
                      button: trlang == true ? "Arama Yap" : "Search",
                      iconName: "diagnosis.svg",
                      header: trlang == true
                          ? "Tanıya Göre Arama"
                          : "Search By Diagnosis",
                      description: trlang == true
                          ? "Hayvan türüne ve teşhis anahtar kelimesine göre arama yapmak için aşağıdaki butona tıklayınız."
                          : "Click the button below to search by animal species and diagnosis keyword.",
                      page: SearchDiagnosis(trlang: trlang),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    HomePageContainer(
                      button: trlang == true ? "Arama Yap" : "Search",
                      iconName: "signslist.svg",
                      header: trlang == true
                          ? "Belirtilere/Semptomlara Göre Arama"
                          : "Search By Signs/Symptoms",
                      description: trlang == true
                          ? "Hayvan türüne ve belirtilere göre arama yapmak için aşağıdaki butona tıklayın."
                          : "Click the button below to search by type and sign.",
                      page: SearchSignDiagnosis(trlang: trlang),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
