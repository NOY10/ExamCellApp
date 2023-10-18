import 'package:flutter/material.dart';
import 'userpage.dart';
import 'Setting.dart';
import 'About.dart';
import 'package:examcellapp/views/Examcell/NavBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ProfileScreen(),
    UploadScreen(),
    ViewResultScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue, // Change this color to blue
        title: const Text('Result Processing System'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        unselectedItemColor: Color.fromARGB(255, 12, 241, 126),
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
            _currentIndex = index; // it can change the selected page index
          });
        },
      ),
    );
  }
}

//************************************  Profile Screen starts  ************************************/
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Chat Item"),
      //   backgroundColor: Colors.lightGreen,
      // ),
      body: Column(
        children: [
          // ChatItemScreen(),
          // Module(),
          DetailsItem(),
          const Divider(
            color: Colors.blue,
            thickness: 2,
            indent: 1,
          ),
          const Text(
            'List of Module you are currently teaching',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                //1
                Card(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 1), // Add a left margin of 15 pixels
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.blue, // Set the border color to blue
                          width: 45, // Set the border width to 15 pixels
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.message),
                          title: Text('CTE306'),
                          subtitle: Text('Fifth Semester/csdd'),
                          trailing: InkWell(
                            onTap: () {
                              // Navigate to the new page here when the trailing icon is tapped.
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => YourNewPage()),
                              // );
                              print("Next page");
                            },
                            child: Icon(Icons.arrow_right),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //2
                Card(
                  color: Color.fromARGB(255, 231, 233, 233),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.message),
                        title: Text('CTE306'),
                        subtitle: Text('Fifth Semester/csdd'),
                        trailing: InkWell(
                          onTap: () {
                            // Navigate to the new page here when the trailing icon is tapped.
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => YourNewPage()),
                            // );
                            print("Next page");
                          },
                          child: Icon(Icons.arrow_right),
                        ),
                      ),
                    ],
                  ),
                ),
                //3
                Card(
                  color: Color.fromARGB(255, 231, 233, 233),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.message),
                        title: Text('CTE306'),
                        subtitle: Text('Fifth Semester/csdd'),
                        trailing: InkWell(
                          onTap: () {
                            // Navigate to the new page here when the trailing icon is tapped.
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => YourNewPage()),
                            // );
                            print("Next page");
                          },
                          child: Icon(Icons.arrow_right),
                        ),
                      ),
                    ],
                  ),
                ),
                //4
                Card(
                  color: Color.fromARGB(255, 231, 233, 233),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.message),
                        title: Text('CTE306'),
                        subtitle: Text('Fifth Semester/csdd'),
                        trailing: InkWell(
                          onTap: () {
                            // Navigate to the new page here when the trailing icon is tapped.
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => YourNewPage()),
                            // );
                            print("Next page");
                          },
                          child: Icon(Icons.arrow_right),
                        ),
                      ),
                    ],
                  ),
                ),
                //5
                Card(
                  color: Color.fromARGB(255, 231, 233, 233),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.message),
                        title: Text('CTE306'),
                        subtitle: Text('Fifth Semester/csdd'),
                        trailing: InkWell(
                          onTap: () {
                            // Navigate to the new page here when the trailing icon is tapped.
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => YourNewPage()),
                            // );
                            print("Next page");
                          },
                          child: Icon(Icons.arrow_right),
                        ),
                      ),
                    ],
                  ),
                ),
                //6
                Card(
                  color: Color.fromARGB(255, 231, 233, 233),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.message),
                        title: Text('CTE306'),
                        subtitle: Text('Fifth Semester/csdd'),
                        trailing: InkWell(
                          onTap: () {
                            // Navigate to the new page here when the trailing icon is tapped.
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => YourNewPage()),
                            // );
                            print("Next page");
                          },
                          child: Icon(Icons.arrow_right),
                        ),
                      ),
                    ],
                  ),
                ),

                //7
                Card(
                  color: Color.fromARGB(255, 231, 233, 233),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.message),
                        title: Text('CTE306'),
                        subtitle: Text('Fifth Semester/csdd'),
                        trailing: InkWell(
                          onTap: () {
                            // Navigate to the new page here when the trailing icon is tapped.
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => YourNewPage()),
                            // );
                            print("Next page");
                          },
                          child: Icon(Icons.arrow_right),
                        ),
                      ),
                    ],
                  ),
                ),

                // Add more ListTiles as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsItem extends StatelessWidget {
  final leftSection = Container(
    child: const CircleAvatar(
      backgroundImage: NetworkImage(
          "https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg"),
      backgroundColor: Colors.lightGreen,
      radius: 40.0,
    ),
  );

  //second
  final middleSection = Expanded(
    child: Container(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: double
                .infinity, // Set the width to occupy the entire available space
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.0),
                borderRadius: BorderRadius.circular(10.0)),
            child: const Card(
              child: Text(
                "Pema Galey",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 0.5),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.0),
                borderRadius: BorderRadius.circular(10.0)),
            child: const Card(
              child: Text(
                "TeacherID:",
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
          ),
          SizedBox(height: 0.5),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.0),
                borderRadius: BorderRadius.circular(10.0)),
            child: const Card(
              child: Text(
                "College of Science and Technology",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 0.5),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.0),
                borderRadius: BorderRadius.circular(10.0)),
            child: const Card(
              child: Text(
                "Lecturer",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 0.5),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.0),
                borderRadius: BorderRadius.circular(10.0)),
            child: const Card(
              color: Colors.white,
              child: Text(
                "pemagalax123gmail.com",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      height: 180.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[leftSection, middleSection],
      ),
    );
  }
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

