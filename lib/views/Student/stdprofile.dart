import 'package:flutter/material.dart';

final List<String> accountDetail = [
  'Tshering Norphel',
  '02210233',
  'BE Information Technology',
  'Year Third'
];

final List<String> perDetail = [
  '10710002711',
  '21/09/2001',
  'Male',
  '02210233.cst@rub.edu.bt'
];

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});
  final rectColor = 0xFFE7E6E6;
  final textColor = 0xFF1A1717;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          profilePicture(), 
          banner(context), //the rectangle which displays current semester
          accDetail(context),
          personalDetail(context)
        ],
      ),
    );
  }

  Container personalDetail(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Detail',
                    style: TextStyle(
                      color: Color(textColor),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: perDetail.length,
                    itemBuilder: (context, index) => Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          perDetail [index],
                          style: TextStyle(
                            color: Color(textColor),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(height: 8,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

  Container accDetail(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account Detail',
                    style: TextStyle(
                      color: Color(textColor),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: accountDetail.length,
                    itemBuilder: (context, index) => Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          accountDetail [index],
                          style: TextStyle(
                            color: Color(textColor),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(height: 8,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

  Padding banner(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Color(rectColor),
            child: Center(
              child: Text(
                'Second Semester of Academic year 2023',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(textColor),
                ),
              ),
            ),
          ),
        );
  }

  Padding profilePicture() {
    return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset('assets/images/profile_picture.jpeg',
              height: 120,
              width: 120,),
            ),
          ),
        );
  }
}