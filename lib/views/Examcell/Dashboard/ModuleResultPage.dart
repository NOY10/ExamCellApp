import 'package:flutter/material.dart';

class ModuleResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    final String moduleName = args?['moduleName'] ?? 'No Module Name';
    final String moduleCode = args?['moduleCode'] ?? 'No Module Code';

    return Scaffold(
      appBar: AppBar(
        title: Text('Module Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Module Name: $moduleName',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Module Code: $moduleCode',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
