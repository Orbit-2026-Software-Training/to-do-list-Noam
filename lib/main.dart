// ignore_for_file: body_might_complete_normally_nullable, strict_top_level_inference, annotate_overrides, camel_case_types, use_key_in_widget_constructors
import 'package:flutter/material.dart';

List<String> title = ["do the dishes"];
List<String> describtion = ["you will need to do dishes"];
List<String> date = ["2026-10-18"];
List<String> prioratyList = ["High"];
String prioraty = "";
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
  void deleteButton(index) {
    setState(() {
      title.removeAt(index);
      describtion.removeAt(index);
      date.removeAt(index);
    });
  }

  Widget build(BuildContext context) {
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
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
                                      describtion[index],
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
  void saveButton() {
    setState(() {
      String descriptionFromController = descriptionController.text.trim();
      String dateFromController = pickedDate;
      String titleFromController = titleController.text.trim();
      if (descriptionFromController.isNotEmpty &&
          titleFromController.isNotEmpty &&
          dateFromController.isNotEmpty &&
          prioraty.isNotEmpty) {
        date.add(dateFromController);
        title.add(titleFromController);
        describtion.add(descriptionFromController);
        prioratyList.add(prioraty);
        Navigator.pop(context);
      } else {
        text = "pls fill all the info!";
      }
    });
  }

  void lowpriorty() {
    prioraty="Low";
  }

  void mediumpriorty() {
    prioraty="Medium";
  }

  void highpriorty() {
    prioraty="High";
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
                      pickedDate = selectedDate.toString().split(' ')[0];
                    }
                  },
                  child: const Text('Select Date'),
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
                ElevatedButton(onPressed: lowpriorty, child: Text("Low")),
                SizedBox(width: 20),
                ElevatedButton(onPressed: mediumpriorty, child: Text("Medium")),
                SizedBox(width: 20),
                ElevatedButton(onPressed: highpriorty, child: Text("High")),
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
