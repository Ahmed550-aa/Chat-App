class Message {
  String value;
  String id;

  Message(this.value, this.id);

  static List<Message> fromFirebase(List<dynamic> jsonData) {
    return jsonData.map((val) {
      return Message(
        val['message'] as String, 
        val['id'] as String,
      );
    }).toList();
  }
}

