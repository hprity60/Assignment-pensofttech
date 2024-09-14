// To parse this JSON data, do
//
//     final sliderList = sliderListFromJson(jsonString);

import 'dart:convert';

SliderList sliderListFromJson(String str) => SliderList.fromJson(json.decode(str));


class SliderList {
  List<SliderData>? data;

  SliderList({this.data});

  factory SliderList.fromJson(Map<String, dynamic> json) {
    return SliderList(
      data: json['data'] != null
          ? List<SliderData>.from(
          json['data'].map((item) => SliderData.fromJson(item)))
          : null,
    );
  }
}

class SliderData {
  String? photo;

  SliderData({this.photo});

  factory SliderData.fromJson(Map<String, dynamic> json) {
    return SliderData(
      photo: json['photo'],
    );
  }
}

