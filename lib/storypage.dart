// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:app_15_1_22/stories/story_page1.dart';
import 'package:app_15_1_22/stories/story_page2.dart';
import 'package:app_15_1_22/stories/story_page3.dart';
import 'package:app_15_1_22/util/storybars.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;
  final List<Widget> myStories = [
    MyStory1(),
    MyStory2(),
    MyStory3(),
  ];

  List<double> percentWatched = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < myStories.length; i++) {
      percentWatched.add(0);
    }
    _startWatching();
  }

  void _startWatching() {
    Timer.periodic(
      Duration(milliseconds: 50),
      (timer) {
        setState(
          () {
            if (percentWatched[currentStoryIndex] + 0.01 < 1) {
              percentWatched[currentStoryIndex] += 0.01;
            } else {
              percentWatched[currentStoryIndex] = 1;
              timer.cancel();
              if (currentStoryIndex < myStories.length - 1) {
                currentStoryIndex++;
                _startWatching();
              } else {
                Navigator.pop(context);
              }
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          myStories[currentStoryIndex],
          MyStoryBars(
            percentWatched: percentWatched,
          )
        ],
      ),
    );
  }
}
