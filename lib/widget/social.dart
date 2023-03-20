import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SocialContainer extends StatelessWidget {
  var icon;
  var text;
  var link;
  SocialContainer(
      {super.key, required this.icon, required this.text, required this.link});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: icon),
          Expanded(
            flex: 3,
            child: Text(
              text,
              style: TextStyle(
                  letterSpacing: 1.5, height: 1.5, color: Color(0xFFfefeff)),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: link));
                },
                icon: Icon(
                  Icons.copy,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
