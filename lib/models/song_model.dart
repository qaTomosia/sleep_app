part of 'models.dart';

class Song {
  final String songName;
  final String author;
  final String imageLink;
  final String audioLink;
  final String title;
  final int duration;

  const Song(
      {required this.songName,
      required this.title,
      required this.duration,
      required this.author,
      required this.imageLink,
      required this.audioLink});
}
