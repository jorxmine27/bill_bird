import '../database.dart';

class CiudadTable extends SupabaseTable<CiudadRow> {
  @override
  String get tableName => 'CIUDAD';

  @override
  CiudadRow createRow(Map<String, dynamic> data) => CiudadRow(data);
}

class CiudadRow extends SupabaseDataRow {
  CiudadRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CiudadTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);
}
