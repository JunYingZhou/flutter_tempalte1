import 'package:flutter/material.dart';
import './tabs/home.dart';
import './tabs/category.dart';
import './tabs/message.dart';
import './tabs/setting.dart';
import './tabs/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/app_drawer.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    CategoryPage(),
    MessagePage(),
    SettingPage(),
    UserPage()
  ];

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('isLoggedIn'); // 删除键（用于测试）
    await prefs.setBool('isLoggedIn', false); // 设置为 false（测试用）
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (!isLoggedIn && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                '提示',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              content: Text(
                '请先登录',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/signIn'),
                  child: Text(
                    '确定',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "A APP v1",
          // 居中
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
      ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // drawer: Drawer(
      //   backgroundColor: Theme.of(context).colorScheme.surface, // 背景使用主题表面颜色,
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           Expanded(
      //             flex: 1,
      //             child: UserAccountsDrawerHeader(
      //               accountName: Text(
      //                 "itying",
      //                 style: TextStyle(
      //                     color: Theme.of(context).colorScheme.onPrimary),
      //               ),
      //               accountEmail: Text(
      //                 "itying@qq.com",
      //                 style: TextStyle(
      //                     color: Theme.of(context).colorScheme.onPrimary),
      //               ),
      //               otherAccountsPictures: [
      //                 Image.network("https://www.itying.com/images/flutter/1.png"),
      //                 Image.network("https://www.itying.com/images/flutter/2.png"),
      //                 Image.network("https://www.itying.com/images/flutter/3.png"),
      //               ],
      //               currentAccountPicture: const CircleAvatar(
      //                 backgroundImage:
      //                     NetworkImage("https://www.itying.com/images/flutter/3.png"),
      //               ),
      //               decoration: const BoxDecoration(
      //                 image: DecorationImage(
      //                   fit: BoxFit.cover,
      //                   image: NetworkImage("https://www.itying.com/images/flutter/2.png"),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       ListTile(
      //         leading: CircleAvatar(
      //           child: Icon(
      //             Icons.people,
      //             color: Theme.of(context).colorScheme.onSecondaryContainer,
      //           ),
      //           backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      //         ),
      //         title: Text(
      //           "个人中心",
      //           style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      //         ),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       const Divider(),
      //       ListTile(
      //         leading: CircleAvatar(
      //           child: Icon(
      //             Icons.settings,
      //             color: Theme.of(context).colorScheme.onSecondaryContainer,
      //           ),
      //           backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      //         ),
      //         title: Text(
      //           "系统设置",
      //           style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      //         ),
      //       ),
      //       const Divider(
      //         color: Colors.transparent, // Divider 使用主题轮廓颜色
      //       ),
      //     ],
      //   ),
      // ),
      drawer: AppDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.surface,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "分类",
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "消息",
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "设置",
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "用户",
            tooltip: '',
          ),
        ].map((item) {
          return BottomNavigationBarItem(
            icon: item.icon,
            label: item.label,
            tooltip: item.tooltip,
            activeIcon: Icon(
              (item.icon as Icon).icon,
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }).toList(),
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 2
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}