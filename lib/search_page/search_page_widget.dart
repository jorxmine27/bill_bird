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
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 2,
                      blurStyle: BlurStyle.normal
                  )
                ],
                color: Color(0xFFFFBF00),
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 16, top: 16),
                        child: FloatingActionButton(
                          onPressed: () async {
                            context.pushNamed('MainPage');
                          },
                          child: Icon(Icons.arrow_back),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(top: 16, end: 16),
                        child: FloatingActionButton(
                          onPressed: () async {
                            context.pushNamed('UserProfile');
                          },
                          child: Icon(Icons.person_2_rounded),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  TextFormField(
                    controller: _model.searchController,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.searchController',
                      Duration(milliseconds: 500),
                      () => setState(() {}),
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: getJsonField(widget.detalle,r'''$..nombre''').toString(),
                      hintText: '[Bird name...]',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF070707),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                    validator: _model.searchControllerValidator.asValidator(context),
                  ),
                  SingleChildScrollView(
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
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.85 - 60,
                              child: ListView.builder(
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
                                            child: Container(
                                              width: MediaQuery.of(context).size.width,
                                              height: 30,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: functions.anadirTexto(context, getJsonField(pajaroItem, r'''$..nombre'''), FontWeight.w300, 20, false),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.only(end: 16),
                                                      child: Container(
                                                        width: 20,
                                                        height: 20,
                                                        color: colorFromCssString(getJsonField(pajaroItem, r'''$..rareza''')),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
