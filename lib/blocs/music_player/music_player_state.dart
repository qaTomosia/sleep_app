part of 'music_player_bloc.dart';

abstract class MusicPlayerState extends Equatable {
  const MusicPlayerState();
  
  @override
  List<Object> get props => [];
}

class MusicPlayerInitial extends MusicPlayerState {}
