import 'package:flutter/material.dart';
import 'package:pcs5practice4/models/song.dart';
import 'package:pcs5practice4/constants.dart';

class SongDetailsPage extends StatefulWidget {

  final String playlistTitle;
  final Song song;
  final void Function(Song) onSongDelete;

  const SongDetailsPage({
    super.key,
    required this.playlistTitle,
    required this.song,
    required this.onSongDelete
  });

  @override
  State<StatefulWidget> createState() => _SongDetailsPageState();
}

class _SongDetailsPageState extends State<SongDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          fontSize: 24,
            color: Colors.black
        ),
          title: Center(
            child: Text(
              widget.playlistTitle
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
                    widget.song.title,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                      )
                  ),
                  Text(
                    widget.song.artist,
                    style: const TextStyle(
                      fontSize: 28
                    )
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  Center(
                    child: _getSongCoverImage(context, widget.song)
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
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
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          widget.onSongDelete(widget.song);
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.delete,
                          size: MediaQuery.of(context).size.width * 0.1
                        ),
                        label: const Text(''),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.05,
                            vertical: MediaQuery.of(context).size.width * 0.03
                          )
                        )
                      )
                    ],
                  )
                ],
              )
          )
      ),
    );
  }

  Widget _getSongCoverImage(BuildContext context, Song song) {
    if (song.coverPhotoUrl.isNotEmpty) {
      return Image.network(
          song.coverPhotoUrl,
          width: MediaQuery.of(context).size.width * 0.9,
      );
    }
    else {
      return Image.asset(
          kNoCoverImage,
          width: MediaQuery.of(context).size.width * 0.9,
      );
    }
  }
}