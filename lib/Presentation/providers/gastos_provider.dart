import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../data/gastos_repository.dart';
import '../../models/gasto.dart';

class GastosProvider extends ChangeNotifier {
  final GastosRepository _repo = GastosRepository();
  final List<Gasto> _gastos = [];

  List<Gasto> get gastos => List.unmodifiable(_gastos);

  GastosProvider() {
    _cargarGastos();
  }

  Future<void> _cargarGastos() async {
    try {
      final lista = await _repo.getGastos();
      _gastos.clear();
      _gastos.addAll(lista);
      notifyListeners();
    } catch (e) {
      debugPrint('Error cargando gastos: $e');
    }
  }

  // Método principal: devuelve el gasto guardado (con id real)
  Future<Gasto> addGasto(Gasto gasto) async {
    try {
      final creado = await _repo.agregarGasto(gasto);
      _gastos.add(creado);
      notifyListeners();
      return creado;
    } catch (e) {
      debugPrint('Error addGasto: $e');
      rethrow;
    }
  }

  // Compatibilidad con nombre en español (tus pantallas antiguas)
  Future<Gasto> agregar(Gasto gasto) => addGasto(gasto);

  // Eliminar por id
  Future<void> deleteGastoById(String id) async {
    try {
      await _repo.eliminarGasto(id);
      _gastos.removeWhere((g) => g.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleteGastoById: $e');
    }
  }

  // Compatibilidad con llamadas antiguas que mandaban el Gasto
  Future<void> eliminar(dynamic gastoOrId) async {
    if (gastoOrId is String) {
      return deleteGastoById(gastoOrId);
    } else if (gastoOrId is Gasto) {
      return deleteGastoById(gastoOrId.id);
    } else {
      throw ArgumentError('eliminar espera String (id) o Gasto');
    }
  }

  // Update
  Future<Gasto> updateGasto(Gasto gasto) async {
    try {
      final actualizado = await _repo.actualizarGasto(gasto);
      final idx = _gastos.indexWhere((g) => g.id == gasto.id);
      if (idx != -1) _gastos[idx] = actualizado;
      notifyListeners();
      return actualizado;
    } catch (e) {
      debugPrint('Error updateGasto: $e');
      rethrow;
    }
  }

  // Generador de ID rápido por si lo necesitas
  String generarId() => const Uuid().v4();
}
