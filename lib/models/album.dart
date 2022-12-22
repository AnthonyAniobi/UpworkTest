import 'package:equatable/equatable.dart';

class Album extends Equatable {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Album({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  static Album testAlbum = const Album(
      albumId: 222,
      id: 222,
      title: 'my test album',
      url: 'url',
      thumbnailUrl: 'thumbnailUrl');

  static List<Album> fromJson(List list) {
    return list
        .map((item) => Album(
              albumId: item['albumId'],
              id: item['id'],
              title: item['title'],
              url: item['url'],
              thumbnailUrl: item['thumbnailUrl'],
            ))
        .toList();
  }

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];
}
