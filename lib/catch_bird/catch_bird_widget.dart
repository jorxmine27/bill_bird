import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'catch_bird_model.dart';
export 'catch_bird_model.dart';

class CatchBirdWidget extends StatefulWidget {
  const CatchBirdWidget({
    Key? key,
    this.detalle,
  }) : super(key: key);

  final dynamic detalle;

  @override
  _CatchBirdWidgetState createState() => _CatchBirdWidgetState();
}

class _CatchBirdWidgetState extends State<CatchBirdWidget> {
  late CatchBirdModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CatchBirdModel());
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

    return FutureBuilder<ApiCallResponse>(
      future: GETPajarosDataCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final catchBirdGETPajarosDataResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFA8C6FA),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
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
                                      controller: _model.pageViewController ??=
                                          PageController(initialPage: 0),
                                      count: 3,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) {
                                        _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
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
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black,
                                width: 20.0,
                              ),
                            ),
                            child: ToggleIcon(
                              onPressed: () async {
                                setState(() =>
                                    FFAppState().IsOff = !FFAppState().IsOff);
                              },
                              value: FFAppState().IsOff,
                              onIcon: Icon(
                                Icons.check_outlined,
                                color: Colors.black,
                                size: 256.0,
                              ),
                              offIcon: Icon(
                                Icons.photo_camera,
                                color: Colors.black,
                                size: 256.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -0.3),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: colorFromCssString(
                        getJsonField(
                          widget.detalle,
                          r'''$..rareza''',
                        ).toString(),
                        defaultColor: Colors.black,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 0.0, 0.0),
                      child: Text(
                        getJsonField(
                          widget.detalle,
                          r'''$..nombre''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
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
                  alignment: AlignmentDirectional(0.9, 0.95),
                  child: FlutterFlowIconButton(
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    fillColor: Color(0xFFFFBF00),
                    icon: FaIcon(
                      FontAwesomeIcons.info,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        'BirdsCollection',
                        queryParams: {
                          'detalle': serializeParam(
                            getJsonField(
                              widget.detalle,
                              r'''$''',
                            ),
                            ParamType.JSON,
                          ),
                        }.withoutNulls,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
