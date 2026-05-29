

import 'package:flutter/material.dart';

class AppBorderRadius {
  // --- برای BorderRadius ---

  // بسیار کم (برای دکمه‌های کوچک یا گوشه‌های خیلی گرد)
  static const BorderRadiusGeometry small = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadiusGeometry smallTop = BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0));
  static const BorderRadiusGeometry smallBottom = BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0));
  static const BorderRadiusGeometry smallLeft = BorderRadius.only(topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0));
  static const BorderRadiusGeometry smallRight = BorderRadius.only(topRight: Radius.circular(8.0), bottomRight: Radius.circular(8.0));

  // متوسط (برای کارت‌ها، کانتینرها، ورودی‌ها)
  static const BorderRadiusGeometry medium = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadiusGeometry mediumTop = BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0));
  static const BorderRadiusGeometry mediumBottom = BorderRadius.only(bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0));

  // زیاد (برای مواردی که نیاز به گردی بیشتری است)
  static const BorderRadiusGeometry large = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadiusGeometry largeTop = BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0));
  static const BorderRadiusGeometry largeBottom = BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0));

  // گرد کامل (برای تصاویر دایره‌ای یا دکمه‌های دایره‌ای)
  static const BorderRadiusGeometry extraLarge = BorderRadius.all(Radius.circular(24.0));
  static BorderRadiusGeometry circularBo = BorderRadius.circular(100.0); // مقدار بزرگ برای تضمین گردی کامل

  // --- برای Radius (در CircleAvatar، ClipOval و ...) ---

  // برای CircleAvatar یا تصاویر دایره‌ای
  static const double circularAvatarRadius = 30.0; // مثال، می‌توانید اندازه دلخواه بدهید
  static const double largeCircularRadius = 50.0;

  // برای ClipOval یا اشکال بیضی
  static const Radius radiusMedium = Radius.circular(12.0);
  static const Radius radiusLarge = Radius.circular(16.0);
}
