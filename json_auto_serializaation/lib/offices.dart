import 'package:json_annotation/json_annotation.dart';

part 'offices.g.dart';

@JsonSerializable()
class OfficeList {
  List<Office> offices;

  OfficeList({required this.offices});

  factory OfficeList.fromJson(Map<String, dynamic> json) =>
      _$OfficeListFromJson(json);
  
  Map<String, dynamic> toJson() => _$OfficeListToJson(this);
}

@JsonSerializable()
class Office {
  String name;
  String address;
  String image;

  Office({required this.name, required this.address, required this.image});

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeToJson(this);
}
