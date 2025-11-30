import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/gasto.dart';

class GastosRepository {
  static final GastosRepository _instance = GastosRepository._internal();
  factory GastosRepository() => _instance;
  GastosRepository._internal();

  Database? _db;

  // Inicializa la base de datos
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'gastos.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE gastos(
            id TEXT PRIMARY KEY,
            titulo TEXT,
            monto REAL,
            fecha TEXT
          )
        ''');
      },
    );
  }

  // Obtener todos los gastos
  Future<List<Gasto>> getGastos() async {
    final db = await database;
    final maps = await db.query('gastos');
    return maps.map((m) => Gasto(
      id: m['id'] as String,
      titulo: m['titulo'] as String,
      monto: m['monto'] as double,
      fecha: DateTime.parse(m['fecha'] as String),
    )).toList();
  }

  // Agregar un gasto
  Future<void> agregarGasto(Gasto gasto) async {
    final db = await database;
    await db.insert('gastos', {
      'id': gasto.id,
      'titulo': gasto.titulo,
      'monto': gasto.monto,
      'fecha': gasto.fecha.toIso8601String(),
    });
  }

  // Eliminar un gasto por id
  Future<void> eliminarGasto(String id) async {
    final db = await database;
    await db.delete('gastos', where: 'id = ?', whereArgs: [id]);
  }
}
