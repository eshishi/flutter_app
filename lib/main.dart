import 'package:flutter/material.dart';
import 'package:flutter_app/graphScreen.dart';
import 'package:flutter_app/dollScreen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_app/lineChart.dart';
import 'package:flutter_app/pricePoints.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectIndex = 0;

  var _pages = <Widget>[
    ListView(
      children: [Text('data')],
    ),
    DollPage(),
    GraphPage(),
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //タイトル
        title: const Text(
          '猫背 BOUSHI × BOUSHI',
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.blueGrey, //背景色
        toolbarHeight: 60,
      ),
      //メニュー
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                'メニュー',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            //プロフィールアイコン
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('プロフィール'),
            ),
            //設定アイコン
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('設定'),
            ),
          ],
        ),
      ),
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home, //ホームアイコン
              size: 50, //アイコンサイズ
            ),
            label: 'Home', //ラベル
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airline_seat_recline_normal, //人形アイコン
              size: 50, //アイコンサイズ
            ),
            label: 'Doll', //ラベル
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assessment, //グラフアイコン
              size: 50, //アイコンサイズ
            ),
            label: 'Graph', //ラベル
          ),
        ],
        selectedItemColor: Colors.amber[800], //選択しているアイコンの色
        backgroundColor: Colors.blueGrey, //背景色
        currentIndex: _selectIndex,
        onTap: _onTapItem,
      ),
    );
  }
}
