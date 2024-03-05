// To parse this JSON data, do
//
//     final bukhari = bukhariFromJson(jsonString);

import 'dart:convert';

List<Bukhari> bukhariFromJson(String str) => List<Bukhari>.from(json.decode(str).map((x) => Bukhari.fromJson(x)));

String bukhariToJson(List<Bukhari> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bukhari {
    int number;
    String arab;
    String id;

    Bukhari({
        required this.number,
        required this.arab,
        required this.id,
    });

    factory Bukhari.fromJson(Map<String, dynamic> json) => Bukhari(
        number: json["number"],
        arab: json["arab"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "arab": arab,
        "id": id,
    };
}
