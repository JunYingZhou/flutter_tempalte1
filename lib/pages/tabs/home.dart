import 'package:flutter/material.dart';
import '../../res/listData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _getListData() {
    var tempList = listData.map((value) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/hero",
              arguments: {"imageUrl": value['imageUrl']});
        },
        child: Container(
          // decoration: BoxDecoration(
          //   color: Theme.of(context).colorScheme.surface, // 背景使用主题表面颜色
          //   border: Border.all(
          //     color: Theme.of(context).colorScheme.outline, // 边框使用主题轮廓颜色
          //     width: 1,
          //   ),
          //   borderRadius: BorderRadius.circular(8), // 添加圆角，增强视觉效果
          //     // border: Border.all(
          //         // color: const Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
          //         // color: Theme.of(context).colorScheme.surface, width: 1)
          // // ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface, // 背景使用主题表面颜色
            border: Border.all(
              color: Theme.of(context).colorScheme.outline, // 边框使用主题轮廓颜色
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8), // 添加圆角，增强视觉效果
          ),
          child: Column(
            children: <Widget>[
              Hero(tag: value['imageUrl'], child: Image.network(value['imageUrl'])),
              const SizedBox(height: 10),
              Text(
                  value['title'],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface, // 文本颜色
                  ),
                )
            ],
          ),
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10.0, //水平子 Widget 之间间距
      mainAxisSpacing: 10.0, //垂直子 Widget 之间间距
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2, //一行的 Widget 数量
      // childAspectRatio:0.7,  //宽度和高度的比例
      children: _getListData(),
    );
  }
}
