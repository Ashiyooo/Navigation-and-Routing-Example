import "package:flutter/material.dart";

class Page1 extends StatelessWidget{
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle), 
        width: 250,
        height: 250,
      ),
    );
  }
}