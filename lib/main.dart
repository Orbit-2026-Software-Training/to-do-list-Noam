// ignore_for_file: body_might_complete_normally_nullable, strict_top_level_inference, annotate_overrides, camel_case_types, use_key_in_widget_constructors
import 'package:flutter/material.dart';

String showingDate = "";
List<String> title = ["do the dishes"];
List<String> description = ["you will need to do dishes"];
List<String> date = ["2026-12-19"];
List<String> prioratyList = ["High"];
List<String> copyOfTitle = ["do the dishes"];
List<String> copyOfDescription = ["you will need to do dishes"];
List<String> copyOfDate = ["2026-12-19"];
List<String> copyOfPrioraty = ["High"];
List<String> copyOfCategorys = ["home"];
String date1 = "pls fill the date";

enum categorys { robotics, home, school }

List<String> listOfCategorys = ["home"];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'to do list',

      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  toDoListScreen createState() => toDoListScreen();
}

class toDoListScreen extends State<HomeScreen> {
  List<String> sortingTitle = [];
  List<String> sortingDescription = [];
  List<String> sortingDate = [];
  List<String> sortingPrioraty = [];
  List<String> viewPrioraty = [];
  List<String> sortingCatecorys = [];
  void sorting() {
    setState(() {
        sortingTitle.clear();
        sortingDescription.clear();
        sortingDate.clear();
        sortingPrioraty.clear();
        viewPrioraty.clear();
        sortingCatecorys.clear();
        for (int i = 0; i < title.length; i++) {
          sortingPrioraty.add(prioratyList[i]);
        }
        for (int i = 0; i < sortingPrioraty.length; i++) {
          if (sortingPrioraty[i] == "High") {
            sortingTitle.add(title[i]);
            sortingDescription.add(description[i]);
            sortingDate.add(date[i]);
            viewPrioraty.add(sortingPrioraty[i]);
            sortingCatecorys.add(listOfCategorys[i]);
          }
        }
        for (int i = 0; i < sortingPrioraty.length; i++) {
          if (sortingPrioraty[i] == "Medium") {
            sortingTitle.add(title[i]);
            sortingDescription.add(description[i]);
            sortingDate.add(date[i]);
            viewPrioraty.add(sortingPrioraty[i]);
            sortingCatecorys.add(listOfCategorys[i]);
          }
        }
        for (int i = 0; i < sortingPrioraty.length; i++) {
          if (sortingPrioraty[i] == "Low") {
            sortingTitle.add(title[i]);
            sortingDescription.add(description[i]);
            sortingDate.add(date[i]);
            viewPrioraty.add(sortingPrioraty[i]);
            sortingCatecorys.add(listOfCategorys[i]);
          }
        }
        prioratyList.clear();
        title.clear();
        description.clear();
        date.clear();
        listOfCategorys.clear();
        for (int i = 0; i < sortingPrioraty.length; i++) {
          title.add(sortingTitle[i]);
          description.add(sortingDescription[i]);
          date.add(sortingDate[i]);
          prioratyList.add(viewPrioraty[i]);
          listOfCategorys.add(sortingCatecorys[i]);
        }
      
    });
  }

  void deleteButton(index) {
    setState(() {
      title.removeAt(index);
      description.removeAt(index);
      date.removeAt(index);
      listOfCategorys.removeAt(index);
      prioratyList.removeAt(index);
      copyOfTitle.removeAt(index);
      copyOfDescription.removeAt(index);
      copyOfDate.removeAt(index);
      copyOfCategorys.removeAt(index);
      copyOfPrioraty.removeAt(index);
    });
  }

  void filter() {
    title.clear();
    description.clear();
    date.clear();
    prioratyList.clear();
    listOfCategorys.clear();
    if (dropdownValue == 'all tasks') {
      int i = 0;
      while (i < copyOfCategorys.length) {
        title.add(copyOfTitle[i]);
        description.add(copyOfDescription[i]);
        date.add(copyOfDate[i]);
        prioratyList.add(copyOfPrioraty[i]);
        listOfCategorys.add(copyOfCategorys[i]);

        i++;
      }
    }

    if (dropdownValue == "robotics") {
      int i = 0;
      while (i < copyOfCategorys.length) {
        if (copyOfCategorys[i] == "robotics") {
          title.add(copyOfTitle[i]);
          description.add(copyOfDescription[i]);
          date.add(copyOfDate[i]);
          prioratyList.add(copyOfPrioraty[i]);
          listOfCategorys.add(copyOfCategorys[i]);
        }
        i++;
      }
    }
    if (dropdownValue == "home") {
      int i = 0;
      while (i < copyOfCategorys.length) {
        if (copyOfCategorys[i] == "home") {
          title.add(copyOfTitle[i]);
          description.add(copyOfDescription[i]);
          date.add(copyOfDate[i]);
          prioratyList.add(copyOfPrioraty[i]);
          listOfCategorys.add(copyOfCategorys[i]);
        }
        i++;
      }
    }
    if (dropdownValue == "school") {
      int i = 0;
      while (i < copyOfCategorys.length) {
        if (copyOfCategorys[i] == "school") {
          title.add(copyOfTitle[i]);
          description.add(copyOfDescription[i]);
          date.add(copyOfDate[i]);
          prioratyList.add(copyOfPrioraty[i]);
          listOfCategorys.add(copyOfCategorys[i]);
        }
        i++;
      }
    }
  }

