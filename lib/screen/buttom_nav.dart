import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'buttom_nav/heart.dart';
import 'buttom_nav/blender.dart';
import 'buttom_nav/badge.dart';
import 'buttom_nav/home.dart';
import 'buttom_nav/person.dart';




class buttompage extends StatefulWidget {
  const buttompage({super.key});

  @override
  State<buttompage> createState() => _buttompageState();
}

class _buttompageState extends State<buttompage> {
  List L = [
    homepage(),
    badge_outlined(),
    heart_broken_outlined(),
    blender_outlined(),
    person_2_outlined(),
  ];
  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: L[currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value ;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.amber),label: '',),
          BottomNavigationBarItem(icon: Icon(Icons.badge_outlined,color: Colors.amber),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.heart_broken_outlined,color: Colors.amber),label: ''), 
          BottomNavigationBarItem(icon: Icon(Icons.timelapse_outlined,color: Colors.amber),label: ''), 
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined,color: Colors.amber),label: ''), 
        ],),
    );
  }
}
