import '../database.dart';

class ImagenTable extends SupabaseTable<ImagenRow> {
  @override
  String get tableName => 'IMAGEN';

  @override
  ImagenRow createRow(Map<String, dynamic> data) => ImagenRow(data);
}

class ImagenRow extends SupabaseDataRow {
  ImagenRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ImagenTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);

  int? get idPajaro => getField<int>('id_pajaro');
  set idPajaro(int? value) => setField<int>('id_pajaro', value);

  int? get idCiudad => getField<int>('id_ciudad');
  set idCiudad(int? value) => setField<int>('id_ciudad', value);
}
