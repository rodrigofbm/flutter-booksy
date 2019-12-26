import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:booksy/repository.dart';
import 'package:booksy/src/home/bloc/home_page_event.dart';
import 'package:booksy/src/home/bloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final Repository repository;

  HomePageBloc({@required this.repository});

  @override
  HomePageState get initialState => HomePageStateLoading();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is HomePageEventSearch) {
      yield HomePageStateLoading();

      //var query = event.query;
      var booksResult = await repository.getBooks();

      yield booksResult;
    }
  }
}
