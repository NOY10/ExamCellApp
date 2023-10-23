import 'package:flutter/material.dart';
import 'userpage.dart';
import 'Setting.dart';
import 'About.dart';
import 'package:examcellapp/views/Examcell/NavBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    ProfileScreen(),
    UploadScreen(),
    ViewResultScreen(),
  ];

  final List<String> _pageTitles = [
    'Result Processing System',
    'Upload Result',
    'View Result',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          _pageTitles[_currentIndex],
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Color.fromARGB(255, 245, 247, 245),
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.upload),
              label: 'Upload Result',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye),
              label: 'View Result',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            });
          },
        ),
      ),
    );
  }
}

//************************************  Profile Screen starts  ************************************/

class ProfileScreen extends StatelessWidget {
  // Create a list of module data
  final List<Module> modules = [
    Module('CTE306', 'Fifth Semester/csdd'),
    Module('Another Module', 'Description of another module'),
    Module('CTE306', 'Fifth Semester/csdd'),
    Module('Another Module', 'Description of another module'),
    Module('CTE306', 'Fifth Semester/csdd'),
    Module('Another Module', 'Description of another module'),
    // Add more modules as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Divider(
            color: Colors.blue,
            thickness: 2,
            indent: 1,
          ),
          const Text(
            'List of Modules you are currently teaching',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView(
              children: modules.map((module) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(
                      1, 0, 8, 0), // Add right-side padding
                  child: Card(
                    color: Colors.white,
                    child: Container(
                      margin: const EdgeInsets.only(left: 1),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.blue,
                            width: 40,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.message),
                            title: Text(module.name),
                            subtitle: Text(module.description),
                            trailing: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ModuleResult(),
                                  ),
                                );
                              },
                              child: Icon(Icons.arrow_forward_ios_outlined),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class Module {
  final String name;
  final String description;

  Module(this.name, this.description);
}

//************************************  Profile Screen  ends ************************************/

//************************************  Upload Screen  starts ************************************/

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: const SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('To be Added')),
        ),
      ),
    );
  }
}
//************************************  Profile Screen ends  **************************************/

//************************************  ViewResult Screen starts  ************************************/

class ViewResultScreen extends StatelessWidget {
  const ViewResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: const SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Tabular form will be added')),
        ),
      ),
    );
  }
}
//************************************  ViewResult Screen  ends ************************************/

class ModuleResult extends StatelessWidget {
  const ModuleResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavigationDrawerWidget(), //enable it if you want to have the drawer in the page
      appBar: AppBar(
        title: Text('Module Result'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
