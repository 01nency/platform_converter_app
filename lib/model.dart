class Item {
  Item(
      {required this.title,
      required this.title1,
      required this.image,
      required this.time,
      required this.contact});
  final String title;
  final String title1;
  final String image;
  final DateTime time;
  final String contact;
}

List<Item> items = <Item>[
  Item(
      title: 'Tony Stark',
      title1: 'Flutter is great',
      image: 'asset/tony.jpg',
      time: DateTime.now(),
      contact: '+91 8989858545'),
  Item(
      title: 'Captain America',
      title1: 'Hey There!',
      image: 'asset/captain.jpg',
      time: DateTime.now(),
      contact: '+91 7412369856'),
  Item(
      title: 'Thor',
      title1: 'Done',
      image: 'asset/thor.jpg',
      time: DateTime.now(),
      contact: '+91 8745693214'),
  Item(
      title: 'Thanos',
      title1: 'Ready for fight?',
      image: 'asset/thanos.jpg',
      time: DateTime.now(),
      contact: '+91 9876543214'),
  Item(
      title: 'Hulk',
      title1: 'I throwed my phone because I am angry....',
      image: 'asset/hulk.jpg',
      time: DateTime.now(),
      contact: '+91 6789541235'),
  Item(
      title: 'Dr.Strange',
      title1: "It's magic",
      image: 'asset/strange.jpg',
      time: DateTime.now(),
      contact: '+91 8965472364'),
  Item(
      title: 'Spider Man',
      title1: 'You are my friend',
      image: 'asset/spider.jpg',
      time: DateTime.now(),
      contact: '+91 8974562586'),
  Item(
      title: 'Ant Man',
      title1: 'You are mine fellow',
      image: 'asset/ant.jpg',
      time: DateTime.now(),
      contact: '+91 8976853189'),
  Item(
      title: 'Hawkeye',
      title1: 'Keep your eyes open....',
      image: 'asset/key.jpg',
      time: DateTime.now(),
      contact: '+91 6547893215'),
];
