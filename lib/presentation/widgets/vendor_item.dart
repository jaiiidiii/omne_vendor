import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omne_vendor/data/models/vendor_model.dart';
import 'package:omne_vendor/presentation/screens/vendor_detail_screen.dart';

class VendorItem extends StatelessWidget {
  const VendorItem({super.key, required this.vendor});

  final VendorModel vendor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: ListTile(
        leading: Hero(
          tag: 'vendor-image-${vendor.vendorId}',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              imageUrl: vendor.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Container(color: Colors.grey.shade300),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        // leading: Hero(
        //   tag: 'vendor-image-${vendor.vendorId}',
        //   child: CircleAvatar(
        //     backgroundImage: CachedNetworkImageProvider(vendor.imageUrl),
        //   ),
        // ),
        title: Hero(
          tag: 'vendor-name-${vendor.vendorId}',
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              vendor.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        // title: Text(
        //   vendor.name,
        //   style: Theme.of(context).textTheme.titleLarge,
        // ),
        subtitle: Text(
          vendor.category,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        ),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VendorDetailScreen(vendor: vendor),
            ),
          );
        },
      ),
    );
  }
}
