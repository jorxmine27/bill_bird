import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'map_model.dart';
export 'map_model.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapModel());
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
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 589.4,
                height: 109.7,
                decoration: BoxDecoration(
                  color: Color(0xFFFFBF00),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.94, 0.08),
                      child: Text(
                        'MAP',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Jura',
                              fontSize: 38.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.07, -0.03),
                      child: FutureBuilder<ApiCallResponse>(
                        future: GETPajarosDataCall.call(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final textGETPajarosDataResponse = snapshot.data!;
                          return Text(
                            'Nothing',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Jura',
                                      fontSize: 38.0,
                                    ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.92, 0.15),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 45.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('MainPage');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: GeUbicacionDataCall.call(),
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
                    final googleMapGeUbicacionDataResponse = snapshot.data!;
                    return FlutterFlowGoogleMap(
                      controller: _model.googleMapsController,
                      onCameraIdle: (latLng) =>
                          _model.googleMapsCenter = latLng,
                      initialLocation: _model.googleMapsCenter ??=
                          LatLng(41.3958734, 2.1549861),
                      markers: functions
                          .listStringToLatLng((getJsonField(
                            googleMapGeUbicacionDataResponse.jsonBody,
                            r'''$[:].LatLng''',
                          ) as List)
                              .map<String>((s) => s.toString())
                              .toList()!)
                          .map(
                            (marker) => FlutterFlowMarker(
                              marker.serialize(),
                              marker,
                            ),
                          )
                          .toList(),
                      markerColor: GoogleMarkerColor.red,
                      mapType: MapType.normal,
                      style: GoogleMapStyle.standard,
                      initialZoom: 14.0,
                      allowInteraction: true,
                      allowZoom: true,
                      showZoomControls: true,
                      showLocation: true,
                      showCompass: false,
                      showMapToolbar: false,
                      showTraffic: false,
                      centerMapOnMarkerTap: true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
