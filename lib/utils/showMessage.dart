
import 'package:flutter/cupertino.dart';
import 'package:flutter_testt/utils/toast.dart';

showMessage(BuildContext context, String message,
    {int gravity = 0, Color color,int duration=3}) {
  Toast.show(message, context, gravity: Toast.BOTTOM, duration: duration);
}