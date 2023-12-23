import 'package:flutter/material.dart';
import 'package:riotters/pages/team_folder.dart';

class ProjectPage extends StatefulWidget {
  String? title;
  String? subtitle;
  ProjectPage({super.key, this.title, this.subtitle});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<String> folderNames = [
    "Assets",
    "Design",
    "Documents",
    "Images",
    "Videos",
    "Assets",
    "Design",
    "Documents",
    "Images",
    "Videos",
    "Assets",
    "Design",
  ];
  List<bool> newNotifications = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    var availableScreenWidth;
    availableScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          buildNavBar(
            title: widget.title,
            subttile: "Project",
            icon: Icon(Icons.share),
            backgroundColor: Colors.grey.shade300,
            iconColor: Colors.blue,
            backgroundIconColor: Colors.grey.shade200,
            textColor: Colors.black,
          ),
          Divider(
            height: 20,
          ),
          Container(
            height: 130,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                3,
                (index) {
                  List<String> names = ["Adam", "Alie", "Adam"];
                  List<String> images = [
                    "assets/images/adam.jpeg",
                    "assets/images/alie.jpeg",
                    "assets/images/adam.jpeg",
                  ];
                  return buildAvatar(names[index], images[index]);
                },
              ),
            ),
          ),
          Divider(
            height: 20,
            thickness: 1,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Files",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Create",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: List.generate(folderNames.length, (index) {
                    return buildProjectColumn(folderNames[index],
                        newNotifications[index], index, availableScreenWidth);
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildProjectColumn(String folderName, bool newNotification, int index,
      availableScreenWidth) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 65,
          width: availableScreenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Icon(Icons.folder, color: Colors.blue),
                      if (newNotification)
                        Positioned(
                          right: 0,
                          top: 2,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: CircleAvatar(
                              radius: 3.5,
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    folderName,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    // show dialog with option delete or rename
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Delete or Rename"),
                          content: Text("Choose one of the options below"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  folderNames.removeAt(index);
                                  newNotifications.removeAt(index);
                                });
                                Navigator.pop(context);
                              },
                              child: Text("Delete"),
                            ),
                            TextButton(
                              onPressed: () {
                                TextEditingController controller =
                                    TextEditingController();
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Rename Folder"),
                                      content: TextField(
                                        controller: controller,
                                        decoration: InputDecoration(
                                          labelText: "New name",
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              folderNames[index] =
                                                  controller.text;
                                            });
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text("Rename"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.more_vert_rounded, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildAvatar(String name, String imageP) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: Image.asset(imageP).image),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
