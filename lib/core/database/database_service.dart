import 'package:cerv_two/core/database/i_database_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DatabaseService implements IDatabaseService {
  DatabaseService._();

  static final DatabaseService db = DatabaseService._();
  static Database? _database;

  @override
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initializeDb();
    return _database!;
  }

  @override
  Future<Database> initializeDb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();

    final path = p.join(documentsDirectory.path, "db.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS product (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            valueInCents INTEGER NOT NULL,
            registration INTEGER NOT NULL UNIQUE,
            created_at TEXT DEFAULT (datetime('now')),
            CONSTRAINT value_error CHECK (value >= 0),
            CONSTRAINT registration_error CHECK (registration >= 0)
          );
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS product_log (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            product_id INTEGER,
            old_value TEXT,
            new_value TEXT,
            created_at TEXT DEFAULT (datetime('now'))
          );
        ''');

        await db.execute('''
          CREATE TRIGGER IF NOT EXISTS product_log_update
          AFTER UPDATE ON product
          BEGIN
            INSERT INTO product_log (product_id, old_value, new_value)
            VALUES (
              OLD.id, 
              json_object(
                'name', OLD.name, 
                'valueInCents', OLD.valueInCents, 
                'registration', OLD.registration
              ), 
              json_object(
                'name', NEW.name, 
                'valueInCents', NEW.valueInCents, 
                'registration', NEW.registration
              )
            );
          END;
        ''');

        await db.execute('''
          CREATE TRIGGER IF NOT EXISTS product_log_insert
          AFTER INSERT ON product
          BEGIN
            INSERT INTO product_log (product_id, old_value, new_value)
            VALUES (
              NEW.id, 
              NULL, 
              json_object(
                'name', NEW.name, 
                'valueInCents', NEW.valueInCents, 
                'registration', NEW.registration
              )
            );
          END;
        ''');

        await db.execute('''
          CREATE TRIGGER IF NOT EXISTS product_log_delete
          AFTER DELETE ON product
          BEGIN
            INSERT INTO product_log (product_id, old_value, new_value)
            VALUES (
              OLD.id, 
              json_object(
                'name', OLD.name, 
                'valueInCents', OLD.valueInCents, 
                'registration', OLD.registration
              ),
              NULL
            );
          END;
        ''');
      },
    );
  }
}
