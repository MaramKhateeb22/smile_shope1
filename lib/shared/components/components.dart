import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

Widget defaultMybutton() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          // Do something when the button is pressed
        },
        color: Colors.blue,
        textColor: Colors.white,
        padding: const EdgeInsets.all(7.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
          side: const BorderSide(color: Color.fromARGB(255, 245, 85, 85)),
        ),
        child: const Text(
          'التالي',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );

void NavigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void NavigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
void message(BuildContext context, String msg, {int longTime = 5}) {
  ToastContext toastContext = ToastContext();
  toastContext.init(context);
  Toast.show(msg, duration: longTime);
}
