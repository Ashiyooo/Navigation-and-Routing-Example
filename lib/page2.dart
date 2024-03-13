import "package:flutter/material.dart";

class Page2 extends StatelessWidget{
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, 
      children: List.generate(12, (index) => Container(color: (index % 2 == 0)? Colors.white: Colors.black)), 
    );
  }
}