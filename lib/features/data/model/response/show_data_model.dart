// To parse this JSON data, do
//
//     final showDataModel = showDataModelFromJson(jsonString);

import 'dart:convert';

ShowDataModel showDataModelFromJson(String str) =>
    ShowDataModel.fromJson(json.decode(str));

String showDataModelToJson(ShowDataModel data) => json.encode(data.toJson());

class ShowDataModel {
  String? result;
  List<Datum>? data;

  ShowDataModel({
    required this.result,
    required this.data,
  });

  factory ShowDataModel.fromJson(Map<String, dynamic> json) => ShowDataModel(
        result: json["result"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? sku;
  String? name;
  String? brandName;
  String? mainImage;
  Price? price;
  List<String>? sizes;
  String? stockStatus;
  String? colour;
  String? description;

  Datum({
    required this.id,
    required this.sku,
    required this.name,
    required this.brandName,
    required this.mainImage,
    required this.price,
    required this.sizes,
    required this.stockStatus,
    required this.colour,
    required this.description,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sku: json["SKU"],
        name: json["name"],
        brandName: json["brandName"],
        mainImage: json["mainImage"],
        price: Price.fromJson(json["price"]),
        sizes: List<String>.from(json["sizes"].map((x) => x)),
        stockStatus: json["stockStatus"],
        colour: json["colour"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "SKU": sku,
        "name": name,
        "brandName": brandName,
        "mainImage": mainImage,
        "price": price!.toJson(),
        "sizes": List<dynamic>.from(sizes!.map((x) => x)),
        "stockStatus": stockStatus,
        "colour": colour,
        "description": description,
      };
}

class Price {
  String? amount;
  String? currency;

  Price({
    required this.amount,
    required this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json["amount"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency": currency,
      };
}
