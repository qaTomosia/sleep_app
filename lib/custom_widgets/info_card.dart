part of 'widgets.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.size,
    required this.imageLink,
    required this.durationText,
    required this.titleText,
  }) : super(key: key);

  final Size size;
  final String imageLink;
  final String durationText;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.12,
      width: size.width,
      decoration: BoxDecoration(
          color: AppColors.cardColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                  height: size.height * 0.1,
                  width: size.height * 0.1,
                  child: Image.network(
                    imageLink,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 12, 12),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.45,
                    child: const Text(
                      "Công thức vàng tính chỉ số giấc ngủ ngon mỗi đêm",
                      softWrap: true,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: FontFamilies.josefinSans,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Text(
                    "Bài viết có 5 phút đọc",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: FontFamilies.josefinSans,
                        fontWeight: FontWeight.w300),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
