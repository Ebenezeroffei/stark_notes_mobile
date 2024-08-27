import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Toast {
  static show({
    required String message,
    required ToastificationType type,
  }) {
    toastification.show(
      title: Text(message),
      type: type,
      style: ToastificationStyle.flatColored,
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(width: 0),
      showIcon: false,
      showProgressBar: false,
    );
  }

  static success(
    String message,
  ) =>
      show(
        message: message,
        type: ToastificationType.success,
      );

  static info(
    String message,
  ) =>
      show(
        message: message,
        type: ToastificationType.info,
      );

  static warning(
    String message,
  ) =>
      show(
        message: message,
        type: ToastificationType.warning,
      );

  static error(
    String message,
  ) =>
      show(
        message: message,
        type: ToastificationType.error,
      );
}
