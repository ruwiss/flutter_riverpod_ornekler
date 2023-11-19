class FutureModel {
  final String activity;
  final String type;
  final int participants;
  final double price;
  final String link;

  FutureModel(
       this.activity, this.type, this.participants, this.price, this.link);

  FutureModel.fromJson(Map<String, dynamic> json)
      : activity = json['activity'],
        type = json['type'],
        participants = json['participants'],
        price = json['price'],
        link = json['link'];
}
