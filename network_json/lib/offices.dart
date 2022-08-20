class OfficeList {
  List<Office> officeList;

  OfficeList({required this.officeList});

  factory OfficeList.fromJson(Map<String, dynamic> json) {
    return OfficeList(
        officeList:
            (json['offices'] as List).map((i) => Office.fromJson(i)).toList());
  }
}

class Office {
  String name;
  String address;
  String image;

  Office({required this.name, required this.address, required this.image});

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
        name: json['name'] as String,
        address: json['address'] as String,
        image: json['image'] as String);
  }
}
