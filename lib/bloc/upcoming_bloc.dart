import '../Model/upcoming_model.dart';
import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _repository = Repository();

  //StreamController
  final _upComingMovieFetcher = PublishSubject<MoviesModel>();
  final _movieGenerFtecher = PublishSubject<MoviesModel>();

//getter for stream
  Stream<MoviesModel> get allUpComing => _upComingMovieFetcher.stream;
  Stream<MoviesModel> get movieGener => _movieGenerFtecher.stream;

  // async Methods
  fetchAllUpcoming() async {
    MoviesModel upComingModel = await _repository.fetchUpcomingMovies();
    _upComingMovieFetcher.sink.add(upComingModel);
  }

  fetchMovieGener(int id) async {
    MoviesModel movieGenerModel = await _repository.fetchMovieDetails(id);
    _movieGenerFtecher.sink.add(movieGenerModel);
  }

//close controller
  dispose() {
    _upComingMovieFetcher.close();
    _movieGenerFtecher.close();
  }
}

final bloc = HomeBloc();
