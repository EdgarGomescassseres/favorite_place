import 'package:favorite_places_app/pantallas/nuevo_lugar.dart';
import 'package:favorite_places_app/provaiders/user_places.dart';
import 'package:favorite_places_app/widget/lista_lugares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LugaresFavoritos extends ConsumerWidget {
  const LugaresFavoritos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvaider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tus lugares"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NuevoLugar(),));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListaLugares(lugares: userPlaces),
      )
    );
  }
}
