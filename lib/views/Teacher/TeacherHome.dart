import 'package:examcellapp/views/Teacher/Landing.dart';
import 'package:flutter/material.dart';
import 'package:examcellapp/views/NavBar/NavBar.dart';
import 'package:examcellapp/views/Teacher/filePicker/filePicker.dart';

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
          top: Radius.circular(23.0),
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


//************************************  Profile Screen  ends ************************************/

//************************************  Upload Screen  starts ************************************/

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: SizedBox(
        width: 300,
        height: 100,
        child: FilePickerE(),
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

