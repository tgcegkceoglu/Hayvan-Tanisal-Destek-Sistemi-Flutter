import 'package:consultant/entity/veriler.dart';
import 'package:consultant/search/searchList.dart';
import 'package:consultant/widget/searchContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiagnosisDetail extends StatefulWidget {
  bool trlang;
  Cons cons;
  DiagnosisDetail({required this.cons, required this.trlang});

  @override
  State<DiagnosisDetail> createState() => _DiagnosisDetailState();
}

class _DiagnosisDetailState extends State<DiagnosisDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF012340),
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ListView(
          children: [
            Text(widget.cons.header,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Color(0xFF012340))),
            SizedBox(
              height: 25,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SvgPicture.asset('assets/images/species.svg',
                    width: width < height ? width / 17 : height / 17,
                    height: width < height ? width / 17 : height / 17,
                    fit: BoxFit.contain),
                SizedBox(
                  width: 5,
                ),
                Text(widget.trlang == true ? "TÜRLER" : "SPECIES",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Color(0xFF012340), fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            ContainerWidget(text: widget.cons.species),
            SizedBox(
              height: 5,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SvgPicture.asset('assets/images/desc.svg',
                    width: width < height ? width / 17 : height / 17,
                    height: width < height ? width / 17 : height / 17,
                    fit: BoxFit.contain),
                SizedBox(
                  width: 5,
                ),
                Text(widget.trlang == true ? "AÇIKLAMA" : "DESCRIPTION",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Color(0xFF012340), fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            ContainerWidget(text: widget.cons.description),
            SizedBox(
              height: 5,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SvgPicture.asset('assets/images/signs.svg',
                    width: width < height ? width / 17 : height / 17,
                    height: width < height ? width / 17 : height / 17,
                    fit: BoxFit.contain),
                SizedBox(
                  width: 5,
                ),
                Text(widget.trlang == true ? "BELİRTİLER" : "SIGNS",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Color(0xFF012340), fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            ContainerWidget(text: widget.cons.signs),
          ],
        ),
      ),
    );
  }
}
