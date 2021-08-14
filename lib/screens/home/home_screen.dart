import 'package:carrot_market_ui/screens/detail/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';
import 'package:get/get.dart';

import '../../models/product.dart';
import 'components/product_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          height: 0,
          indent: 16,
          endIndent: 16,
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(DetailScreen());
            },
            child: ProductItem(
              product: productList[index],
            ),
          );
        },
        itemCount: productList.length,
      ),
      floatingActionButton: SpeedDialFabWidget(
        primaryIconExpand: Icons.add,
        primaryIconCollapse: Icons.clear,
        secondaryIconsList: [
          Icons.article_rounded,
          FontAwesomeIcons.pen,
        ],
        secondaryIconsText: [
          "",
          "",
        ],
        secondaryIconsOnPress: [
          () => {},
          () => {},
        ],
        secondaryBackgroundColor: Colors.orange,
        secondaryForegroundColor: Colors.white,
        primaryBackgroundColor: Colors.orange,
        primaryForegroundColor: Colors.white,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        children: [
          const Text('좌동'),
          const SizedBox(width: 4.0),
          const Icon(
            CupertinoIcons.chevron_down,
            size: 15.0,
          ),
        ],
      ),
      actions: [
        IconButton(icon: const Icon(CupertinoIcons.search), onPressed: () {}),
        IconButton(
            icon: const Icon(CupertinoIcons.list_dash), onPressed: () {}),
        IconButton(icon: const Icon(CupertinoIcons.bell), onPressed: () {})
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0.5),
        child: Divider(thickness: 0.5, height: 0.5, color: Colors.grey),
      ),
    );
  }
}
