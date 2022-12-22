part of 'album_bloc.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object> get props => [];
}

class LoadAlbum extends AlbumEvent {}

class AddAlbum extends AlbumEvent {
  final Album album;

  const AddAlbum({required this.album});

  @override
  List<Object> get props => [album];
}

class RemoveAlbum extends AlbumEvent {
  final Album album;

  const RemoveAlbum({required this.album});

  @override
  List<Object> get props => [album];
}
