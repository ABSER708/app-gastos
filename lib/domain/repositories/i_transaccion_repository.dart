import '../entities/transaccion.dart';

abstract class ITransaccionRepository {
  Future<List<Transaccion>> getTransacciones();
  Future<void> agregarTransaccion(Transaccion transaccion);
  Future<void> eliminarTransaccion(String id);
   Future<void> actualizarTransaccion(Transaccion transaccion);
}
