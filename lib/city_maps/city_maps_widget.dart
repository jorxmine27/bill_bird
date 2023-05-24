import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:bill_bird/main_page/main_page_widget.dart' as MainPage;
import 'package:bill_bird/flutter_flow/custom_functions.dart' as functions;
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
      body: GestureDetector(
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
                                  InkWell(
                                      onTap: () async {
                                        final id_ciudad = getJsonField(ciudadesItem, r'''$..id''').toString();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MainPage.MainPageWidget(
                                                  ciudad: id_ciudad,
                                                )
                                            )
                                        );
                                      },
                                      child: Container(
                                          width: MediaQuery.of(context).size.width - 15,
                                          height: MediaQuery.of(context).size.height * 0.2,
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.only(start: 8, top: 16, end: 8),
                                            child: functions.anadirTexto(context, getJsonField(ciudadesItem, r'''$..nombre'''), FontWeight.w300, 32, true),
                                          )
                                      )
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
