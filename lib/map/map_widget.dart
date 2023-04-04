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
export 'map_model.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

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

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme
          .of(context)
          .primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
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
                      style: FlutterFlowTheme
                          .of(context)
                          .bodyText1
                          .override(
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
                                FlutterFlowTheme
                                    .of(context)
                                    .primaryColor,
                              ),
                            ),
                          );
                        }
                        final textGETPajarosDataResponse = snapshot.data!;
                        return Text(
                          'Nothing',
                          style:
                          FlutterFlowTheme
                              .of(context)
                              .bodyText1
                              .override(
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
                        color: FlutterFlowTheme
                            .of(context)
                            .primaryText,
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
                  future: GETUbicacionDataCall.call(),
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
                    }
                    final GETUbicacionDataResponse = snapshot.data!;
                    return FlutterMap(
                      options: MapOptions(
                          center: latLng.LatLng(41.3958734, 2.1549861),
                          zoom: 13.0,
                          onTap: (_, __) =>
                              _popupLayerController.hideAllPopups(),
                        // onTap: (TapPosition, latlng) {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => ShowParkModel()),
                        //   );
                        // }
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
                              markers: functions.Marcadores(
                                  GETUbicacionDataResponse),
                              markerRotateAlignment: PopupMarkerLayerOptions
                                  .rotationAlignmentFor(AnchorAlign.top),
                              popupBuilder: (BuildContext context,
                                  Marker marker) => park.ShowParkWidget())
                          ),
                      ],
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
