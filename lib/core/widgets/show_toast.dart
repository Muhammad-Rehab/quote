import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

showToastHere(String msg, BuildContext context)
{
  return showToast(
    msg,
    context: context,
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fade,
    position: const StyledToastPosition(align:Alignment.bottomCenter, offset: 100),
    animDuration: const Duration(milliseconds: 200),
    duration: const Duration(seconds: 2),
    curve: Curves.linear,
    reverseCurve: Curves.linear,
  );

}
