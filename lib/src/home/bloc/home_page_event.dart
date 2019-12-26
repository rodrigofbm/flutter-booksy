import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class HomePageEvent extends Equatable {
  HomePageEvent([List temp = const []]) : super(temp);
}

class HomePageEventSearch extends HomePageEvent {
  final String query;

  HomePageEventSearch({@required this.query});

  @override
  String toString() => "HomePageEventSearch";
}