// //************************************  NavigationDrawer/side navigation starts  *********************************/
// class NavigationDrawerWidget extends StatelessWidget {
//   NavigationDrawerWidget({Key? key}) : super(key: key);
//   final padding = EdgeInsets.symmetric(horizontal: 20);
//   String name = 'Phurpa Tshering';
//   String email = '02210215.cst@rub.edu.bt';
//   String urlImage =
//       'https://unsplash.com/photos/Kt8eGw8_S8Y/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NXx8YW5pbWF0ZWQlMjBtYW58ZW58MHx8fHwxNjk2OTUzNTU5fDA&force=true'; //change the photo url

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Material(
//         color: Colors.blue,
//         child: ListView(
//           // padding: padding,
//           children: <Widget>[
//             buildHeader(
//                 urlImage: urlImage,
//                 name: name,
//                 email: email,
//                 onClicked: () => Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => UserPage(
//                           name: name,
//                           urlImage: urlImage,
//                         )))),
//             const SizedBox(height: 15),
//             buildSearchField(),
//             const SizedBox(height: 12),
//             buildMenuItem(
//               text: 'Profile',
//               icon: Icons.people,
//               onclicked: () => selectedItem(context, 0),
//             ),
//             const SizedBox(height: 12),
//             buildMenuItem(
//               text: 'Upload Result',
//               icon: Icons.upload,
//               onclicked: () => selectedItem(context, 1),
//             ),
//             const SizedBox(height: 16),
//             buildMenuItem(
//               text: 'View Result',
//               icon: Icons.message,
//               onclicked: () => selectedItem(context, 1),
//             ),

//             const SizedBox(height: 24),
//             const Divider(
//                 color: Colors.white70), //divider to create the section
//             const SizedBox(height: 24),
//             buildMenuItem(
//               text: 'Setting',
//               icon: Icons.settings,
//               //change the index
//               // onclicked: () => selectedItem(context, 0),
//             ),
//             const SizedBox(height: 16),
//             buildMenuItem(
//               text: 'Help',
//               icon: Icons.help,
//               // onclicked: () => ,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // buildheader
//   Widget buildHeader({
//     required String urlImage,
//     required String name,
//     required String email,
//     required VoidCallback onClicked,
//   }) =>
//       InkWell(
//           onTap: onClicked, // to navigate to the page by when we click on photo
//           child: Container(
//             padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                     radius: 30, backgroundImage: NetworkImage(urlImage)),
//                 SizedBox(width: 20),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       name,
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       email,
//                       style: TextStyle(fontSize: 14, color: Colors.white),
//                     ),
//                   ],
//                 ),
//                 //edit or plus icon==>> to add the functionalities of editing the details
//                 Spacer(),
//                 const CircleAvatar(
//                   radius: 2,
//                   backgroundColor: Color.fromRGBO(30, 68, 168, 1),
//                   child: Icon(Icons.add_comment_outlined, color: Colors.white),
//                 )
//               ],
//             ),
//           ));

//   //buildSearchField functions implementation
//   Widget buildSearchField() {
//     final color = Colors.white;

//     return TextField(
//       style: TextStyle(color: color),
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
//         hintText: 'Search',
//         hintStyle: TextStyle(color: color),
//         prefixIcon: Icon(Icons.search, color: color),
//         filled: true,
//         fillColor: Colors.white12,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//           borderSide: BorderSide(color: color.withOpacity(0.7)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//           borderSide: BorderSide(color: color.withOpacity(0.7)),
//         ),
//       ),
//     );
//   } //search functions ends

//   //build MenuItem
//   Widget buildMenuItem({
//     required String text,
//     required IconData icon,
//     VoidCallback? onclicked,
//   }) {
//     final Color = Colors.white;
//     final hoverColor = Colors.white70;

//     return ListTile(
//       leading: Icon(icon, color: Color),
//       title: Text(text, style: TextStyle(color: Color)),
//       hoverColor: hoverColor,
//       onTap: onclicked,
//     );
//   }

//   //selectItem method
//   void selectedItem(BuildContext context, int index) {
//     Navigator.of(context)
//         .pop(); /*to automatically close the drawer after tapping back button,
//         also if you want to include the navigation bar in other page simply paste drawer: NavigationDrawerWidget(), under the scaffold
//         */
//     switch (index) {
//       case 0:
//         Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => ProfilePage(),
//         ));
//         break;
//       case 1:
//         Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => UploadPage(),
//         ));
//         break;
//       //add here if you wish//==> to navigate to other pages add here
//     }
//   }
// }
// //************************************  NavigationDrawer/side navigation ends  *********************************/
