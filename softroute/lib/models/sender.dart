class Sender {
  final int senderId;
  final String fullname;
  final String dni;

  Sender({
    required this.senderId,
    required this.fullname,
    required this.dni,
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      senderId: json['senderId'],
      fullname: json['fullname'],
      dni: json['dni'],
    );
  }
}
