import 'package:flutter/material.dart';
import 'package:pcs5practice4/models/song.dart';
import 'package:pcs5practice4/pages/details_page.dart';

class SongComponent extends StatelessWidget {

  final Song song;

  const SongComponent({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(song: song))),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(5.0),
          ),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                      song.coverPhoto,
                      height: MediaQuery.of(context).size.width * 0.9,
                      width: MediaQuery.of(context).size.width * 0.9,
                      fit: BoxFit.cover
                  )
              ),
              Text(
                  song.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  )
              ),
              Text(
                  song.artist,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.grey[800]
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}