import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omne_vendor/domain/entities/vendor_model.dart';
import 'package:omne_vendor/presentation/bloc/favorites/favorites_cubit.dart';
import 'package:omne_vendor/presentation/bloc/vendor/vendor_cubit.dart';
import 'package:omne_vendor/presentation/widgets/no_results.dart';
import 'package:omne_vendor/presentation/widgets/vendor_item.dart';

class VendorList extends StatelessWidget {
  final List<VendorModel> vendors;

  const VendorList({super.key, required this.vendors});

  @override
  Widget build(BuildContext context) {
    if (vendors.isEmpty) {
      return const NoResultsWidget();
    }
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, favoritesState) {
        List<VendorModel> favorites = [];
        if (favoritesState is FavoritesLoaded) {
          favorites = favoritesState.favorites;
        }
        return RefreshIndicator(
          onRefresh: () => context.read<VendorCubit>().refreshVendors(),
          child: ListView.builder(
            itemCount: vendors.length,
            itemBuilder: (context, index) {
              final vendor = vendors[index];
              final isFavorite = favorites.any(
                (fav) => fav.vendorId == vendor.vendorId,
              );

              return VendorItem(
                vendor: vendor,
                isFavorite: isFavorite,
                onToggleFavorite: () =>
                    context.read<FavoritesCubit>().toggleFavorite(vendor),
              );
            },
          ),
        );
      },
    );
  }
}
