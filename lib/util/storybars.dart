// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:app_15_1_22/util/progressbar.dart';
import 'package:flutter/material.dart';

class MyStoryBars extends StatelessWidget {
  List<double> percentWatched = [];
   MyStoryBars({Key? key, required this.percentWatched}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 8, right: 8),
      child: Row(
        children: [
          Expanded(
            child: MyProgressBar(percentWatched: percentWatched[0]),
          ),
           Expanded(
            child: MyProgressBar(percentWatched: percentWatched[1]),
          ),
           Expanded(
            child: MyProgressBar(percentWatched: percentWatched[2]),
          ),
        ],
      ),
    );
  }
}
