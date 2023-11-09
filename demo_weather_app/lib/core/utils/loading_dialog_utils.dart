import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingDialogUtils {
  /// show loading and return the dialog
  static Future<void> showLoading({String message = 'Please wait...'}) async {
    await EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      status: message,
    );
  }

  static Future<void> hideLoading() async {
    try {
      if (EasyLoading.isShow) {
        await EasyLoading.dismiss();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
