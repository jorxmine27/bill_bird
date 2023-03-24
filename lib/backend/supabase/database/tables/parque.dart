import '../database.dart';

class ParqueTable extends SupabaseTable<ParqueRow> {
  @override
  String get tableName => 'PARQUE';

  @override
  ParqueRow createRow(Map<String, dynamic> data) => ParqueRow(data);
}

class ParqueRow extends SupabaseDataRow {
  ParqueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ParqueTable();

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  int get idCiudad => getField<int>('id_ciudad')!;
  set idCiudad(int value) => setField<int>('id_ciudad', value);
}
