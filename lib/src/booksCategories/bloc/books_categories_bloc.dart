import 'package:bloc/bloc.dart';
import 'package:booksy/src/booksCategories/bloc/books_categories_event.dart';
import 'package:booksy/src/booksCategories/bloc/books_categories_state.dart';

class BooksCategoriesBloc
    extends Bloc<BooksCategoriesEvent, BooksCategoriesState> {
  @override
  BooksCategoriesState get initialState =>
      BooksCategoriesStateInitial(index: 0, value: "");

  @override
  Stream<BooksCategoriesState> mapEventToState(
      BooksCategoriesEvent event) async* {
    if (event is BooksCategoriesStateInitial) {
      yield BooksCategoriesStateInitial(index: 0, value: "");
    }

    if (event is BooksCategoriesSelect) {
      yield BooksCategoriesChangeState(index: event.index, value: event.value);
    }
  }
}
