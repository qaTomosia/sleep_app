part of 'widgets.dart';

class SongWidget extends StatelessWidget {
  final Song song;
  final Color color;
  final double width;
  const SongWidget(
      {super.key,
      required this.song,
      required this.color,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
        child: Row(
          children: [
            Container(
              height: width * 0.16,
              width: width * 0.16,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      opacity: 0.5,
                      image: AssetImage(song.imageLink),
                      fit: BoxFit.cover)),
              child: const Center(child: Icon(Icons.play_arrow)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.songName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: FontFamilies.josefinSans,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    song.author,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: FontFamilies.josefinSans),
                  )
                ],
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
