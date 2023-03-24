import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({
    Key? key,
    this.detalle,
  }) : super(key: key);

  final dynamic detalle;

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

    _model.searchController ??= TextEditingController();
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 390.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color(0xFFFFBF00),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.88, 0.1),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      fillColor: Color(0xFFFFFCFC),
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('MainPage');
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.86, 0.04),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      fillColor: Color(0xFFFFFCFC),
                      icon: Icon(
                        Icons.person_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('UserProfile');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 743.2,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFormField(
                    controller: _model.searchController,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.searchController',
                      Duration(milliseconds: 500),
                      () => setState(() {}),
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: getJsonField(
                        widget.detalle,
                        r'''$..nombre''',
                      ).toString(),
                      hintText: '[Some hint text...]',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF070707),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                    validator:
                        _model.searchControllerValidator.asValidator(context),
                  ),
                  FutureBuilder<ApiCallResponse>(
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
                      final listViewGETPajarosDataResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final pajaro = getJsonField(
                            listViewGETPajarosDataResponse.jsonBody,
                            r'''$''',
                          ).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: pajaro.length,
                            itemBuilder: (context, pajaroIndex) {
                              final pajaroItem = pajaro[pajaroIndex];
                              return Visibility(
                                visible: functions.searchEngineFunction(
                                    getJsonField(
                                      pajaroItem,
                                      r'''$..nombre''',
                                    ).toString(),
                                    _model.searchController.text),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.01, -0.93),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 5.0, 0.0, 5.0),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'BirdsCollection',
                                          queryParams: {
                                            'detalle': serializeParam(
                                              getJsonField(
                                                pajaroItem,
                                                r'''$''',
                                              ),
                                              ParamType.JSON,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Text(
                                        getJsonField(
                                          pajaroItem,
                                          r'''$..nombre''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF14181B),
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
