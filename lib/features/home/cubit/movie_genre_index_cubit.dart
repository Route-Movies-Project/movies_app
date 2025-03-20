import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class MovieGenreIndexCubit extends Cubit<int> {
  MovieGenreIndexCubit() : super(0);

  void setGenereIndex(int newIndex) {
    emit(newIndex);
  }
}
