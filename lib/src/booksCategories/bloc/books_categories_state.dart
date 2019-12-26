import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class BooksCategoriesState extends Equatable {
  BooksCategoriesState([List temp = const []]) : super(temp);
}

class BooksCategoriesStateInitial extends BooksCategoriesState {
  final int index;
  final String value;

  BooksCategoriesStateInitial({@required this.index, @required this.value});

  @override
  String toString() => "BooksCategoriesStateInitial";
}

class BooksCategoriesChangeState extends BooksCategoriesState {
  final int index;
  final String value;

  BooksCategoriesChangeState({@required this.index, @required this.value});

  @override
  String toString() => "BooksCategoriesStateChange";
}
