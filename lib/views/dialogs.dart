import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showRemindeDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      headerAnimationLoop: false,
      showCloseIcon: false,
      animType: AnimType.topSlide,
      title: 'Reminder',
      desc: 'Do you want to remind Name?',
       btnOkOnPress: () {
        print('Reminder');
      },
      btnCancelOnPress: () {},
      btnOkColor: Colors.blue,
      dismissOnBackKeyPress: true,

    )..show();
  }