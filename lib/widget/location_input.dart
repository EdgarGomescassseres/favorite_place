import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  Location? _locacionSeleccionada;
  var _locacionObtenida = false;

  void _obtenerUbicacionActual() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _locacionObtenida = true;
    });

    locationData = await location.getLocation();

    setState(() {
      _locacionObtenida = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget priviewContent =  Text(
            "No hay ubicacion elegida ",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          );
          if(_locacionObtenida){
            priviewContent = const CircularProgressIndicator();
          }

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: priviewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text("Obtener ubicacion Actual"),
              onPressed:  _obtenerUbicacionActual,
            ),
            TextButton.icon(
              icon: const Icon(Icons.map_outlined),
              label: const Text("Seleccionar en el mapa"),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
