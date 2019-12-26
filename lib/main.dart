import 'package:booksy/src/booksCategories/bloc/books_categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksy/src/home/home_page.dart';

void main() => runApp(MaterialApp(
      title: "Booksy",
      home: BlocProvider<BooksCategoriesBloc>(
        bloc: BooksCategoriesBloc(),
        child: HomePage(),
      ),
    ));
