import '../database.dart';

class PajaroTable extends SupabaseTable<PajaroRow> {
  @override
  String get tableName => 'PAJARO';

  @override
  PajaroRow createRow(Map<String, dynamic> data) => PajaroRow(data);
}

class PajaroRow extends SupabaseDataRow {
  PajaroRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PajaroTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get nombreCientifico => getField<String>('nombre_cientifico');
  set nombreCientifico(String? value) =>
      setField<String>('nombre_cientifico', value);

  String? get descripcion => getField<String>('descripcion');
  set descripcion(String? value) => setField<String>('descripcion', value);

  int? get vida => getField<int>('vida');
  set vida(int? value) => setField<int>('vida', value);

  String? get huevos => getField<String>('huevos');
  set huevos(String? value) => setField<String>('huevos', value);

  String? get rareza => getField<String>('rareza');
  set rareza(String? value) => setField<String>('rareza', value);

  String? get epocaCria => getField<String>('epoca_cria');
  set epocaCria(String? value) => setField<String>('epoca_cria', value);

  String? get sonido => getField<String>('sonido');
  set sonido(String? value) => setField<String>('sonido', value);
}
