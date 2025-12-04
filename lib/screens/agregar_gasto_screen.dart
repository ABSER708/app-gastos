import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Presentation/providers/gastos_provider.dart';
import '../models/gasto.dart';

class AgregarGastoScreen extends StatefulWidget {
  @override
  State<AgregarGastoScreen> createState() => _AgregarGastoScreenState();
}

class _AgregarGastoScreenState extends State<AgregarGastoScreen> {
  final tCtrl = TextEditingController();
  final mCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agregar gasto")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tCtrl,
              decoration: const InputDecoration(labelText: "Título"),
            ),
            TextField(
              controller: mCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Monto"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final titulo = tCtrl.text;
                final monto = double.tryParse(mCtrl.text) ?? 0;

                if (titulo.isEmpty || monto <= 0) return;

                await context.read<GastosProvider>().agregar(
                  Gasto(
                    id: "", // será remplazado por el repositorio
                    titulo: titulo,
                    monto: monto,
                    fecha: DateTime.now(),
                  ),
                );

                Navigator.pop(context);
              },
              child: const Text("Guardar"),
            )
          ],
        ),
      ),
    );
  }
}