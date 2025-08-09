// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorModel _$VendorModelFromJson(Map<String, dynamic> json) => VendorModel(
  vendorId: (json['vendorId'] as num).toInt(),
  name: json['name'] as String,
  location: json['location'] as String,
  rating: (json['rating'] as num).toDouble(),
  category: json['category'] as String,
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$VendorModelToJson(VendorModel instance) =>
    <String, dynamic>{
      'vendorId': instance.vendorId,
      'name': instance.name,
      'location': instance.location,
      'rating': instance.rating,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
    };
