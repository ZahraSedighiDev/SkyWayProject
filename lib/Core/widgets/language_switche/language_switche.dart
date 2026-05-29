import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  bool get isDesktop => Get.width > 800;

  @override
  Widget build(BuildContext context) {
    return isDesktop ? const _DesktopToggle() : const _MobileLanguageButton();
  }
}

class _DesktopToggle extends StatelessWidget {
  const _DesktopToggle();

  @override
  Widget build(BuildContext context) {
    final lang = Get.locale?.languageCode ?? 'en';

    return Container(
      width: 110,
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            alignment:
            lang == 'fa' ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: 50,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black.withOpacity(.15),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.updateLocale(const Locale('fa')),
                  child: const Center(child: Text("FA")),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.updateLocale(const Locale('en')),
                  child: const Center(child: Text("EN")),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _MobileLanguageButton extends StatelessWidget {
  const _MobileLanguageButton();

  void _openSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _langTile("fa", "فارسی"),
            _langTile("en", "English"),
          ],
        ),
      ),
    );
  }

  Widget _langTile(String code, String title) {
    final current = Get.locale?.languageCode;

    return ListTile(
      title: Text(title),
      trailing: current == code ? const Icon(Icons.check) : null,
      onTap: () {
        Get.updateLocale(Locale(code));
        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.language),
      onPressed: _openSheet,
    );
  }
}
