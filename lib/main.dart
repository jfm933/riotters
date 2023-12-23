import 'package:flutter/material.dart';
import 'package:riotters/pages/team_folder.dart';

void main() {
  runApp(const CloudFileManagerUI());
}

class CloudFileManagerUI extends StatelessWidget {
  const CloudFileManagerUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud File Manager',
      debugShowCheckedModeBanner: false,
      home:  TeamFolderPage());
  }
}