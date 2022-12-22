part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

class AlbumInitial extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<Album> albums;

  const AlbumLoaded({required this.albums});

  @override
  List<Object> get props => [albums];
}

class AlbumErrorLoading extends AlbumState {
  final ErrorModel error;

  const AlbumErrorLoading({required this.error});

  @override
  List<Object> get props => [error];
}
