import 'package:flutter/material.dart';

class GradeCalculate extends StatefulWidget {
  GradeCalculate({super.key});

  @override
  State<GradeCalculate> createState() => _GradeCalculateState();
}

class _GradeCalculateState extends State<GradeCalculate> {
  final controller = TextEditingController();

  String resultgrade = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("The GPA Calculator")),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 249, 68, 255),
                  filled: true,
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 243, 33, 187))),
                  hintText: ("Please Type your Score"),
                  prefixIcon: Icon(Icons.percent),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                child: Text("Press To Calculate"),
                onPressed: () {
                  setState(() {
                    int? grade = int.tryParse(controller.text);
                    if (grade == null) {
                      String resultgrade;
                      return;
                    }

                    if (grade >= 90) {
                      resultgrade = "A";
                    } else if (grade >= 80) {
                      resultgrade = "B";
                    } else if (grade >= 70) {
                      resultgrade = "C";
                    } else if (grade >= 60) {
                      resultgrade = "D";
                    } else {
                      resultgrade = "F";
                    }
                    controller.clear();
                  });
                },
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  resultgrade,
                  style: TextStyle(
                      fontSize: 150, color: Color.fromARGB(255, 9, 8, 8)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
