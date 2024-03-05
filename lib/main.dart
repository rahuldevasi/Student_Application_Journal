import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StudentListPage(),
    );
  }
}

class StudentListPage extends StatelessWidget {
  final List<Student> students = [
    Student(
        name: 'Rajpal Patel',
        age: 20,
        grade: 'A',
        rollNumber: '001',
        photoAsset: 'assets/icon/01.jpg'),
    Student(
        name: 'Sahil Khan',
        age: 21,
        grade: 'B',
        rollNumber: '002',
        photoAsset: 'assets/icon/02.jpg'),
    Student(
        name: 'Bavesh Patel',
        age: 21,
        grade: 'B',
        rollNumber: '003',
        photoAsset: 'assets/icon/03.jpg'),
    Student(
        name: 'Chandresh Modi',
        age: 21,
        grade: 'B',
        rollNumber: '004',
        photoAsset: 'assets/icon/04.jpg'),
    Student(
        name: 'Jash Tanna',
        age: 21,
        grade: 'B',
        rollNumber: '005',
        photoAsset: 'assets/icon/05.jpg'),
    Student(
        name: 'Yash Vadher',
        age: 21,
        grade: 'B',
        rollNumber: '006',
        photoAsset: 'assets/icon/06.jpg'),
    Student(
        name: 'Ankit Singh',
        age: 21,
        grade: 'B',
        rollNumber: '007',
        photoAsset: 'assets/icon/07.jpg'),
    Student(
        name: 'Bhavesh Joshi',
        age: 19,
        grade: 'C',
        rollNumber: '008',
        photoAsset: 'assets/icon/01.jpg'),
    Student(
        name: 'Ram Patel',
        age: 19,
        grade: 'D',
        rollNumber: '009',
        photoAsset: 'assets/icon/02.jpg'),
    Student(
        name: 'Tirth Shah',
        age: 20,
        grade: 'B',
        rollNumber: '010',
        photoAsset: 'assets/icon/03.jpg'),
    Student(
        name: 'Sharad Lakadawala',
        age: 22,
        grade: 'A',
        rollNumber: '011',
        photoAsset: 'assets/icon/04.jpg'),
  ];

  StudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Center(child: Text('SDJ International College')),
        ),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 233, 235, 237),
                  Color.fromARGB(255, 165, 165, 168)
                ],
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(3, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(students[index].photoAsset),
              ),
              title: Text(students[index].name),
              subtitle: Text('Roll Number: ${students[index].rollNumber}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StudentDetailPage(student: students[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class StudentDetailPage extends StatelessWidget {
  final Student student;

  const StudentDetailPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(3.0),
          child: Text('Student Detail'),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 199, 200, 201),
              Color.fromARGB(255, 165, 165, 168)
            ],
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(3, 3),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(student.photoAsset),
                radius: 50,
              ),
              const SizedBox(height: 20),
              Text('Name: ${student.name}'),
              Text('Roll Number: ${student.rollNumber}'),
              Text('Age: ${student.age}'),
              Text('Grade: ${student.grade}'),
              const Text('University/College: SDJ International College'),
            ],
          ),
        ),
      ),
    );
  }
}

class Student {
  final String name;
  final int age;
  final String grade;
  final String rollNumber;
  final String photoAsset;

  Student(
      {required this.name,
      required this.age,
      required this.grade,
      required this.rollNumber,
      required this.photoAsset});
}
