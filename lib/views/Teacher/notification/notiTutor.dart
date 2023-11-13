import 'package:examcellapp/views/Examcell/utility.dart';
import 'package:examcellapp/views/Teacher/notification/tutorNotitification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class notiTutor extends StatefulWidget {
  const notiTutor({super.key});

  @override
  State<notiTutor> createState() => _AnnouncementMainState();
}

class _AnnouncementMainState extends State<notiTutor> {
  List<Map<String, dynamic>> data = [
  {
    "tid": "RUB201204006",
    "code": "CTE306",
    "date": "2023-11-30"
  },
  {
    "tid": "RUB201204006",
    "code": "CTE306",
    "date": "2023-11-30"
  },
  {
    "tid": "RUB201204006",
    "code": "CTE306",
    "date": "2023-11-30"
  },
  {
    "tid": "RUB201204006",
    "code": "CTE306",
    "date": "2023-11-30"
  }
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
        future: getRemider(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: SpinKitChasingDots(color: Colors.blue));
          } else {
            if(snapshot.hasData) {
              List<Map<String, dynamic>> data = snapshot.data as List<Map<String, dynamic>>;
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
                      
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.blue,
                              width: 20.0,
                            )
                          )
                        ),
                        child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item["tid"],
                                    style: const TextStyle(
                                      fontSize: 14, 
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text(
                                    "Marksheet Pending for ${item["code"]}",
                                    style: const TextStyle(
                                      fontSize: 14, 
                                      color: Color.fromARGB(183, 0, 0, 0),
                                      fontWeight: FontWeight.w300),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Please Submit on or Before ${item["date"]}",
                                    style: const TextStyle(fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ],
                        ),
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
