import 'package:convert_platform/add_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convert_platform/Utils.dart';

import 'Calls.dart';
import 'Chats.dart';
import 'Settings.dart';
import 'misc/color.dart';

class Android extends StatefulWidget {
  const Android({Key? key}) : super(key: key);

  @override
  State<Android> createState() => _AndroidState();
}

class _AndroidState extends State<Android> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool isSwitched = false;
  List<Widget> data = [const Chats(), const Calls(), const Settings()];
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: !Utils.changeDesign
                  ? AppColors.commonColor
                  : AppColors.commonColor1,
              title: !Utils.changeDesign
                  ? const Text("Platform Convertor")
                  : const Text(
                      "Platform Convertor",
                      style: TextStyle(color: Color(0xff54759e)),
                    ),
              actions: [
                Utils.changeDesign
                    ? CupertinoSwitch(
                        value: Utils.changeDesign,
                        trackColor: Colors.red,
                        onChanged: (val) {
                          setState(() {
                            Utils.changeDesign = val;
                          });
                        })
                    : Switch(
                        inactiveThumbImage: const NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/174/174836.png'),
                        value: Utils.changeDesign,
                        onChanged: (value) {
                          setState(() {
                            Utils.changeDesign = value;
                          });
                        },
                      )
              ],
              bottom: Utils.changeDesign
                  ? PreferredSize(
                      preferredSize: const Size(0, 0), child: Container())
                  : TabBar(
                      controller: _tabController,
                      indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(width: 3, color: Colors.white),
                          insets: EdgeInsets.symmetric(horizontal: 10)),
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      tabs: const [
                        Tab(text: "CHATS"),
                        Tab(text: "CALLS"),
                        Tab(text: "SETTINGS")
                      ],
                    )),
          floatingActionButton: Utils.changeDesign
              ? Container()
              : FloatingActionButton(
                  onPressed: () {
                    showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              height: 550,
                              width: 380,
                              child: android_addchat(),
                            ),
                          );
                        });
                  },
                  backgroundColor: AppColors.commonColor,
                  child: const Icon(Icons.add, size: 35),
                ),
          drawer: !Utils.changeDesign
              ? Drawer(
                  child: ListView(
                    children: const [
                      UserAccountsDrawerHeader(
                        decoration: BoxDecoration(color: AppColors.commonColor),
                        accountName: Text(
                          "John Doe",
                          style: TextStyle(fontSize: 18),
                        ),
                        accountEmail: Text(
                          '+91 3245789120',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: AssetImage("asset/profile.jpg"),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.people_alt_outlined, size: 30),
                        title: Text("New Contact",
                            style: TextStyle(color: AppColors.commonColor)),
                      ),
                      ListTile(
                        leading: Icon(Icons.person_outline, size: 30),
                        title: Text("New Contact",
                            style: TextStyle(color: AppColors.commonColor)),
                      ),
                      ListTile(
                        leading: Icon(Icons.call_outlined, size: 30),
                        title: Text("Calls",
                            style: TextStyle(color: AppColors.commonColor)),
                      ),
                      ListTile(
                        leading: Icon(Icons.bookmark_border_sharp, size: 30),
                        title: Text("saved Messages",
                            style: TextStyle(color: AppColors.commonColor)),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings_outlined, size: 30),
                        title: Text("Settings",
                            style: TextStyle(color: AppColors.commonColor)),
                      ),
                    ],
                  ),
                )
              : const Icon(Icons.menu, color: Color(0xff54759e)),
          body: Utils.changeDesign
              ? CupertinoTabScaffold(
                  tabBuilder: (BuildContext context, int index) {
                    return CupertinoTabView(
                      builder: (context) {
                        return data[index];
                      },
                    );
                  },
                  tabBar: CupertinoTabBar(
                    activeColor: AppColors.commonColor,
                    currentIndex: 0,
                    height: 80,
                    iconSize: 35,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
                        icon: Icon(CupertinoIcons.chat_bubble_2),
                        label: 'Chats',
                      ),
                      BottomNavigationBarItem(
                        activeIcon: Icon(CupertinoIcons.phone_fill),
                        icon: Icon(CupertinoIcons.phone),
                        label: 'Calls',
                      ),
                      BottomNavigationBarItem(
                        activeIcon: Icon(CupertinoIcons.settings_solid),
                        icon: Icon(CupertinoIcons.settings),
                        label: 'Settings',
                      ),
                    ],
                  ),)
              : TabBarView(
                  controller: _tabController,
                  children: const [Chats(), Calls(), Settings()],
                )),
    );
  }
}
