import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class BooksCategoriesEvent extends Equatable {
  BooksCategoriesEvent([List temp = const []]) : super(temp);
}

class BooksCategoriesSelect extends BooksCategoriesEvent {
  final int index;
  final String value;

  BooksCategoriesSelect({@required this.index, @required this.value});

  @override
  String toString() => "BooksCategoriesSelected";
}
