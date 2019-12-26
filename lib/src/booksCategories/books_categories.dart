import 'package:booksy/src/booksCategories/bloc/books_categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/books_categories_event.dart';

class BooksCategories extends StatelessWidget {
  final BooksCategoriesBloc _bloc = new BooksCategoriesBloc();
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
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          return Container(
            height: 80,
            child: ListView.builder(
              itemCount: _categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  child: GestureDetector(
                    onTap: () {
                      print("tap");
                      _bloc.dispatch(BooksCategoriesSelect(
                          index: index, value: _categories[index]));
                    },
                    child: buildChip(_categories, index, state.index),
                  ),
                );
              },
            ),
          );
        });
  }
}

Widget buildChip(_categorys, index, selectedIndex) {
  return Chip(
    backgroundColor: index == selectedIndex ? Colors.blue : Colors.grey[200],
    padding: EdgeInsets.only(right: 20, left: 20),
    label: Text(
      _categorys[index],
      style: TextStyle(
        fontSize: 12,
        color: index == selectedIndex ? Colors.white : Colors.grey,
      ),
    ),
  );
}
