import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final imageUrl = "https://webmeup.com/upload/blog/lead-image-105.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 15, 24, 15),
      width: 200,
      height: 200,
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                  width: 180,
                ),
              )),
          Align(
            alignment: Alignment.centerLeft,
            child: buildPreviewInfoCard(),
          )
        ],
      ),
    );
  }
}

Widget buildPreviewInfoCard() {
  return Container(
    padding: EdgeInsets.all(24),
    width: 150,
    height: 160,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          "Book Title",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "book author",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        )
      ],
    ),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            spreadRadius: 3,
          )
        ]),
  );
}
