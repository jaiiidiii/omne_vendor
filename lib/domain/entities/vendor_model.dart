import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vendor_model.g.dart';

@JsonSerializable()
class VendorModel extends Equatable {
  final int vendorId;
  final String name;
  final String location;
  final double rating;
  final String category;
  final String imageUrl;
  final bool isFavorite;

  const VendorModel({
    required this.vendorId,
    required this.name,
    required this.location,
    required this.rating,
    required this.category,
    required this.imageUrl,
    this.isFavorite = false,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorModelToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'vendorId': vendorId,
      'name': name,
      'location': location,
      'rating': rating,
      'category': category,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory VendorModel.fromMap(Map<String, dynamic> map) {
    return VendorModel(
      vendorId: map['vendorId'] as int,
      name: map['name'] as String,
      location: map['location'] as String,
      rating: map['rating'] as double,
      category: map['category'] as String,
      imageUrl: map['imageUrl'] as String,
      isFavorite: map['isFavorite'] == 1,
    );
  }

  VendorModel copyWith({bool? isFavorite}) {
    return VendorModel(
      vendorId: vendorId,
      name: name,
      location: location,
      rating: rating,
      category: category,
      imageUrl: imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    vendorId,
    name,
    location,
    rating,
    category,
    imageUrl,
    isFavorite,
  ];
}
