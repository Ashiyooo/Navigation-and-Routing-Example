import "package:demo2/todo.dart";
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
      length: 5, // number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("HomePage Tab Examples"),
          bottom: const TabBar(
            tabs:[
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_boat)),
                Tab(icon: Icon(Icons.today_outlined)),
                Tab(icon: Icon(Icons.abc_rounded)),
              ] 
            ),
          ),
       body: TabBarView(
        children: [
            const ChangingContainer(),
            const TextBox(text: randomThing),
            const CheckerBoard(),
            TodosScreen(todos: List.generate(20, (i) => Todo('Todo $i', 'A description of what needs to be done for Todo $i',))),
            Center(
              child: ElevatedButton(
                child: const Text('Go to Returning data example'),
                onPressed: () => Navigator.pushNamed(context, '/page2')
              )
            ),
          ]
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
              const DrawerHeader(child: Text("Menu")),
              ListTile(
                title: const Text('Hi?'),   
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Hewwo")));
                  Navigator.pop(context);
                },
              )
            ],
          )
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
            width: 300,
            height: 300,
            color: _active? Colors.deepOrange: Colors.amber,
            child: const Center(child: Text("Wieee", style: TextStyle(fontSize: 20.0),)),
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