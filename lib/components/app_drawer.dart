import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  // 当前头像
  String currentImageUrl = "https://www.itying.com/images/flutter/3.png";

  // 可切换头像列表
  final List<String> otherImageUrls = [
    "https://www.itying.com/images/flutter/1.png",
    "https://www.itying.com/images/flutter/2.png",
    "https://www.itying.com/images/flutter/3.png",
  ];

  // 生成头像切换按钮
  Widget buildAccountPictureItem(String url) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentImageUrl = url;
        });
      },
      child: Image.network(url, width: 40, height: 40),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      // backgroundColor: Colors.black,
      backgroundColor: colorScheme.surface,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("itying", style: TextStyle(color: colorScheme.onPrimary)),
            accountEmail: Text("itying@qq.com", style: TextStyle(color: colorScheme.onPrimary)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(currentImageUrl),
            ),
            otherAccountsPictures: otherImageUrls
                .map((url) => buildAccountPictureItem(url))
                .toList(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://www.itying.com/images/flutter/2.png"),
              ),
            ),
          ),
          _buildListTile(
            icon: Icons.people,
            label: "个人中心",
            onTap: () => Navigator.pop(context),
            colorScheme: colorScheme,
          ),
          const Divider(),
          _buildListTile(
            icon: Icons.settings,
            label: "系统设置",
            colorScheme: colorScheme,
            onTap: () => Navigator.pushNamed(context, '/systemSetting'),
          ),
          const Divider(color: Colors.transparent),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String label,
    ColorScheme? colorScheme,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: colorScheme?.secondaryContainer,
        child: Icon(icon, color: colorScheme?.onSecondaryContainer),
      ),
      title: Text(label, style: TextStyle(color: colorScheme?.onSurface)),
      onTap: onTap,
    );
  }
}
