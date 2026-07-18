import 'package:flutter/material.dart';
import 'package:finstagram/pages/feed.page.dart';
import 'package:finstagram/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;
  int _currentPage = 0;
  final List<Widget> _pages = [
    FeedPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finstagram', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
      
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.add_a_photo, color: Colors.white,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.03),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.logout, color: Colors.white,),
            ),
          ),
        ],
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentPage,
      onTap: (_index) {
        setState(() {
          _currentPage = _index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.feed),
          label: 'Feed',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: 'Profile',
        ),
      ],
    );
  }
}