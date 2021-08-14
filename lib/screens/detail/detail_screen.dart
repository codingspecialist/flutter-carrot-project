import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var isScrollStart = false;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final imageHeight = MediaQuery.of(context).size.height * 0.5;
    final appBarHeight = SliverAppBar().toolbarHeight;

    final scrollController = ScrollController();

    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            // print("${scrollController.offset}");
            // print("$imageHeight : 이미지크기");
            // print("$appBarHeight :  앱바크기");
            // print("$statusBarHeight :  상태바크기");

            if (scrollController.offset >
                (imageHeight - appBarHeight - statusBarHeight - 20)) {
              if (isScrollStart == false) {
                setState(() {
                  print("앱바 스타트~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                  isScrollStart = true;
                });
              }
            } else {
              if (isScrollStart == true) {
                setState(() {
                  print("앱바 원상복귀~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                  isScrollStart = false;
                });
              }
            }
            return true;
          },
          child: Container(
            color: Colors.white,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Image.asset(
                    "assets/1.jpg",
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        color: Colors.white,
                        height: 70,
                      ),
                      Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                      Container(
                        color: Colors.white,
                        height: 200,
                      ),
                      Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                      Container(
                        color: Colors.white,
                        height: 70,
                      ),
                      Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                      Container(
                        color: Colors.white,
                        height: 70,
                      ),
                    ]),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      ...List.generate(
                        20,
                        (index) => Image.network(
                          "https://picsum.photos/id/${index + 1}/200/200",
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(bottom: 100)),
              ],
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: appBarHeight + statusBarHeight,
              child: isScrollStart ? _buildStartAppBar() : _buildBasicAppBar(),
            ),
            Spacer(),
            Divider(
              height: 0,
              color: Colors.grey,
            ),
            Container(
              color: Colors.white,
              height: 80,
            ),
          ],
        ),
      ],
    );
  }

  AppBar _buildBasicAppBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      actions: [
        Icon(Icons.ios_share),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }

  AppBar _buildStartAppBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      actions: [
        Icon(Icons.ios_share),
        SizedBox(
          width: 16,
        ),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0.5),
        child: Divider(thickness: 0.5, height: 0.5, color: Colors.grey),
      ),
    );
  }
}
