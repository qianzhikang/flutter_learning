import 'package:flutter/material.dart';
import '../global/style.dart';
import '../model/bottom_bar_item.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  List<AppBottomBarItem> barItems = [
    AppBottomBarItem(
      icon: Icons.home,
      label: 'Home',
      isSelected: true,
    ),
    AppBottomBarItem(
      icon: Icons.explore,
      label: 'Explore',
      isSelected: false,
    ),
    AppBottomBarItem(
      icon: Icons.turned_in_not,
      label: 'Tag',
      isSelected: false,
    ),
    AppBottomBarItem(
      icon: Icons.person_outline,
      label: 'Profile',
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(barItems.length, (index) {
            AppBottomBarItem current = barItems[index];
            Widget barItemWidget;
            if (current.isSelected) {
              barItemWidget = Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Icon(
                      current.icon,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      current.label,
                      style: bottomItemStyle,
                    )
                  ],
                ),
              );
            } else {
              barItemWidget = IconButton(
                  onPressed: (){
                    setState(() {
                      for (var item in barItems) {
                        item.isSelected = item == current;
                      }
                    });
                  },
                  icon: Icon(
                    current.icon,
                    color: Colors.black,
                  ));
            }
            return barItemWidget;
          })),
    );
  }
}
