import 'package:flutter/material.dart';
import 'package:flutter_tes/pertemuan/pertemuan1.dart';
import 'package:flutter_tes/pertemuan/pertemuan2.dart';
import 'package:flutter_tes/pertemuan/pertemuan3.dart';
import 'package:flutter_tes/pertemuan/pertemuan4.dart';
import 'package:flutter_tes/pertemuan/pertemuan5.dart';
import 'package:flutter_tes/pertemuan/pertemuan6.dart';
import 'package:flutter_tes/pertemuan/pertemuan7.dart';
import 'package:flutter_tes/pertemuan/pertemuan8.dart';
import 'package:flutter_tes/pertemuan/pertemuan9.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Pertemuan1",
      "icon": Icons.auto_stories,
      "color": Colors.red,
      "page": HelloWorldPage(),
    },
    {
      "title": "Pertemuan2",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": WidgetButtonPage(),
    },
    {
      "title": "Pertemuan3",
      "icon": Icons.auto_stories,
      "color": Colors.green,
      "page": ScaffoldNavigatorPage(),
    },
    {
      "title": "Pertemuan4",
      "icon": Icons.auto_stories,
      "color": Colors.orange,
      "page": ToastDialogPage(),
    },
    {
      "title": "Pertemuan5",
      "icon": Icons.auto_stories,
      "color": Colors.grey,
      "page": ListviewPage(),
    },
    {
      "title": "Pertemuan6",
      "icon": Icons.auto_stories,
      "color": Colors.green,
      "page": CheckboxPage(),
    },
    {
      "title": "Pertemuan7",
      "icon": Icons.auto_stories,
      "color": Colors.orange,
      "page": RadioButtonPage(),
    },
    {
      "title": "Pertemuan8",
      "icon": Icons.auto_stories,
      "color": Colors.purple,
      "page": AutocompletespinPage(),
    },
    {
      "title": "Pertemuan9",
      "icon": Icons.auto_stories,
      "color": Colors.pink,
      "page": Pertemuan9Page(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: menuItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 170,
          ),
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return _buildMenuCard(
              context,
              title: item['title'],
              icon: item['icon'],
              color: item['color'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => item['page'],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.white,
      
      elevation: 5,
      shadowColor: Colors.black26,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon dengan background
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 40,
                  color: color,
                ),
              ),
              SizedBox(height: 15),

              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}