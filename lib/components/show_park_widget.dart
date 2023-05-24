import 'package:bill_bird/backend/api_requests/api_calls.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:bill_bird/flutter_flow/custom_functions.dart' as function;
import 'package:provider/provider.dart';
import 'show_park_model.dart';
export 'show_park_model.dart';

class ShowParkWidget extends StatefulWidget {
  const ShowParkWidget({
    Key? key,
    this.parque,
  }) : super(key: key);

  //final String? parque;
  final parque;

  @override
  _ShowParkWidgetState createState() => _ShowParkWidgetState();
}

class _ShowParkWidgetState extends State<ShowParkWidget> {
  late ShowParkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowParkModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: FutureBuilder<ApiCallResponse>(
          future: GETParqueByLatLng.call(LatLng: widget.parque),
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
            final GETParqueByLatLngResponse = snapshot.data!;
            return Container(
              width: 400,
              height: 500,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).lineColor,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 400,
                      height: 200,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Image.network(
                        getJsonField(GETParqueByLatLngResponse.jsonBody,
                                r'''$[:].PARQUE[:].parkImage''')
                            .toString(),
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        'Park name',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: function.anadirTexto(context, getJsonField(GETParqueByLatLngResponse.jsonBody, r'''$[:].PARQUE[:].nombre'''), FontWeight.w500, 12, false)
                            // Text(
                            //   getJsonField(GETParqueByLatLngResponse.jsonBody,
                            //           r'''$[:].PARQUE[:].nombre''')
                            //       .toString(),
                            // ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Container(
                        width: 400,
                        height: 163,
                        child: function.anadirTexto(context, getJsonField(GETParqueByLatLngResponse.jsonBody, r'''$[:].PARQUE[:].desc'''), FontWeight.w300, 10, false),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: Text(
                              'Schedule:',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: function.anadirTexto(context, getJsonField(GETParqueByLatLngResponse.jsonBody, r'''$[:].PARQUE[:].horario'''), FontWeight.w500, 14, false)
                              // Text(
                              //   getJsonField(GETParqueByLatLngResponse.jsonBody,
                              //       r'''$[:].PARQUE[:].horario'''),
                              //   style: FlutterFlowTheme.of(context).bodyText1,
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
