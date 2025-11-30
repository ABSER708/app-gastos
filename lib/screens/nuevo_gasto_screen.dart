import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Presentation/providers/gastos_provider.dart';
import '../models/gasto.dart';

class NuevoGastoScreen extends StatefulWidget {
  const NuevoGastoScreen({super.key});

  @override
  State<NuevoGastoScreen> createState() => _NuevoGastoScreenState();
}

class _NuevoGastoScreenState extends State<NuevoGastoScreen> {
  final _tituloCtrl = TextEditingController();
  final _montoCtrl = TextEditingController();

  @override
  void dispose() {
    _tituloCtrl.dispose();
    _montoCtrl.dispose();
    super.dispose();
  }

  void _guardarGasto() {
    final titulo = _tituloCtrl.text.trim();
    final monto = double.tryParse(_montoCtrl.text.trim());

    if (titulo.isEmpty || monto == null || monto <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingrese un título y monto válido')),
      );
      return;
    }

    final gasto = Gasto(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      titulo: titulo,
      monto: monto,
      fecha: DateTime.now(),
    );

    context.read<GastosProvider>().agregar(gasto);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agregar Gasto")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tituloCtrl,
              decoration: const InputDecoration(labelText: 'Título'),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: _montoCtrl,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _guardarGasto(),
              decoration: const InputDecoration(labelText: 'Monto'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _guardarGasto,
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}
