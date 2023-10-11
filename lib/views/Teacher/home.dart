import 'package:flutter/material.dart';
import 'userpage.dart';
import 'profile.dart';
import 'upload.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

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
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 400,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 500,
              width: 380,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 249, 250, 250),
                    Color.fromARGB(255, 247, 243, 243)
                  ]),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 166, 159, 159)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 214, 197, 147),
                      blurRadius: 25.0,
                    )
                  ]),
            ),
          ),
          Positioned(
            top: 0,
            right: 10,
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 9, 10, 9),
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 30,
              ),
            ),
          ),
          const Positioned(
            top: 30,
            left: 40,
            child: Text(
              "Phurpa Tshering",
              style: TextStyle(
                  color: Color.fromARGB(255, 3, 3, 3),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Positioned(
            top: 90,
            left: 40,
            child: Text(
              "StudentID:02210215",
              style: TextStyle(
                  color: Color.fromARGB(255, 11, 11, 11),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Positioned(
            top: 110,
            left: 40,
            child: Text(
              "3rd Year Student",
              style: TextStyle(
                  color: Color.fromARGB(255, 11, 11, 11),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Positioned(
            top: 130,
            left: 40,
            child: Text(
              "Department of Information Technology",
              style: TextStyle(
                  color: Color.fromARGB(255, 15, 14, 14),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            bottom: 55,
            left: 20,
            child: SizedBox(
              width: 300,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.phone),
                    Text(
                      "+975-17800681",
                      style: TextStyle(
                          color: Color.fromARGB(255, 15, 14, 14),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.email),
                    Text(
                      "p@gmail.com",
                      style: TextStyle(
                          color: Color.fromARGB(255, 14, 15, 15),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ]),
            ),
          ),
          const Positioned(
            right: 15,
            top: 45,
            child: Center(
              child: Icon(
                Icons.edit,
              ),
            ),
          )
        ],
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

class ViewResultScreen extends StatefulWidget {
  @override
  _ViewResultScreenState createState() => _ViewResultScreenState();
}

class _ViewResultScreenState extends State<ViewResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Card(
                color: Color.fromARGB(255, 159, 193, 227),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.message),
                      title: Text('CTE306'),
                      subtitle: Text('Fifth Semester/done'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        //additional button can be added here, if required!!
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            // <-- Icon
                            Icons.download,
                            size: 24.0,
                          ),
                          label: Text('Download'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //2
              Card(
                color: Color.fromARGB(255, 159, 193, 227),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.message),
                      title: Text('CTE306'),
                      subtitle: Text('Fifth Semester/done'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        //additional button can be added here, if required!!
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            // <-- Icon
                            Icons.download,
                            size: 24.0,
                          ),
                          label: Text('Download'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //3
              Card(
                color: Color.fromARGB(255, 159, 193, 227),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.message),
                      title: Text('CTE306'),
                      subtitle: Text('Fifth Semester/done'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        //additional button can be added here, if required!!
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            // <-- Icon
                            Icons.download,
                            size: 24.0,
                          ),
                          label: Text('Download'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //4
              Card(
                color: Color.fromARGB(255, 159, 193, 227),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.message),
                      title: Text('CTE306'),
                      subtitle: Text('Fifth Semester/done'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        //additional button can be added here, if required!!
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            // <-- Icon
                            Icons.download,
                            size: 24.0,
                          ),
                          label: Text('Download'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //5
              Card(
                color: Color.fromARGB(255, 159, 193, 227),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.message),
                      title: Text('CTE306'),
                      subtitle: Text('Fifth Semester/done'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        //additional button can be added here, if required!!
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            // <-- Icon
                            Icons.download,
                            size: 24.0,
                          ),
                          label: Text('Download'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //6
              Card(
                color: Color.fromARGB(255, 159, 193, 227),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.message),
                      title: Text('CTE306'),
                      subtitle: Text('Fifth Semester/done'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        //additional button can be added here, if required!!
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            // <-- Icon
                            Icons.download,
                            size: 24.0,
                          ),
                          label: Text('Download'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //7
              Card(
                color: Color.fromARGB(255, 159, 193, 227),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.message),
                      title: Text('CTE306'),
                      subtitle: Text('Fifth Semester/done'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        //additional button can be added here, if required!!
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            // <-- Icon
                            Icons.download,
                            size: 24.0,
                          ),
                          label: Text('Download'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //8
              Card(
                color: Color.fromARGB(255, 159, 193, 227),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.message),
                      title: Text('CTE306'),
                      subtitle: Text('Fifth Semester/done'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        //additional button can be added here, if required!!
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            // <-- Icon
                            Icons.download,
                            size: 24.0,
                          ),
                          label: Text('Download'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //9
              Card(
                color: Color.fromARGB(255, 159, 193, 227),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.message),
                      title: Text('CTE306'),
                      subtitle: Text('Fifth Semester/done'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        //additional button can be added here, if required!!
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            // <-- Icon
                            Icons.download,
                            size: 24.0,
                          ),
                          label: Text('Download'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //10
              Card(
                color: Color.fromARGB(255, 159, 193, 227),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.message),
                      title: Text('CTE306'),
                      subtitle: Text('Fifth Semester/done'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        //additional button can be added here, if required!!
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            // <-- Icon
                            Icons.download,
                            size: 24.0,
                          ),
                          label: Text('Download'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//************************************  ViewResult Screen  ends ************************************/

//************************************  NavigationDrawer/side navigation starts  *********************************/
class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final name = 'Phurpa Tshering';
  final email = '02210215.cst@rub.edu.bt';
  final urlImage =
      'https://unsplash.com/photos/Kt8eGw8_S8Y/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NXx8YW5pbWF0ZWQlMjBtYW58ZW58MHx8fHwxNjk2OTUzNTU5fDA&force=true'; //change the photo url

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromRGBO(58, 75, 205, 1),
        child: ListView(
          // padding: padding,
          children: <Widget>[
            buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserPage(
                          name: name,
                          urlImage: urlImage,
                        )))),
            const SizedBox(height: 12),
            buildSearchField(),
            const SizedBox(height: 24),

            buildMenuItem(
              text: 'Profile',
              icon: Icons.people,
              onclicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Upload Result',
              icon: Icons.upload,
              onclicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'View Result',
              icon: Icons.message,
              onclicked: () => selectedItem(context, 1),
            ),

            const SizedBox(height: 24),
            Divider(color: Colors.white70), //divider to create the section
            const SizedBox(height: 24),
            buildMenuItem(
              text: 'Setting',
              icon: Icons.settings,
              //change the index
              // onclicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Help',
              icon: Icons.help,
            ),
          ],
        ),
      ),
    );
  }

  //buildheader
  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
          onTap: onClicked, // to navigate to the page by when we click on photo
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30, backgroundImage: NetworkImage(urlImage)),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                //edit or plus icon==>> to add the functionalities of editing the details
                Spacer(),
                CircleAvatar(
                  radius: 2,
                  backgroundColor: Color.fromRGBO(30, 68, 168, 1),
                  child: Icon(Icons.add_comment_outlined, color: Colors.white),
                )
              ],
            ),
          ));

  //buildSearchField functions implementation
  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  } //search functions ends

  //build MenuItem
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onclicked,
  }) {
    final Color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: Color),
      title: Text(text, style: TextStyle(color: Color)),
      hoverColor: hoverColor,
      onTap: onclicked,
    );
  }

  //selectItem method
  void selectedItem(BuildContext context, int index) {
    Navigator.of(context)
        .pop(); /*to automatically close the drawer after tapping back button,
        also if you want to include the navigation bar in other page simply paste drawer: NavigationDrawerWidget(), under the scaffold
        */
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UploadPage(),
        ));
        break;
      //add here if you wish//==> to navigate to other pages add here
    }
  }
}
//************************************  NavigationDrawer/side navigation ends  *********************************/
