class VideoModel {
  final String title;
  final String img;

  const VideoModel({required this.title, required this.img});

  static List<VideoModel> generatedItem = [
    const VideoModel(
        title: 'What to do if I have COVID? Treatment & Recovery at Home',
        img: 'assets/images/thumb-1.jpg'),
    const VideoModel(
        title: '5 MUST KNOW Tips to reduce BLOOD PRESSURE ',
        img: 'assets/images/thumb-2.jpg'),
    const VideoModel(
        title: 'Hepatitis A // symptoms? how to treat it? how to avoid it?',
        img: 'assets/images/thumb-3.jpg'),
    const VideoModel(
        title: '6 Tips for Better Sleep', img: 'assets/images/thumb-4.jpg'),
  ];
}
