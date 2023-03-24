import '../database.dart';

class UbicacionTable extends SupabaseTable<UbicacionRow> {
  @override
  String get tableName => 'UBICACION';

  @override
  UbicacionRow createRow(Map<String, dynamic> data) => UbicacionRow(data);
}

class UbicacionRow extends SupabaseDataRow {
  UbicacionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UbicacionTable();

  double get lat => getField<double>('lat')!;
  set lat(double value) => setField<double>('lat', value);

  double get lon => getField<double>('lon')!;
  set lon(double value) => setField<double>('lon', value);
}
