import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'city_maps_model.dart';
export 'city_maps_model.dart';

class CityMapsWidget extends StatefulWidget {
  const CityMapsWidget({Key? key}) : super(key: key);

  @override
  _CityMapsWidgetState createState() => _CityMapsWidgetState();
}

class _CityMapsWidgetState extends State<CityMapsWidget> {
  late CityMapsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CityMapsModel());
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              FutureBuilder<ApiCallResponse>(
                future: GetCityDataCall.call(),
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
                  final pageViewGetCityDataResponse = snapshot.data!;
                  return Builder(
                    builder: (context) {
                      final ciudades = getJsonField(
                        pageViewGetCityDataResponse.jsonBody,
                        r'''$''',
                      ).toList();
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 1.0,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: PageView.builder(
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage: min(0, ciudades.length - 1)),
                            scrollDirection: Axis.horizontal,
                            itemCount: ciudades.length,
                            itemBuilder: (context, ciudadesIndex) {
                              final ciudadesItem = ciudades[ciudadesIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Image.network(
                                          getJsonField(
                                            ciudadesItem,
                                            r'''$..IMAGEN[0].url''',
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 15.0, 0.0, 0.0),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed('MainPage');
                                          },
                                          child: Text(
                                            getJsonField(
                                              ciudadesItem,
                                              r'''$..nombre''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 32.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
