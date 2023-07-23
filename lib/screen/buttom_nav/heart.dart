import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';


class heart_broken_outlined extends StatefulWidget {
  const heart_broken_outlined({super.key});

  @override
  State<heart_broken_outlined> createState() => _heart_broken_outlinedState();
}

class _heart_broken_outlinedState extends State<heart_broken_outlined> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('Discover',style: TextStyle(fontSize: 18,color: Color(0xff222B45)),)
          ],),
        toolbarHeight: 90,
        backgroundColor: Color(0xffFFFFFF),
      ),
      body:Column(children: [
        SizedBox(height: 15,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Categories',style: TextStyle(fontSize: 15,color: Color(0xff222B45)),),
          Text('View all',style: TextStyle(fontSize: 15,color: Color(0xffF3651F)),)
        ],),
        // SizedBox(
        //   child: ListView.builder(scrollDirection: Axis.vertical,
        //     itemBuilder: (context, index) {
        //       return   ;
        //     },
        //     ),
        // ),
      ],) ,



 );}
}