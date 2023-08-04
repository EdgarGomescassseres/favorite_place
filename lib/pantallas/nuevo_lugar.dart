import 'dart:io';

import 'package:favorite_places_app/provaiders/user_places.dart';
import 'package:favorite_places_app/widget/image_input.dart';
import 'package:favorite_places_app/widget/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NuevoLugar extends ConsumerStatefulWidget {
  const NuevoLugar({super.key});

  @override
  ConsumerState<NuevoLugar> createState() {
    return _NuevoLugarState();
  }
}

class _NuevoLugarState extends ConsumerState<NuevoLugar> {
  final _tituloController = TextEditingController();
  File? _imagenSeleted;

  void _saveLugar() {
    final textoIntroducido = _tituloController.text;

    if (textoIntroducido.isEmpty || _imagenSeleted == null) {
      return;
    }

    ref
        .read(userPlacesProvaider.notifier)
        .addPlace(textoIntroducido, _imagenSeleted!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _tituloController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Añadir Lugar"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "nombre"),
              controller: _tituloController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 14),
            ImageInput(
              onPickImagen: (image) {
                _imagenSeleted = image;
              },
            ),
            const SizedBox(height: 16),
            const LocationInput(),
            const SizedBox(height: 16),
            ElevatedButton.icon(
                onPressed: _saveLugar,
                icon: const Icon(Icons.add),
                label: const Text("Agregar lugar"))
          ],
        ),
      ),
    );
  }
}
