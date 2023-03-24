import '../database.dart';

class UsuarioTable extends SupabaseTable<UsuarioRow> {
  @override
  String get tableName => 'USUARIO';

  @override
  UsuarioRow createRow(Map<String, dynamic> data) => UsuarioRow(data);
}

class UsuarioRow extends SupabaseDataRow {
  UsuarioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get creado => getField<DateTime>('creado');
  set creado(DateTime? value) => setField<DateTime>('creado', value);

  String? get correo => getField<String>('correo');
  set correo(String? value) => setField<String>('correo', value);
}
