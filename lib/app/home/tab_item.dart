import 'package:flutter/material.dart';

enum TabItem {
  jobs,
  entries,
  account,
}

/// Class to hold title and icon of each item in bottom navigation bar
class TabItemData {

  const TabItemData({
    @required this.title,
    @required this.icon,
  });

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.jobs: TabItemData(title: "Jobs", icon: Icons.work),
    TabItem.entries: TabItemData(title: "Entries", icon: Icons.view_headline),
    TabItem.account: TabItemData(title: "Account", icon: Icons.person),
  };
}
