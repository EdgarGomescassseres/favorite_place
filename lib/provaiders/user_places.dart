import 'dart:io';

import 'package:favorite_places_app/models/lugar.dart';
import 'package:riverpod/riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Lugar>>{
  UserPlacesNotifier() : super(const []);

  void addPlace(String titulo, File image){
  final newPlace = Lugar(titulo: titulo, imagen: image);
  state = [newPlace,...state];
  }
}

final userPlacesProvaider = StateNotifierProvider<UserPlacesNotifier, List<Lugar>>((ref) => UserPlacesNotifier());