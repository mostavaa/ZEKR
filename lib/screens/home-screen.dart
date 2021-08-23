import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zekr/widgets/home/home-content.dart';
import '../widgets/bg.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = 'HomeScreen';

  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double percentage = 0.7;
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final myAppBar = AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: myAppBar,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // BG(color: Colors.white),
          Builder(
            builder: (ctx) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(
                    //   height: isLandscape ? myAppBar.preferredSize.height : 0,
                    // ),
                    HomeContent(
                      key: Key("1"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
