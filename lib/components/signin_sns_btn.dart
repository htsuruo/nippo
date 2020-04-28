import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInSnsBtn extends StatelessWidget {
  SignInSnsBtn({@required this.logoImg, this.label, this.callback});

  final Image logoImg;
  final String label;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      color: Colors.white,
      borderSide: BorderSide(color: Color(0xFFDDDDDD)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      onPressed: this.callback,
      highlightColor: Colors.white,
      child: Container(
        width: 220,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            this.logoImg,
            SizedBox(
              width: 16,
            ),
            Text(
              this.label,
              style: GoogleFonts.roboto(
                  textStyle:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
