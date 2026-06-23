import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;
  _HomePageState();

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight * 0.15,
        title: const Text(
          'Taskly', 
          style: TextStyle(
            fontSize: 30, 
            fontWeight: FontWeight.bold
          )
        ),
      ),
      body: _tasksList(),
    );
  }

  Widget _tasksList() {
    return ListView(
      children: [
        ListTile(
          title: const Text(
            'Do Laundry', 
            style: TextStyle(
              decoration: TextDecoration.lineThrough
            )),
            subtitle: Text(DateTime.now().toString()),
            trailing: IconButton(
              icon: const Icon(
                Icons.check_box_outlined, 
                color: Colors.red
              ),
              onPressed: () {},
            ),
          ),
        ListTile(
          title: Text(
            'Do Laundry', 
            style: TextStyle(
              decoration: TextDecoration.lineThrough
            )),
            subtitle: Text(DateTime.now().toString()),
            trailing: IconButton(
              icon: Icon(
                Icons.check_box_outlined, 
                color: Colors.red
              ),
              onPressed: () {},
            ),
          ),      
      ]
      
    ); 
  }
}