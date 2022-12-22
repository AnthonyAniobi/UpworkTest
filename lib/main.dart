import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_upwork_bloc/bloc/album_bloc.dart';
import 'package:test_upwork_bloc/models/album.dart';
import 'package:test_upwork_bloc/screens/album_error.dart';
import 'package:test_upwork_bloc/screens/album_initial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AlbumBloc()..add(LoadAlbum()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Upwork Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upwork bloc'),
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(builder: (context, state) {
        if (state is AlbumInitial) {
          return const AlbumInitialScreen();
        } else if (state is AlbumLoaded) {
          return ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              subtitle: Text(state.albums[index].title),
              trailing: InkWell(
                onTap: () {
                  context
                      .read<AlbumBloc>()
                      .add(RemoveAlbum(album: state.albums[index]));
                },
                child: const Icon(Icons.delete),
              ),
            );
          });
        } else if (state is AlbumErrorLoading) {
          return AlbumErrorScreen(error: state.error);
        } else {
          return const Center(child: Text('state unavailable'));
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AlbumBloc>().add(AddAlbum(album: Album.testAlbum));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
