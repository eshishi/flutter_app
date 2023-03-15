import 'package:flutter/material.dart';
import 'package:flutter_app/graphScreen.dart';
import 'package:fl_chart/fl_chart.dart';

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

  var _pages = <Widget>[];

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
          '猫背防止帽子',
          style: TextStyle(
              fontSize: 23,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(250, 134, 109, 18)),
        ),
        backgroundColor: Color.fromARGB(255, 244, 214, 116), //背景色
        toolbarHeight: 60,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/back.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      //_pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airline_seat_recline_normal, //ホームアイコン
              size: 50, //アイコンサイズ
            ),
            label: 'Doll', //ラベル
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assessment, //人形アイコン
              size: 50, //アイコンサイズ
            ),
            label: 'Graph1', //ラベル
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assessment, //グラフアイコン
              size: 50, //アイコンサイズ
            ),
            label: 'Graph2', //ラベル
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 255, 85, 0), //選択しているアイコンの色
        backgroundColor: Color.fromARGB(255, 244, 214, 116), //背景色
        currentIndex: _selectIndex,
        onTap: _onTapItem,
      ),
    );
  }
}
