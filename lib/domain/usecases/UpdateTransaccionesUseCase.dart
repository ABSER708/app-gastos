import '../entities/transaccion.dart';
import '../repositories/i_transaccion_repository.dart';

class UpdateTransaccionesUseCase {
  final ITransaccionRepository repository;

  UpdateTransaccionesUseCase(this.repository);

  /// Actualiza la transacción existente en el repositorio
  Future<void> call(Transaccion transaccion) async {
    await repository.actualizarTransaccion(transaccion);
  }
}
