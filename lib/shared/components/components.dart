import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nit_quiz/shared/components/styles/colors.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false);

Widget defaultFormField({
  @required TextEditingController? controller,
  @required TextInputType? type,
  double width = double.infinity,
  bool obscureText = false,
  @required Function? validate,
  @required String? label,
  @required IconData? prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: obscureText,
        enabled: isClickable,
        validator: (value) {
          return validate!(value);
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: MyColors.black,
          ),
          prefixIcon: Icon(
            prefix,
            color: MyColors.defaultColor,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed as void Function(),
                  icon: Icon(
                    suffix,
                    color: MyColors.defaultColor,
                  ),
                )
              : null,
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: MyColors.black,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: MyColors.facebookButtonColor,
          )),
        ),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  double height = 50.0,
  bool isUpperCase = true,
  double radius = 26.0,
  Color? color,
  Color? textColor=  Colors.white,
  @required Function? onPressed,
  @required String? text,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed as void Function(),
        child: Text(
          isUpperCase ? text!.toUpperCase() : text!,
          style: TextStyle(
            color:textColor,
          ),
        ),
      ),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: color,
      ),
    );

Widget defaultTextButton({
  @required Function? onPressed,
  @required String? text,
}) =>
    TextButton(
      onPressed: onPressed as void Function(),
      child: Text(
        text!.toUpperCase(),
        style: TextStyle(color: MyColors.defaultColor),
      ),
    );

Widget defaultIconButton({
  double width = double.infinity,
  double height = 50.0,
  bool isUpperCase = true,
  double radius = 26.0,
  Color? color,
  required Function? onPressed,
  required String? icon,
}) =>
    Container(
      width: width,
      height: height,
      child: IconButton(
        onPressed: onPressed as void Function(),
        icon: Image.asset(
          icon!,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: color,
      ),
    );



void showToast({
  @required String? text,
  @required ToastStates? state,
}) =>
    Fluttertoast.showToast(
      msg: text!,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state!),
      textColor: Colors.white,
      fontSize: 16.0,
    );
enum ToastStates { SUCCESS, ERROR, WARNING }

 Color? chooseToastColor(ToastStates state) {
  Color? color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return null;
}






