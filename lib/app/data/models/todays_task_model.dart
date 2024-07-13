class TodayWorkModel {
  List<Data>? data;

  TodayWorkModel({this.data});

  TodayWorkModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? date;
  String? name;
  String? category;
  String? location;

  Data({this.date, this.name, this.category, this.location});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    name = json['name'];
    category = json['category'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['name'] = name;
    data['category'] = category;
    data['location'] = location;
    return data;
  }
}
