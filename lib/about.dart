
import 'package:flutter/material.dart';
import 'package:consultant/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class AboutMe extends StatefulWidget {
  bool trlang;
  AboutMe({super.key,required this.trlang});

  @override
  State<AboutMe> createState() => _AboutMeState();
}
class _AboutMeState extends State<AboutMe> {
  final UrlLauncherPlatform launcher = UrlLauncherPlatform.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      toolbarHeight: SizedConfig.size30,
      leading:IconButton(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back_ios,size: SizedConfig.size17,color: Color(0xFFfefeff))),
      backgroundColor: Colors.transparent,
      elevation: 0,
      ),
      backgroundColor: Color(0xFF012340),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Text("TUĞÇE GÖKÇEOĞLU",style: TextStyle(fontWeight: FontWeight.bold, fontSize:TextConfig.fontSize30,color: Color(0xFFfefeff),shadows: [
                Shadow(
                  blurRadius:15,
                  color: Color.fromARGB(255,255,255,1000),
                  offset: Offset(3, 3), 
                ),],),textAlign: TextAlign.center,),  
            SizedBox(height: 16,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(widget.trlang == true ? "Kendimi bilgisayar alanında geliştirmek amacıyla üniversite eğitimimi Bilgisayar Mühendisliği dalında tercih ettim. Gelişen teknoloji dünyasının bir parçası olup edindiğim mühendislik bilgileri ile teknolojiyi bir adım daha üste taşımayı amaçlayan bilgisayar mühendisi adayıyım." :"I preferred my university education in the field of Computer Engineering in order to improve myself in the computer field. I am a computer engineer candidate who aims to be a part of the developing technology world and to take technology one step further with the engineering knowledge I have acquired.",
              style: TextStyle(letterSpacing: 1.5,height: 1.5,color: Color(0xFFfefeff),fontSize: TextConfig.fontSize17),textAlign: TextAlign.center,)),
            SizedBox(height: 16,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(widget.trlang == true ? "Aşağıdaki Sosyal Medya İconlarına Tıklayarak Bana Ulaşabilirsiniz." : "You can reach me by clicking on the Social Media Icons below.",
              style: TextStyle(letterSpacing: 1.5,height: 1.5,color: Color(0xFFfefeff),fontSize: TextConfig.fontSize18),textAlign: TextAlign.center,)),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                      widget.trlang == true ? _sendMailTr() : _sendMailEng();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    height: SizedConfig.size25,
                    width: SizedConfig.size25,
                    child: SvgPicture.asset('assets/images/mail.svg',),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _launchInBrowser("https://www.linkedin.com/in/tgcegkceoglu/");
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    height: SizedConfig.size20,
                    width: SizedConfig.size20,
                    child: SvgPicture.asset('assets/images/linkedin.svg',),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _launchInBrowser("https://github.com/tgcegkceoglu");
                  },
                  child: Container(
                    height: SizedConfig.size20,
                    width: SizedConfig.size20,
                    child: SvgPicture.asset('assets/images/github.svg'),
                  ),
                ),
              ],
            ),
          
          ],
        ),
      ),
    );
  }

  _sendMailTr() async {
    const mailTo ="tgcegkceoglu4@gmail.com"; 
    const subjectText = "Tanısal Destek Sistemi";
    const uri = 'mailto:$mailTo?subject=$subjectText';
    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(Uri.parse(uri));
    }
  }
  _sendMailEng() async {
    const mailTo ="tgcegkceoglu4@gmail.com"; 
    const subjectText = "Diagnostic Support System";
    const uri = 'mailto:$mailTo?subject=$subjectText';
    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(Uri.parse(uri));
    }
  }
  Future<void> _launchInBrowser(String url) async {
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
  }

}