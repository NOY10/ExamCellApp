import 'package:examcellapp/views/Teacher/notification/tutorNotitification.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: AnnouncementMain(),
  ));
}

class AnnouncementMain extends StatefulWidget {
  const AnnouncementMain({super.key});

  @override
  State<AnnouncementMain> createState() => _AnnouncementMainState();
}

class _AnnouncementMainState extends State<AnnouncementMain> {
  List<Map<String, dynamic>> data = [
    {
      "tid": "RUB201204006",
      "mid": "CTE306",
      "date": "2023-11-07 14:44:59",
      "semester": "AS2023",
      "Time(Notification.date)": "14:44:59",
    },
    {
      "tid": "RUB201204006",
      "mid": "CTE306",
      "date": "2023-11-07 14:44:23",
      "semester": "AS2023",
      "Time(Notification.date)": "14:44:23",
    },
    {
      "tid": "123",
      "mid": "123",
      "date": "2023-11-07 00:00:00",
      "semester": "AS2023",
      "Time(Notification.date)": "00:00:00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Notification",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: receiveNotifications(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          } else {
            if(snapshot.hasData) {
              List<Map<String, dynamic>> data = snapshot.data as List<Map<String, dynamic>>;
              print(data);
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Notis(data),
              );
            }else {
                return Text('No data');
              }
          }
        } 
      ),
    );
  }

  ListView Notis(List<Map<String, dynamic>> data) {
    return ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = data[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffcccccc),
                          width: 1,
                        )
                      )
                    ),
                    
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item["mid"],
                                style: const TextStyle(fontSize: 12, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Mobile Application Development",
                                style: const TextStyle(fontSize: 12, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Submitted on ${item["Time(Notification.date)"]}",
                                style: const TextStyle(fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ],
                    ),
                  );
                },
              );
  }
}

class Announcement extends StatelessWidget {
  final String mCode, mName, date;
  const Announcement({
    required this.mCode,
    required this.mName,
    required this.date,
  });

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
