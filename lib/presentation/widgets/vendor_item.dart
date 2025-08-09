import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omne_vendor/core/navigation/navigation_service.dart';
import 'package:omne_vendor/domain/entities/vendor_model.dart';

class VendorItem extends StatelessWidget {
  const VendorItem({
    super.key,
    required this.vendor,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  final VendorModel vendor;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

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
        title: Hero(
          tag: 'vendor-name-${vendor.vendorId}',
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              vendor.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        subtitle: Text(
          vendor.category,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: onToggleFavorite,
        ),
        onTap: () => NavigationService.goToVendorDetail(context, vendor),
      ),
    );
  }
}