  String dropdownValue = 'all tasks';
  Widget build(BuildContext context) {
    sorting();
    return Scaffold(
      appBar: AppBar(
        title: Text("to do list"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.grey],
          ),
        ),

        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addingScreen()),
                );
                setState(() {});
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: title.isEmpty
                  ? Center(
                      child: Text(
                        "No tasks yet",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: title.length,

                      itemBuilder: (BuildContext context, int index) {
                        if (index < title.length) {
                          if (title.isNotEmpty) {
                            return Card(
                              color: Colors.black12,
                              child: ListTile(
                                title: Text(
                                  title[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      description[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      prioratyList[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      listOfCategorys[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                leading: Text(
                                  date[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: ElevatedButton(
                                  onPressed: () {
                                    deleteButton(index);
                                  },
                                  child: Icon(Icons.delete),
                                ),
                              ),
                            );
                          }
                        }
                      },
                    ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  filter();
                });
              },
              items: <String>['all tasks', 'robotics', 'home', 'school']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class addingScreen extends StatefulWidget {
  @override
  addingPage createState() => addingPage();
}

class addingPage extends State<addingScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String text = "";
  String pickedDate = "";
  String prioraty = "";
  String category = "";
  int prioratyColor = 0;
  int categorysColor = 0;
  void saveButton() {
    setState(() {
      String descriptionFromController = descriptionController.text.trim();
      String dateFromController = pickedDate;
      String titleFromController = titleController.text.trim();
      List<String> splitList = [];
      if (descriptionFromController.isNotEmpty &&
          titleFromController.isNotEmpty &&
          dateFromController.isNotEmpty &&
          prioraty.isNotEmpty &&
          category.isNotEmpty) {
        date.add(dateFromController);
        title.add(titleFromController);
        description.add(descriptionFromController);
        prioratyList.add(prioraty);
        listOfCategorys.add(category);
        copyOfTitle.add(titleFromController);
        copyOfDescription.add(descriptionFromController);
        copyOfDate.add(dateFromController);
        copyOfPrioraty.add(prioraty);
        copyOfCategorys.add(category);
        int i = 0;
        while (i < copyOfCategorys.length) {
          if (copyOfCategorys[i] == "categorys.school") {
            splitList = copyOfCategorys[i].split(".");
            int j = 0;
            while (j < splitList.length) {
              if (splitList[j] == "categorys") {
                splitList.removeAt(j);
                copyOfCategorys.removeLast();
                listOfCategorys.removeLast();
                copyOfCategorys.add(splitList[0]);
                listOfCategorys.add(splitList[0]);
              }
              j++;
            }
          }
          if (copyOfCategorys[i] == "categorys.home") {
            splitList = copyOfCategorys[i].split(".");
            int j = 0;
            while (j < splitList.length) {
              if (splitList[j] == "categorys") {
                splitList.removeAt(j);
                copyOfCategorys.removeLast();
                listOfCategorys.removeLast();
                copyOfCategorys.add(splitList[0]);
                listOfCategorys.add(splitList[0]);
              }
              j++;
            }
          }
          if (copyOfCategorys[i] == "categorys.robotics") {
            splitList = copyOfCategorys[i].split(".");
            int j = 0;
            while (j < splitList.length) {
              if (splitList[j] == "categorys") {
                splitList.removeAt(j);
                copyOfCategorys.removeLast();
                listOfCategorys.removeLast();
                copyOfCategorys.add(splitList[0]);
                listOfCategorys.add(splitList[0]);
              }
              j++;
            }
          }
          i++;
        }

        Navigator.pop(context);
        date1 = "pls fill the date";
      } else {
        text = "pls fill all the info!";
      }
    });
  }

  void lowpriorty() {
    setState(() {
      prioraty = "Low";
      prioratyColor = 1;
    });
  }

  void mediumpriorty() {
    setState(() {
      prioraty = "Medium";
      prioratyColor = 2;
    });
  }

  void highpriorty() {
    setState(() {
      prioraty = "High";
      prioratyColor = 3;
    });
  }

  void roboticsCategory() {
    setState(() {
      category = categorys.robotics.toString();
      categorysColor = 1;
    });
  }

  void homeCategory() {
    setState(() {
      category = categorys.home.toString();
      categorysColor = 2;
    });
  }

  void schoolCategory() {
    setState(() {
      category = categorys.school.toString();
      categorysColor = 3;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("adding page"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.grey],
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "title:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Expanded(
                  child: TextField(
                    controller: titleController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "description:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Expanded(
                  child: TextField(
                    controller: descriptionController,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "date:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        pickedDate = selectedDate.toString().split(' ')[0];
                        date1 = pickedDate;
                      });
                    }
                  },
                  child: const Text('Select Date'),
                ),
                SizedBox(width: 15),

                Text(
                  "date: $date1",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "prioraty:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: prioratyColor == 1
                        ? Colors.white70
                        : Colors.white,
                  ),
                  onPressed: lowpriorty,
                  child: Text("Low"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: prioratyColor == 2
                        ? Colors.white70
                        : Colors.white,
                  ),
                  onPressed: mediumpriorty,
                  child: Text("Medium"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: prioratyColor == 3
                        ? Colors.white70
                        : Colors.white,
                  ),
                  onPressed: highpriorty,
                  child: Text("High"),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "categorys:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: categorysColor == 1
                        ? Colors.white70
                        : Colors.white,
                  ),
                  onPressed: roboticsCategory,
                  child: Text("Robotics"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: categorysColor == 2
                        ? Colors.white70
                        : Colors.white,
                  ),
                  onPressed: homeCategory,
                  child: Text("Home"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: categorysColor == 3
                        ? Colors.white70
                        : Colors.white,
                  ),
                  onPressed: schoolCategory,
                  child: Text("School"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: saveButton, child: const Text("save")),
            const SizedBox(height: 60),
            Text(text, style: TextStyle(fontSize: 30, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
