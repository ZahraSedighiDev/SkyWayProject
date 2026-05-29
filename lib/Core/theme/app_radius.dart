import 'package:flutter/material.dart';

class AppRadius {
  // --- مقادیر برای Radius ---

  // شعاع‌های کوچک (مثلاً برای گوشه‌های داخلی یا جزئیات کوچک)
  static const Radius small = Radius.circular(4.0);
  static const Radius xsmall = Radius.circular(2.0);

  // شعاع‌های متوسط (پرکاربرد)
  static const Radius medium = Radius.circular(8.0);
  static const Radius mediumLarge = Radius.circular(12.0);

  // شعاع‌های بزرگ (برای گرد کردن کامل یا گوشه‌های بزرگ)
  static const Radius large = Radius.circular(16.0);
  static const Radius extraLarge = Radius.circular(24.0);

  // شعاع بیضوی (اگر نیاز به مقادیر متفاوت برای محورها باشد)
  static const Radius ellipticalSmall = Radius.elliptical(6.0, 10.0);
  static const Radius ellipticalMedium = Radius.elliptical(12.0, 18.0);

  // برای CircleAvatar یا مواردی که نیاز به دایره کامل داریم
  // این مقادیر باید با اندازه ویجت هماهنگ باشند.
  // اینجا فقط چند مثال آورده شده است.
  static const double avatarSizeSmall = 20.0; // برای CircleAvatar با radius = 20.0
  static const double avatarSizeMedium = 30.0; // برای CircleAvatar با radius = 30.0
  static const double avatarSizeLarge = 50.0; // برای CircleAvatar با radius = 50.0

  // --- برای BorderRadius (از قبل داشتیم) ---
  static const BorderRadiusGeometry smallBorderRadius = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadiusGeometry mediumBorderRadius = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadiusGeometry largeBorderRadius = BorderRadius.all(Radius.circular(16.0));
  static BorderRadiusGeometry circularBorderRadius = BorderRadius.circular(100.0);
// ... (بقیه BorderRadius ها که قبلا تعریف شد)
}
