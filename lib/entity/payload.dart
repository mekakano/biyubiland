class Payload {
  String? message;
  Object? object;

  Payload({this.message, this.object});

  Payload.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    object = json['object'] != null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.object != null) {
      data['object'] = this.object;
    }
    return data;
  }
}
