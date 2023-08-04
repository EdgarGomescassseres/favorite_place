import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Lugar {
 Lugar({required this.titulo, required this.imagen}): id = uuid.v4();
 final String id;
 final String titulo;
 final File imagen;
}