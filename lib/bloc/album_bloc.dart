import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_upwork_bloc/models/album.dart';
import 'package:test_upwork_bloc/models/error_model.dart';
import 'package:test_upwork_bloc/util/services/http_request.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumInitial()) {
    on<LoadAlbum>((event, emit) async {
      // async calls
      final response = await HttpRequest.getAlbums();
      if (response.isRight) {
        emit(AlbumLoaded(albums: response.right));
      } else {
        emit(AlbumErrorLoading(error: response.left));
      }
    });
    on<AddAlbum>((event, emit) {
      if (state is AlbumLoaded) {
        final state = this.state as AlbumLoaded;
        emit(AlbumLoaded(albums: List.from(state.albums)..add(event.album)));
      }
    });
    on<RemoveAlbum>((event, emit) {
      if (state is AlbumLoaded) {
        final state = this.state as AlbumLoaded;
        emit(AlbumLoaded(albums: List.from(state.albums)..remove(event.album)));
      }
    });
  }
}
