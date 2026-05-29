

import 'package:flutter/cupertino.dart';

class AppShadows {
  const AppShadows._();

  // بدون سایه
  static final List<BoxShadow> none = [
  const BoxShadow(
  color: Color(0x00000000),
  blurRadius: 0,
  spreadRadius: 0,
  offset: Offset(0, 0),
  ),
  ];

  // خیلی کوچک
  static final List<BoxShadow> tiny = [
  const BoxShadow(
  color: Color(0x0D000000), // 5% opacity
  blurRadius: 2,
  spreadRadius: 0,
  offset: Offset(0, 1),
  ),
  ];

  // کوچک
  static final List<BoxShadow> small = [
  const BoxShadow(
  color: Color(0x1A000000), // 10%
  blurRadius: 4,
  spreadRadius: 0,
  offset: Offset(0, 2),
  ),
  ];

  // متوسط
  static final List<BoxShadow> medium = [
  const BoxShadow(
  color: Color(0x26000000), // 15%
  blurRadius: 8,
  spreadRadius: 0,
  offset: Offset(0, 4),
  ),
  ];

  // بزرگ
  static final List<BoxShadow> large = [
  const BoxShadow(
  color: Color(0x33000000), // 20%
  blurRadius: 16,
  spreadRadius: 0,
  offset: Offset(0, 8),
  ),
  ];

  // خیلی بزرگ (برای صفحات/دیالوگ‌ها)
  static final List<BoxShadow> extra = [
  const BoxShadow(
  color: Color(0x40000000), // 25%
  blurRadius: 24,
  spreadRadius: 0,
  offset: Offset(0, 12),
  ),
  ];
  }

