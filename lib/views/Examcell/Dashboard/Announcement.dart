import 'package:flutter/material.dart';

class AnnouncementMain extends StatelessWidget {
  const AnnouncementMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // Border color
              width: 2.0, // Border width
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Announcement',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap:
                      true, // Allows the ListView to adjust to content height.
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 235, 235),
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Announcement(
                            mCode: 'CTE306',
                            mName: "Mobile Application Development",
                            date: "12/10/2023"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 235, 235),
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Announcement(
                            mCode: 'CTE306',
                            mName: "Mobile Application Development",
                            date: "12/10/2023"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 235, 235),
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Announcement(
                            mCode: 'CTE306',
                            mName: "Mobile Application Development",
                            date: "12/10/2023"),
                      ),
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

class Announcement extends StatelessWidget {
  final String mCode, mName, date;
  const Announcement(
      {required this.mCode, required this.mName, required this.date});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 50.0,
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mCode,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
              Text(
                mName,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Text(
              date,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
