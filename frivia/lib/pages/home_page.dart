import 'package:flutter/material.dart';
import 'package:frivia/providers/game_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:frivia/pages/game_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;
  double _currentDifficultyLevel = 0;

  final List<String> _difficultyTexts= ['Easy', 'Medium', 'Hard'];

  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth! * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              const Text(
                'Frivia',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                _difficultyTexts[_currentDifficultyLevel.toInt()],
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              _difficultySlider(),
              SizedBox(height: _deviceHeight! * 0.05),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage(
                      difficultyLevel: 
                      _difficultyTexts[_currentDifficultyLevel.toInt()]
                        .toLowerCase(),)),
                  );
                },
                color: Colors.blue,
                minWidth: _deviceWidth! * 0.80,
                height: _deviceHeight! * 0.10,
                child: const Text(
                  'Start Game',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _difficultySlider() {
    return Slider(
      value: _currentDifficultyLevel,
      onChanged: (_value) {
        setState(() {
          _currentDifficultyLevel = _value;
        });
      },
      min: 0,
      max: 2,
      divisions: 2,
      label: 'Difficulty',
    );
  }
}