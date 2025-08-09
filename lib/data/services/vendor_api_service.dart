import 'dart:math';
import 'package:faker/faker.dart';
import 'package:omne_vendor/data/models/vendor_model.dart';

class VendorApiService {
  Future<List<VendorModel>> fetchVendors() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: Random().nextInt(2) + 1));

    // Generate a list of 50 fake vendors
    final faker = Faker();
    final vendors = List<VendorModel>.generate(50, (index) {
      return VendorModel(
        vendorId: index + 1,
        name: '${faker.company.name()} Vendor',
        location: faker.address.city(),
        rating: (Random().nextDouble() * 2) + 3,
        category: faker.job.title(),
        // imageUrl: faker.image.image(
        //   keywords: ['vendor', 'store'],
        //   width: 640,
        //   height: 480,
        // ),
        imageUrl: 'https://picsum.photos/seed/vendor${index + 1}/200/200',
      );
    });

    // Return the JSON-formatted data
    return vendors;
  }
}
