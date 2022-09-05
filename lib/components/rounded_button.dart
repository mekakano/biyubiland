import 'package:flutter/material.dart';
import 'package:biyubi/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final bool isLoading;
  const RoundedButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.color,
      required this.isLoading,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                primary: color),
            onPressed: press,
            child: isLoading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: TextStyle(color: textColor),
                  )),
      ),
    );
  }
}
