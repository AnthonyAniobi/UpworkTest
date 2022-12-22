import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_upwork_bloc/bloc/album_bloc.dart';

void main() {
  group('Initial Bloc State', () {
    blocTest<AlbumBloc, AlbumState>(
      'emits initial album when nothing is added',
      build: () => AlbumBloc(),
      expect: () => [],
    );
  });
}
