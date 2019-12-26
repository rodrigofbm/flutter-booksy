import 'package:booksy/repository.dart';
import 'package:booksy/src/booksCategories/books_categories.dart';
import 'package:booksy/src/home/bloc/home_page_bloc.dart';
import 'package:booksy/src/home/bloc/home_page_event.dart';
import 'package:booksy/src/home/bloc/home_page_state.dart';
import 'package:booksy/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final HomePageBloc _bloc = new HomePageBloc(repository: Repository());

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
    _bloc.dispatch(HomePageEventSearch(query: ""));

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
              BooksCategories(),
              BlocBuilder<HomePageEvent, HomePageState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is HomePageStateLoading)
                    return Center(child: CircularProgressIndicator());
                  if (state is HomePageStateError)
                    return Center(
                      child: Text(state.message),
                    );

                  if (state is HomePageStateSuccess)
                    return buildListBooks(_categories, context, state.books);

                  return SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildListBooks(categories, context, books) {
  return Container(
      height: MediaQuery.of(context).size.height,
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: books.length,
          itemBuilder: (context, index) {
            return BookWidget(book: books[index]);
          },
        ),
      ));
}
