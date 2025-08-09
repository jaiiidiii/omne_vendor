import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omne_vendor/domain/entities/vendor_model.dart';
import 'package:omne_vendor/domain/repositories/vendor_repository.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final VendorRepository _repository;

  FavoritesCubit(this._repository) : super(FavoritesInitial());

  Future<void> fetchFavorites() async {
    try {
      emit(FavoritesLoading());
      final favorites = await _repository.getFavorites();
      emit(FavoritesLoaded(favorites));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  Future<void> toggleFavorite(VendorModel vendor) async {
    final currentState = state;
    if (currentState is FavoritesLoaded) {
      final isCurrentlyFavorite = currentState.favorites.any(
        (fav) => fav.vendorId == vendor.vendorId,
      );

      if (isCurrentlyFavorite) {
        await _repository.removeFavorite(vendor.vendorId);
      } else {
        await _repository.addFavorite(vendor);
      }

      await fetchFavorites();
    }
  }
}
