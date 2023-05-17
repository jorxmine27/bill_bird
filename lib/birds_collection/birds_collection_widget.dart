import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'birds_collection_model.dart';
export 'birds_collection_model.dart';
import '/flutter_flow/custom_functions.dart' as functions;

var altura;

class BirdsCollectionWidget extends StatefulWidget {
  const BirdsCollectionWidget({
    Key? key,
    this.detalle,
  }) : super(key: key);

  final dynamic detalle;

  @override
  _BirdsCollectionWidgetState createState() => _BirdsCollectionWidgetState();
}

class _BirdsCollectionWidgetState extends State<BirdsCollectionWidget> {
  late BirdsCollectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BirdsCollectionModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    var huevos = functions.definirTextoHuevos(context, getJsonField(widget.detalle, r'''$..huevos'''), 'eggs', 'egg');
    var anos = functions.definirTextoAnos(context, getJsonField(widget.detalle, r'''$..vida'''), 'years', 'year');

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFA8C6FA),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Stack(
              children: [
                PageView(
                  controller: _model.pageViewController ??= PageController(initialPage: 0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.network(getJsonField(widget.detalle, r'''$..IMAGEN[0].url'''),
                      fit: BoxFit.cover,
                    ),
                    Image.network(getJsonField(widget.detalle, r'''$..IMAGEN[1].url'''),
                        fit: BoxFit.cover
                    ),
                    Image.network(getJsonField(widget.detalle, r'''$..IMAGEN[2].url'''),
                        fit: BoxFit.cover
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: altura,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 16.0, top: 16.0),
                          child: FloatingActionButton(
                            onPressed: () async {
                              context.pushNamed('MainPage');
                            },
                            child: Icon(Icons.arrow_back),
                            foregroundColor: Colors.black,
                            backgroundColor: Color(0xFFFFBF00),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: altura,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(top: 16.0, end: 16),
                          child: FloatingActionButton(
                            onPressed: () async {
                              context.pushNamed('Map');
                            },
                            child: Icon(Icons.map),
                            foregroundColor: Colors.black,
                            backgroundColor: Color(0xFFFFBF00),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsetsDirectional.only(start: 8.0, top: 4.0, bottom: 4.0),
                              child: functions.anadirTexto(context, 'Name:', FontWeight.w500, 17.0)
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 8.0, top: 4.0, bottom: 4.0),
                            child: functions.anadirTexto(context, getJsonField(widget.detalle, r'''$..nombre'''), FontWeight.w300, 17.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.025,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 8.0, bottom: 4.0),
                            child: functions.anadirTexto(context, getJsonField(widget.detalle, r'''$..nombre_cientifico'''), FontWeight.w200, 12.0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 8.0),
                            child: functions.anadirTexto(context, 'LifSpan in the wild:', FontWeight.w500, 17.0),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 8.0),
                            child: functions.anadirTexto(context, '${getJsonField(widget.detalle, r'''$..vida''')} ${anos}', FontWeight.w300, 17.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 8.0),
                            child: functions.anadirTexto(context, 'Eggs quantity:', FontWeight.w500, 17.0),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 8.0),
                            child: functions.anadirTexto(context, '${getJsonField(widget.detalle, r'''$..huevos''')} ${huevos}', FontWeight.w300, 17.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 8.0, bottom: 4.0),
                            child: functions.anadirTexto(context, 'Breeding:', FontWeight.w500, 17.0),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 8.0, bottom: 4.0),
                            child: functions.anadirTexto(context, '${getJsonField(widget.detalle, r'''$..epoca_cria''')}', FontWeight.w300, 17.0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.275,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding (
                          padding: EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
                          child: functions.anadirTexto(context, '${getJsonField(widget.detalle, r'''$..descripcion''')}', FontWeight.w300, 17.0),
                        )
                      ),
                    )
                  ],
                )
              ],
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AssetsAudioPlayer.newPlayer().open(
            Audio.network(getJsonField(widget.detalle,r'''$..sonido''')),
            autoStart: true,
          );
        },
        child: SizedBox(
          height: 45.0,
          child: Image.asset('assets/images/bird.png'),
        ),
        backgroundColor: Color(0xFFFFBF00),
      ),
    );
  }
}
