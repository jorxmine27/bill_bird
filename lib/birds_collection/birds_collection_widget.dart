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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFA8C6FA),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.45,
                              child: Stack(
                                children: [
                                  PageView(
                                    controller: _model.pageViewController ??=
                                        PageController(initialPage: 0),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Image.network(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            widget.detalle,
                                            r'''$..IMAGEN[0].url''',
                                          ),
                                          'https://cdn-icons-png.flaticon.com/512/44/44434.png',
                                        ),
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            widget.detalle,
                                            r'''$..IMAGEN[1].url''',
                                          ),
                                          'https://cdn-icons-png.flaticon.com/512/44/44434.png',
                                        ),
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            widget.detalle,
                                            r'''$..IMAGEN[2].url''',
                                          ),
                                          'https://cdn-icons-png.flaticon.com/512/44/44434.png',
                                        ),
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller:
                                            _model.pageViewController ??=
                                                PageController(initialPage: 0),
                                        count: 3,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) {
                                          _model.pageViewController!
                                              .animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        effect: smooth_page_indicator
                                            .ExpandingDotsEffect(
                                          expansionFactor: 2.0,
                                          spacing: 8.0,
                                          radius: 16.0,
                                          dotWidth: 16.0,
                                          dotHeight: 16.0,
                                          dotColor: Color(0xFF9E9E9E),
                                          activeDotColor: Color(0xFFFFBF00),
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'Name:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Text(
                            getJsonField(
                              widget.detalle,
                              r'''$..nombre''',
                            ).toString(),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Text(
                              getJsonField(
                                widget.detalle,
                                r'''$..nombre_cientifico''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).gray600,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'Lifspan in the wild',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: Text(
                              getJsonField(
                                widget.detalle,
                                r'''$..vida''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                          Text(
                            'years',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'Eggs quantity:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Text(
                            getJsonField(
                              widget.detalle,
                              r'''$..huevos''',
                            ).toString(),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'Breeding:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Text(
                            getJsonField(
                              widget.detalle,
                              r'''$..epoca_cria''',
                            ).toString(),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              getJsonField(
                                widget.detalle,
                                r'''$..descripcion''',
                              ).toString(),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: FlutterFlowAudioPlayer(
                        audio: Audio.network(
                          getJsonField(
                            widget.detalle,
                            r'''$..sonido''',
                          ),
                          metas: Metas(
                            id: 'pwxg6_-72kkdpag',
                            title: 'Chirp',
                          ),
                        ),
                        titleTextStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                        playbackDurationTextStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF9D9D9D),
                                  fontSize: 12.0,
                                ),
                        fillColor: Color(0xFFFFBF00),
                        playbackButtonColor: Colors.black,
                        activeTrackColor: Colors.black,
                        elevation: 4.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  fillColor: Color(0xFFFFBF00),
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('MainPage');
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.99, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 15.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    fillColor: Color(0xFFFFBF00),
                    icon: Icon(
                      Icons.map,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('Map');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
