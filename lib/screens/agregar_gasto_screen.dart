import 'package:flutter/material.dart';
import '../Presentation/providers/gastos_provider.dart';
import '../models/gasto.dart';
import 'package:provider/provider.dart';

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
            TextField(controller: tCtrl, decoration: const InputDecoration(labelText: "Título")),
            TextField(controller: mCtrl, decoration: const InputDecoration(labelText: "Monto"), keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final titulo = tCtrl.text;
                final monto = double.tryParse(mCtrl.text) ?? 0;
                if (titulo.isEmpty || monto <= 0) return;
                Provider.of<GastosProvider>(context, listen: false).agregar(
                  Gasto(titulo: titulo, monto: monto, fecha: DateTime.now(), id: ''),
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

