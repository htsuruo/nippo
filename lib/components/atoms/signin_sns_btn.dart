import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class SignInSnsBtn extends StatelessWidget {
  const SignInSnsBtn({@required this.logoImg, this.label, this.callback});

  final Image logoImg;
  final String label;
  final Function() callback;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Colors.white,
      borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      onPressed: callback,
      highlightColor: Colors.white,
      child: Container(
        width: 220,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logoImg,
            const SizedBox(
              width: 16,
            ),
            Text(
              label,
              style: GoogleFonts.roboto(
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
