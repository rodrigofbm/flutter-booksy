import 'package:booksy/widgets/book_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _categories = [
    "Android",
    "Java",
    "História",
    "Ciências",
    "Natureza",
    "Engenharia",
    "Lazer"
  ];

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 24),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Text(
                      "Browse",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Recommended",
                    style: TextStyle(
                        color: Colors.grey[400], fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildListCategories(_categories, _selectedIndex),
              buildListBooks(_categories, context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildListBooks(categories, context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return BookWidget();
      },
    ),
  );
}

Widget buildListCategories(categories, selectedIndex) {
  return Container(
    height: 80,
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 8, left: 8),
          child: GestureDetector(
            onTap: () {
              selectedIndex = index;
            },
            child: buildChip(categories, index, selectedIndex),
          ),
        );
      },
    ),
  );
}

Widget buildChip(_categorys, index, _selectedIndex) {
  return Chip(
    backgroundColor: index == _selectedIndex ? Colors.blue : Colors.grey[200],
    padding: EdgeInsets.only(right: 20, left: 20),
    label: Text(
      _categorys[index],
      style: TextStyle(
          fontSize: 12,
          color: index == _selectedIndex ? Colors.white : Colors.grey),
    ),
  );
}
