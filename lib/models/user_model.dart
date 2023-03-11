part of 'models.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final List<Song> songs;

  UserModel({required this.email, required this.name,  required this.uid, required this.songs});
}
