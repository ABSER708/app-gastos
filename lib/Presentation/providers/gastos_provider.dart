import 'package:flutter/material.dart';
import '../../models/gasto.dart';
import '/data/gastos_repository.dart';

class GastosProvider extends ChangeNotifier {
  final GastosRepository _repo = GastosRepository(); // Instancia del repositorio
  final List<Gasto> _gastos = [];

  List<Gasto> get gastos => List.unmodifiable(_gastos);

  // Constructor: carga los gastos desde la base de datos al iniciar
  GastosProvider() {
    _cargarGastos();
  }

  Future<void> _cargarGastos() async {
    final lista = await _repo.getGastos();
    _gastos.addAll(lista);
    notifyListeners();
  }

  // Agregar gasto y guardarlo en SQLite
  Future<void> agregar(Gasto gasto) async {
    _gastos.add(gasto);
    await _repo.agregarGasto(gasto);
    notifyListeners();
  }

  // Eliminar gasto y borrarlo de SQLite
  Future<void> eliminar(Gasto gasto) async {
    _gastos.removeWhere((g) => g.id == gasto.id);
    await _repo.eliminarGasto(gasto.id);
    notifyListeners();
  }
}
