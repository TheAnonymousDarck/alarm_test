//Modelo de la alarma

class AlarmInfo {
  int? id;
  DateTime alarmDateTime;
  String? title;
  String? description;
  bool? isPending;

  //Constructor
  AlarmInfo(
      {this.id,
      this.title,
      this.description,
      required this.alarmDateTime,
      this.isPending});

  factory AlarmInfo.fromJson(Map<String, dynamic> json) => AlarmInfo(
        id: json["id"],
        title: json["title"],
        description: json['description'],
        alarmDateTime: DateTime.parse(json["alarmDateTime"]),
        isPending: json["isPending"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "alarmDateTime": alarmDateTime.toIso8601String(),
        "isPending": isPending,
      };
}
