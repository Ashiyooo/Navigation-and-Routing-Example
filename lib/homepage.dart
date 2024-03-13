import "dart:html";
import "package:flutter/material.dart";

const String randomThing = """A UP education seeks to produce graduates imbued with an abiding sense of responsibility to their people and nation, the skills and mindsets to improve human life, and a commitment to the freedom and welfare of all.
Aside from mastery of knowledge in their specific disciplines, UP graduates must possess breadth of mind, strength of character, and generosity of spirit, fostered by a firm grounding in both the arts and sciences, and such specialist courses as their programs may require.
They must be prepared to inclusively engage with society and the world at large, mindful of their people’s needs and capabilities, and keen to the challenges and opportunities of national development in this century of rapid global change.
UP aims to achieve this through its General Education program, one that develops mind, body and spirit, which familiarize all its students with their culture and history and fosters a sense of shared citizenship, while equipping them with critical thinking, discernment and technical skills they will need to excel in their chosen professions.
""";
//Tab Example
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("HomePage Tab Examples"),
          bottom: const TabBar(
            tabs:[
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_boat)),
              ] 
            ),
          ),
       body: const TabBarView(
        children: [
            ChangingContainer(),
            TextBox(text: randomThing),
            CheckerBoard(),
          ]
        ), 
      )
    );
  }
}

class ChangingContainer extends StatefulWidget{
  const ChangingContainer({super.key});

  @override
  State<StatefulWidget> createState() => _ChangingContainer();
}

class _ChangingContainer extends State<ChangingContainer> {
  bool _active = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() {
          _active = !_active;
        }),
        child: Container(
            color: _active? Colors.deepOrange: Colors.amber,
            child: const Text("Wieee"),
          )
        ),
    );
  }
}

class TextBox extends StatelessWidget{
  const TextBox({
    super.key,
    required this.text,
  });

  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: const Color.fromARGB(255, 182, 198, 226),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class CheckerBoard extends StatelessWidget{
  const CheckerBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, 
      children: List.generate(12, (index) => Container(color: (index % 2 == 0)? Colors.white: Colors.black)), 
    );
  }
}
