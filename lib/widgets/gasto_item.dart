import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/gasto.dart';

class GastoItem extends StatelessWidget {
  final Gasto gasto;
  const GastoItem({super.key, required this.gasto});

  @override
  Widget build(BuildContext context) {
    final fechaFormateada = DateFormat('dd/MM/yyyy').format(gasto.fecha);

    return ListTile(
      title: Text(gasto.titulo),
      subtitle: Text(fechaFormateada),
      trailing: Text('\$${gasto.monto.toStringAsFixed(2)}'),
    );
  }
}
