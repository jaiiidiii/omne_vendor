import 'dart:convert';
import 'dart:math';
import 'package:faker/faker.dart';
import 'package:omne_vendor/domain/entities/vendor_model.dart';

class VendorApiService {
  Future<String> fetchVendors() async {
    await Future.delayed(Duration(seconds: Random().nextInt(2) + 1));

    final faker = Faker();
    final vendors = List<VendorModel>.generate(50, (index) {
      return VendorModel(
        vendorId: index + 1,
        name: faker.company.name(),
        location: faker.address.city(),
        rating: (Random().nextDouble() * 2) + 3,
        category: faker.job.title(),

        imageUrl: 'https://picsum.photos/seed/vendor${index + 1}/200/200',
      );
    });

    final List<Map<String, dynamic>> jsonList = vendors
        .map((vendor) => vendor.toJson())
        .toList();

    return jsonEncode(jsonList);
  }
}
