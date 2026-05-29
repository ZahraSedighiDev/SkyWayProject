class SubMenuItem {
  final String labelKey;
  final String? route;

  const SubMenuItem({
    required this.labelKey,
    this.route,
  });
}

class MainMenuItem {
  final String labelKey;
  final List<SubMenuItem> subMenu;

  const MainMenuItem({
    required this.labelKey,
    this.subMenu = const [],
  });

  bool get hasSubMenu => subMenu.isNotEmpty;
}
