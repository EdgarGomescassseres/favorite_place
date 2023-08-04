import 'package:favorite_places_app/models/lugar.dart';
import 'package:favorite_places_app/pantallas/detalle_lugar.dart';
import 'package:flutter/material.dart';

class ListaLugares extends StatelessWidget {
  const ListaLugares({super.key, required this.lugares});

  final List<Lugar> lugares;

  @override
  Widget build(BuildContext context) {
    if (lugares.isEmpty) {
      return Center(
          child: Text(
        "Aun no hay lugares añadidos",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ));
    } else {
      return ListView.builder(
        itemCount: lugares.length,
        itemBuilder: ((ctx, index) => ListTile(
              leading: CircleAvatar(
                radius: 26,
                backgroundImage: FileImage(lugares[index].imagen),
              ),
              title: Text(lugares[index].titulo,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DetalleLugar(lugar: lugares[index]),));
                      },
            )),
        
      );
    }
  }
}
