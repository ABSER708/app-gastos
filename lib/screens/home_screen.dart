import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Presentation/providers/gastos_provider.dart';
import '../widgets/gasto_item.dart';
import 'nuevo_gasto_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gastosProvider = context.watch<GastosProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Gastos")),
      body: gastosProvider.gastos.isEmpty
          ? const Center(
              child: Text(
                "No hay gastos agregados",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: gastosProvider.gastos.length,
              itemBuilder: (ctx, i) {
                final gasto = gastosProvider.gastos[i];
                return Dismissible(
                  key: ValueKey(gasto.id),
                  background: Container(
                    color: const Color.fromARGB(255, 152, 41, 33),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,

                  // ⚠️ CORREGIDO: usar el método existente en el provider
                  onDismissed: (_) => gastosProvider.eliminar(gasto),

                  child: GastoItem(gasto: gasto),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const NuevoGastoScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
