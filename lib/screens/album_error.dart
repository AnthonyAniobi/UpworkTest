import 'package:flutter/material.dart';
import 'package:test_upwork_bloc/models/error_model.dart';

class AlbumErrorScreen extends StatelessWidget {
  const AlbumErrorScreen({super.key, required this.error});

  final ErrorModel error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error.message,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
