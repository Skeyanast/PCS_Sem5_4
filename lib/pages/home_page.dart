import 'package:flutter/material.dart';
import 'package:pcs5practice4/data/data.dart';
import 'package:pcs5practice4/components/song_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Плейлист NFS MW'),
        ),
        titleTextStyle: const TextStyle(
            fontSize: 24,
            color: Colors.black
        ),
      ),
      body: ListView.builder(
          itemCount: dataSongs.length,
          itemBuilder: (BuildContext context, int index) {
            return SongComponent(song: dataSongs[index]);
          }
      ),
    );
  }
}