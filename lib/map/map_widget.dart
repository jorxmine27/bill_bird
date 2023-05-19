import 'package:bill_bird/map/marker_model.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:bill_bird/components/show_park_widget.dart' as park;
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart' as latLng;

import 'map_model.dart';
import 'marker_model.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key? key,
    this.idPajaro,
    this.nombrePajaro,
  }) : super(key: key);

  final idPajaro;
  final nombrePajaro;

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapModel _model;

  final PopupController _popupLayerController = PopupController();
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
    String? LatLngData;

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme
          .of(context)
          .primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Color(0xFFFFBF00),
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 16, top: 16),
                          child: functions.anadirTexto(context, widget.nombrePajaro, FontWeight.w300, 24, false),
                        )
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(end: 16.0, top: 16.0),
                          child: FloatingActionButton(
                            onPressed: () async {
                              context.pushNamed('MainPage');
                            },
                            child: Icon(Icons.arrow_back),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      )
                    ),
                  ],
                )
              ),
          Expanded(
            child: FutureBuilder<dynamic>(
                future: GETUbicacionDataCallByBird.call(pajaro: widget.idPajaro.toString()),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme
                              .of(context)
                              .primaryColor,
                        ),
                      ),
                    );
                  } else {
                    final GETUbicacionDataResponse = snapshot.data!;
                    final Marcadores = functions.cargarUbicaciones(GETUbicacionDataResponse);
                    final Ubicaciones = functions.marcadores(GETUbicacionDataResponse);
                    return FlutterMap(
                      options: MapOptions(
                        center: latLng.LatLng(41.3958734, 2.1549861),
                        zoom: 13.0,
                        onTap: (_, __) =>
                            _popupLayerController.hideAllPopups(),
                      ),
                      nonRotatedChildren: [
                        AttributionWidget.defaultWidget(
                          source: 'OpenStreetMap contributors',
                          onSourceTapped: null,
                        ),
                      ],
                      children: [
                        TileLayer(
                          urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        PopupMarkerLayerWidget(
                          options: PopupMarkerLayerOptions(
                              popupController: _popupLayerController,
                              markers: Ubicaciones,
                              markerRotateAlignment: PopupMarkerLayerOptions.rotationAlignmentFor(AnchorAlign.top),
                              popupBuilder: (context, Ubicaciones) {
                                LatLngData = '${Ubicaciones.point.latitude},${Ubicaciones.point.longitude}'.toString();
                                return park.ShowParkWidget(
                                  parque: LatLngData,
                                );
                              }
                          ),),
                      ],
                    );
                  }
                }),
          ),
        ]),
      ),
    );
  }
}
