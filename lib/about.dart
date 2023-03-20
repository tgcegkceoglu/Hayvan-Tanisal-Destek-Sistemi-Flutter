import 'package:consultant/widget/social.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutMe extends StatefulWidget {
  bool trlang;
  AboutMe({super.key, required this.trlang});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Color(0xFFfefeff))),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF012340),
      body: Padding(
        padding: EdgeInsets.only(top: 60),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              "TUĞÇE GÖKÇEOĞLU",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFFfefeff),
                shadows: [
                  Shadow(
                    blurRadius: 15,
                    color: Color.fromARGB(255, 255, 255, 1000),
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  widget.trlang == true
                      ? "Kendimi bilgisayar alanında geliştirmek amacıyla üniversite eğitimimi Bilgisayar Mühendisliği dalında tercih ettim. Gelişen teknoloji dünyasının bir parçası olup edindiğim mühendislik bilgileri ile teknolojiyi bir adım daha üste taşımayı amaçlayan bilgisayar mühendisi adayıyım."
                      : "I preferred my university education in the field of Computer Engineering in order to improve myself in the computer field. I am a computer engineer candidate who aims to be a part of the developing technology world and to take technology one step further with the engineering knowledge I have acquired.",
                  style: TextStyle(
                      letterSpacing: 1.5,
                      height: 1.5,
                      color: Color(0xFFfefeff)),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: 16,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  widget.trlang == true
                      ? "Aşağıdaki Sosyal Medya Hesaplarımdan Bana Ulaşabilirsiniz."
                      : "You can reach me through my social media accounts below.",
                  style: TextStyle(
                      letterSpacing: 1.5,
                      height: 1.5,
                      color: Color(0xFFfefeff)),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: 25,
            ),
            SocialContainer(
                icon: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                text: "tgcegkceoglu4@gmail.com",
                link: "tgcegkceoglu4@gmail.com"),
            SizedBox(
              height: 16,
            ),
            SocialContainer(
                icon: SvgPicture.asset(
                  "assets/images/linkedin.svg",
                  width: width < height ? width / 17 : height / 17,
                  height: width < height ? width / 17 : height / 17,
                ),
                text: "in / tgcegkceoglu",
                link: "https://www.linkedin.com/in/tgcegkceoglu/"),
            SizedBox(
              height: 16,
            ),
            SocialContainer(
                icon: SvgPicture.asset(
                  "assets/images/github.svg",
                  width: width < height ? width / 16 : height / 16,
                  height: width < height ? width / 16 : height / 16,
                ),
                text: "github / tgcegkceoglu",
                link: "https://github.com/tgcegkceoglu"),
          ],
        ),
      ),
    );
  }
}
