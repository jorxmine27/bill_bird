import '../database.dart';

class AvistaTable extends SupabaseTable<AvistaRow> {
  @override
  String get tableName => 'AVISTA';

  @override
  AvistaRow createRow(Map<String, dynamic> data) => AvistaRow(data);
}

class AvistaRow extends SupabaseDataRow {
  AvistaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AvistaTable();

  int get idUsuario => getField<int>('id_usuario')!;
  set idUsuario(int value) => setField<int>('id_usuario', value);

  int get idPajaro => getField<int>('id_pajaro')!;
  set idPajaro(int value) => setField<int>('id_pajaro', value);
}
