import '../database.dart';

class ApareceTable extends SupabaseTable<ApareceRow> {
  @override
  String get tableName => 'APARECE';

  @override
  ApareceRow createRow(Map<String, dynamic> data) => ApareceRow(data);
}

class ApareceRow extends SupabaseDataRow {
  ApareceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ApareceTable();

  int get idPajaro => getField<int>('id_pajaro')!;
  set idPajaro(int value) => setField<int>('id_pajaro', value);

  String get nombreParque => getField<String>('nombre_parque')!;
  set nombreParque(String value) => setField<String>('nombre_parque', value);

  int get idCiudad => getField<int>('id_ciudad')!;
  set idCiudad(int value) => setField<int>('id_ciudad', value);

  double get lat => getField<double>('lat')!;
  set lat(double value) => setField<double>('lat', value);

  double get lon => getField<double>('lon')!;
  set lon(double value) => setField<double>('lon', value);
}
