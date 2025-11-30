import '../entities/transaccion.dart';
import '../repositories/i_transaccion_repository.dart';

class AddTransaccionesUseCase {
  final ITransaccionRepository repository;

  AddTransaccionesUseCase(this.repository);

  Future<void> call(Transaccion transaccion) async {
    // Aquí podrías agregar validaciones antes de guardar, por ejemplo:
    // if (transaccion.monto <= 0) throw Exception('Monto inválido');

    await repository.agregarTransaccion(transaccion);
  }
}