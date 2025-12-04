import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:uuid/uuid.dart';
import '../models/gasto.dart';

// =====================================================
//  REPOSITORY COMPATIBLE CON WEB (sin romper la app)
// =====================================================
class GastosRepository {
  static final GastosRepository _instance = GastosRepository._internal();
  factory GastosRepository() => _instance;
  GastosRepository._internal();

  // Solo para Web → almacenamiento en memoria (temporal)
  final List<Gasto> _memoria = [];

  bool get _usaSQLite =>
      !kIsWeb &&
      (Platform.isAndroid ||
          Platform.isIOS ||
          Platform.isWindows ||
          Platform.isLinux ||
          Platform.isMacOS);

  // =====================================================
  //              OBTENER GASTOS
  // =====================================================
  Future<List<Gasto>> getGastos() async {
    if (!_usaSQLite) {
      return List.from(_memoria);
    }

    // Si estuvieras usando SQLite aquí, pero lo quitamos
    return [];
  }

  // =====================================================
  //                AGREGAR GASTO
  // =====================================================
  Future<Gasto> agregarGasto(Gasto gasto) async {
    final newId = gasto.id.isEmpty ? Uuid().v4() : gasto.id;
    final nuevo = gasto.copyWith(id: newId);

    if (!_usaSQLite) {
      _memoria.add(nuevo);
      return nuevo;
    }

    return nuevo;
  }

  // =====================================================
  //                 ELIMINAR GASTO
  // =====================================================
  Future<void> eliminarGasto(String id) async {
    if (!_usaSQLite) {
      _memoria.removeWhere((g) => g.id == id);
      return;
    }
  }

  // =====================================================
  //                ACTUALIZAR GASTO
  // =====================================================
  Future<Gasto> actualizarGasto(Gasto gasto) async {
    if (!_usaSQLite) {
      final idx = _memoria.indexWhere((g) => g.id == gasto.id);
      if (idx != -1) {
        _memoria[idx] = gasto;
      }
      return gasto;
    }

    return gasto;
  }
}
