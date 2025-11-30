import '../entities/transaccion.dart';
import '../repositories/i_transaccion_repository.dart';

class GetTransaccionesUseCase {
  final ITransaccionRepository repository;

  GetTransaccionesUseCase(this.repository);

  Future<List<Transaccion>> call() async {
    return await repository.getTransacciones();
  }
}