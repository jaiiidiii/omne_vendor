import 'package:omne_vendor/domain/entities/vendor_model.dart';

const vendorA = VendorModel(
  vendorId: 1,
  name: 'Alpha',
  location: 'City A',
  rating: 4.5,
  category: 'Food',
  imageUrl: 'url1',
);

const vendorB = VendorModel(
  vendorId: 2,
  name: 'Beta',
  location: 'City B',
  rating: 4.0,
  category: 'Tech',
  imageUrl: 'url2',
);

final mockVendor = const VendorModel(
  vendorId: 1,
  name: 'Vendor A',
  location: 'Loc A',
  rating: 4.5,
  category: 'Cat A',
  imageUrl: 'https://picsum.photos/200',
);

final mockVendors = [
  vendorA,
  vendorB,
  // Add more mock vendors when needed
];

final mockFavorites = [vendorA];
