// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);

import 'dart:convert';

ProductDetail productDetailFromJson(String str) => ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetail data) => json.encode(data.toJson());

class ProductDetail {
  final List<Datum>? data;
  final bool? success;
  final int? status;

  ProductDetail({
    this.data,
    this.success,
    this.status,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class Datum {
  final int? id;
  final String? name;
  final String? addedBy;
  final int? sellerId;
  final int? shopId;
  final String? shopName;
  final String? shopLogo;
  final List<Photo>? photos;
  final String? thumbnailImage;
  final List<String>? tags;
  final String? priceHighLow;
  final List<dynamic>? choiceOptions;
  final List<String>? colors;
  final bool? hasDiscount;
  final String? strokedPrice;
  final String? mainPrice;
  final int? calculablePrice;
  final String? currencySymbol;
  final int? currentStock;
  final String? unit;
  final int? rating;
  final int? ratingCount;
  final int? earnPoint;
  final String? description;
  final String? videoLink;
  final Brand? brand;
  final String? link;

  Datum({
    this.id,
    this.name,
    this.addedBy,
    this.sellerId,
    this.shopId,
    this.shopName,
    this.shopLogo,
    this.photos,
    this.thumbnailImage,
    this.tags,
    this.priceHighLow,
    this.choiceOptions,
    this.colors,
    this.hasDiscount,
    this.strokedPrice,
    this.mainPrice,
    this.calculablePrice,
    this.currencySymbol,
    this.currentStock,
    this.unit,
    this.rating,
    this.ratingCount,
    this.earnPoint,
    this.description,
    this.videoLink,
    this.brand,
    this.link,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    addedBy: json["added_by"],
    sellerId: json["seller_id"],
    shopId: json["shop_id"],
    shopName: json["shop_name"],
    shopLogo: json["shop_logo"],
    photos: json["photos"] == null ? [] : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
    thumbnailImage: json["thumbnail_image"],
    tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
    priceHighLow: json["price_high_low"],
    choiceOptions: json["choice_options"] == null ? [] : List<dynamic>.from(json["choice_options"]!.map((x) => x)),
    colors: json["colors"] == null ? [] : List<String>.from(json["colors"]!.map((x) => x)),
    hasDiscount: json["has_discount"],
    strokedPrice: json["stroked_price"],
    mainPrice: json["main_price"],
    calculablePrice: json["calculable_price"],
    currencySymbol: json["currency_symbol"],
    currentStock: json["current_stock"],
    unit: json["unit"],
    rating: json["rating"],
    ratingCount: json["rating_count"],
    earnPoint: json["earn_point"],
    description: json["description"],
    videoLink: json["video_link"],
    brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "added_by": addedBy,
    "seller_id": sellerId,
    "shop_id": shopId,
    "shop_name": shopName,
    "shop_logo": shopLogo,
    "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x.toJson())),
    "thumbnail_image": thumbnailImage,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "price_high_low": priceHighLow,
    "choice_options": choiceOptions == null ? [] : List<dynamic>.from(choiceOptions!.map((x) => x)),
    "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
    "has_discount": hasDiscount,
    "stroked_price": strokedPrice,
    "main_price": mainPrice,
    "calculable_price": calculablePrice,
    "currency_symbol": currencySymbol,
    "current_stock": currentStock,
    "unit": unit,
    "rating": rating,
    "rating_count": ratingCount,
    "earn_point": earnPoint,
    "description": description,
    "video_link": videoLink,
    "brand": brand?.toJson(),
    "link": link,
  };
}

class Brand {
  final int? id;
  final String? name;
  final String? logo;

  Brand({
    this.id,
    this.name,
    this.logo,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
  };
}

class Photo {
  final String? variant;
  final String? path;

  Photo({
    this.variant,
    this.path,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    variant: json["variant"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "variant": variant,
    "path": path,
  };
}
