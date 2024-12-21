class Corner {
  late int id;
  late String caption;
  String? img;
  late DateTime timeAdded;

  Corner({
    required this.id,
    required this.caption,
    required this.timeAdded,
  });

  Corner.withImg({
    required this.id,
    required this.caption,
    required this.timeAdded,
    required this.img,
  });
}
