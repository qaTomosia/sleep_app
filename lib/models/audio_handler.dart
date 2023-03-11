part of 'models.dart';
// class AudioPlayerHandler extends BaseAudioHandler
//     with QueueHandler, SeekHandler {
//   // ignore: close_sinks
//   final BehaviorSubject<List<MediaItem>> _recentSubject =
//       BehaviorSubject.seeded(<MediaItem>[]);
//   final _mediaLibrary = MediaLibrary();
//   final _player = AudioPlayer();

//   int? get index => _player.currentIndex;

//   AudioPlayerHandler() {
//     _init();
//   }

//   Future<void> _init() async {
//     // Load and broadcast the queue
//     queue.add(_mediaLibrary.items[MediaLibrary.albumsRootId]!);
//     // For Android 11, record the most recent item so it can be resumed.
//     mediaItem
//         .whereType<MediaItem>()
//         .listen((item) => _recentSubject.add([item]));
//     // Broadcast media item changes.
//     _player.currentIndexStream.listen((index) {
//       if (index != null) mediaItem.add(queue.value[index]);
//     });
//     // Propagate all events from the audio player to AudioService clients.
//     _player.playbackEventStream.listen(_broadcastState);
//     // In this example, the service stops when reaching the end.
//     _player.processingStateStream.listen((state) {
//       if (state == ProcessingState.completed) stop();
//     });
//     try {
//       // After a cold restart (on Android), _player.load jumps straight from
//       // the loading state to the completed state. Inserting a delay makes it
//       // work. Not sure why!
//       //await Future.delayed(Duration(seconds: 2)); // magic delay
//       await _player.setAudioSource(ConcatenatingAudioSource(
//         children: queue.value
//             .map((item) => AudioSource.uri(Uri.parse(item.id)))
//             .toList(),
//       ));
//     } catch (e) {
//       // ignore: avoid_print
//       print("Error: $e");
//     }
//   }

//   @override
//   Future<List<MediaItem>> getChildren(String parentMediaId,
//       [Map<String, dynamic>? options]) async {
//     switch (parentMediaId) {
//       case AudioService.recentRootId:
//         // When the user resumes a media session, tell the system what the most
//         // recently played item was.
//         return _recentSubject.value;
//       default:
//         // Allow client to browse the media library.
//         return _mediaLibrary.items[parentMediaId]!;
//     }
//   }

//   @override
//   ValueStream<Map<String, dynamic>> subscribeToChildren(String parentMediaId) {
//     switch (parentMediaId) {
//       case AudioService.recentRootId:
//         final stream = _recentSubject.map((_) => <String, dynamic>{});
//         return _recentSubject.hasValue
//             ? stream.shareValueSeeded(<String, dynamic>{})
//             : stream.shareValue();
//       default:
//         return Stream.value(_mediaLibrary.items[parentMediaId])
//             .map((_) => <String, dynamic>{})
//             .shareValue();
//     }
//   }

//   @override
//   Future<void> skipToQueueItem(int index) async {
//     // Then default implementations of skipToNext and skipToPrevious provided by
//     // the [QueueHandler] mixin will delegate to this method.
//     if (index < 0 || index >= queue.value.length) return;
//     // This jumps to the beginning of the queue item at newIndex.
//     _player.seek(Duration.zero, index: index);
//     // Demonstrate custom events.
//     customEvent.add('skip to $index');
//   }

//   @override
//   Future<void> play() => _player.play();

//   @override
//   Future<void> pause() => _player.pause();

//   @override
//   Future<void> seek(Duration position) => _player.seek(position);

//   @override
//   Future<void> stop() async {
//     await _player.stop();
//     await playbackState.firstWhere(
//         (state) => state.processingState == AudioProcessingState.idle);
//   }

//   /// Broadcasts the current state to all clients.
//   void _broadcastState(PlaybackEvent event) {
//     final playing = _player.playing;
//     playbackState.add(playbackState.value.copyWith(
//       controls: [
//         MediaControl.skipToPrevious,
//         if (playing) MediaControl.pause else MediaControl.play,
//         MediaControl.stop,
//         MediaControl.skipToNext,
//       ],
//       systemActions: const {
//         MediaAction.seek,
//         MediaAction.seekForward,
//         MediaAction.seekBackward,
//       },
//       androidCompactActionIndices: const [0, 1, 3],
//       processingState: const {
//         ProcessingState.idle: AudioProcessingState.idle,
//         ProcessingState.loading: AudioProcessingState.loading,
//         ProcessingState.buffering: AudioProcessingState.buffering,
//         ProcessingState.ready: AudioProcessingState.ready,
//         ProcessingState.completed: AudioProcessingState.completed,
//       }[_player.processingState]!,
//       playing: playing,
//       updatePosition: _player.position,
//       bufferedPosition: _player.bufferedPosition,
//       speed: _player.speed,
//       queueIndex: event.currentIndex,
//     ));
//   }
// }