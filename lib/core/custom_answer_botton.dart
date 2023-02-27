import 'package:flutter/material.dart';

class CustomAnswerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const CustomAnswerButton({Key? key,required this.onPressed,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  ElevatedButton(onPressed: onPressed,

        style: ButtonStyle(

            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),

              ),
            )
        ),
        child: Container(
          height: size.height * 0.08,
          alignment: Alignment.center,
          child: child,
        ));
  }
}
