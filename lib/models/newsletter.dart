class Newsletter {
  final String shortName;
  final String topic;
  final String desc;
  final String photoUrl;
  final List<String> hashtags;
  bool? isSelected;

  Newsletter(
    this.shortName,
    this.topic,
    this.desc,
    this.photoUrl,
    this.hashtags,
  );
}
