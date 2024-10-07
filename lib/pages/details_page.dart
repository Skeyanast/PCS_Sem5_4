import 'package:flutter/material.dart';
import 'package:pcs5practice4/models/song.dart';

class DetailsPage extends StatelessWidget {

  final Song song;

  const DetailsPage({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleTextStyle: const TextStyle(
              fontSize: 24,
              color: Colors.black
          ),
          title: const Center(
              child: Text(
                  'Плейлист NFS MW'
              )
          )
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      song.title,
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Text(
                      song.artist,
                      style: const TextStyle(
                          fontSize: 28
                      )
                  ),
                  const SizedBox(height: 30),
                  Center(
                      child:
                      Image.asset(
                        song.coverPhoto,
                        width: MediaQuery.of(context).size.width * 0.9,
                      )
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                      onPressed: (){},
                      icon: Icon(
                          Icons.play_arrow,
                          size: MediaQuery.of(context).size.width * 0.1
                      ),
                      label: const Text('Play', style: TextStyle(fontSize: 24)),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.05,
                              vertical: MediaQuery.of(context).size.width * 0.03
                          )
                      )
                  )
                ],
              )
          )
      ),
    );
  }
}