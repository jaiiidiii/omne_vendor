import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'vendor_model.g.dart';

@JsonSerializable()
class VendorModel extends Equatable {
  final int vendorId;
  final String name;
  final String location;
  final double rating;
  final String category;
  final String imageUrl;

  const VendorModel({
    required this.vendorId,
    required this.name,
    required this.location,
    required this.rating,
    required this.category,
    required this.imageUrl,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorModelToJson(this);

  @override
  List<Object?> get props => [
    vendorId,
    name,
    location,
    rating,
    category,
    imageUrl,
  ];
}
