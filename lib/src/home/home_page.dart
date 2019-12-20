import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _categorys = [
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Text(
                    "Browse",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("Recommended"),
              ],
            ),
            Container(
              height: 80,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _categorys.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: GestureDetector(
                      onTap: () {
                        _selectedIndex = index;
                      },
                      child: Chip(
                        backgroundColor: index == _selectedIndex
                            ? Colors.blue
                            : Colors.grey[200],
                        padding: EdgeInsets.only(right: 20, left: 20),
                        label: Text(
                          _categorys[index],
                          style: TextStyle(
                              color: index == _selectedIndex
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
