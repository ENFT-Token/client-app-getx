class Chat {
  late String image, name, lastMessage, time;

  Chat({image, name, lastMessage, time}) {
    this.image = image;
    this.name = name;
    this.lastMessage = lastMessage;
    this.time = time;
  }
}

List chatDataList= [
  Chat(
      image: "assets/photos/basic-profile.jpg",
      name: "강선규",
      lastMessage: "안녕하세요",
      time: "5분 전"),
  Chat(
      image: "assets/photos/basic-profile.jpg",
      name: "문민수",
      lastMessage: "안녕하세요",
      time: "5분 전"),
  Chat(
      image: "assets/photos/basic-profile.jpg",
      name: "배해진",
      lastMessage: "안녕하세요",
      time: "5분 전"),
  Chat(
      image: "assets/photos/basic-profile.jpg",
      name: "장성호",
      lastMessage: "안녕하세요",
      time: "5분 전"),
];
