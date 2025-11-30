import '../repositories/i_transaccion_repository.dart';

class DeleteTransaccionesUseCase {
  final ITransaccionRepository repository;

  DeleteTransaccionesUseCase(this.repository);

  Future<void> call(String id) async {
    await repository.eliminarTransaccion(id);
  }
}