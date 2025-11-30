import '../../domain/entities/transaccion.dart';
import '../../domain/repositories/i_transaccion_repository.dart';

class TransaccionRepositoryImpl implements ITransaccionRepository {
  final List<Transaccion> _storage = [];

  @override
  Future<List<Transaccion>> getTransacciones() async {
    return _storage;
  }

  @override
  Future<void> agregarTransaccion(Transaccion transaccion) async {
    _storage.add(transaccion);
  }

  @override
  Future<void> eliminarTransaccion(String id) async {
    _storage.removeWhere((t) => t.id == id);
  }

  @override
  Future<void> actualizarTransaccion(Transaccion transaccion) async {
    final index = _storage.indexWhere((t) => t.id == transaccion.id);
    if (index != -1) {
      _storage[index] = transaccion;
    }
  }
}
