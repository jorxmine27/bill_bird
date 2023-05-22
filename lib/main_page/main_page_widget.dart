import 'package:bill_bird/flutter_flow/custom_functions.dart' as function;
import 'package:bill_bird/index.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:bill_bird/birds_collection/birds_collection_widget.dart' as BirdCollection;
import 'package:bill_bird/catch_bird/catch_bird_widget.dart' as CatchBird;
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({
    Key? key,
    this.pajaro,
  }) : super(key: key);

  final dynamic pajaro;

  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());
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

    BirdCollection.altura = MediaQuery.of(context).size.height * 0.15;
    CatchBird.altura = MediaQuery.of(context).size.height * 0.15;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFA8C6FA),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: Color(0xFFFFBF00),
        elevation: 8.0,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 3.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.search,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30.0,
          ),
          onPressed: () async {
            context.pushNamed('SearchPage');
          },
        ),
      ),
      body: Column(children: [
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
            color: Colors.amber,
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 16, top: 16.0),
                      child: FloatingActionButton(
                        onPressed: () async {
                          context.pushNamed('CityMaps');
                        },
                        child: Icon(Icons.arrow_back),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(top: 16.0),
                      child: FloatingActionButton(
                        onPressed: () async {
                          context.pushNamed('ChatBot');
                        },
                        child: Icon(Icons.chat),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 16.0, top: 16.0),
                      child: FloatingActionButton(
                        onPressed: () async {
                          context.pushNamed('UserProfile');
                        },
                        child: Icon(Icons.person_2_rounded),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.85,
          child: FutureBuilder<ApiCallResponse>(
              future: GETPajarosDataCall.call(),
              builder: (context, snapshot) {
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
                final Response = snapshot.data!;
                return Builder(builder: (context) {
                  final Pajaro =
                      getJsonField(Response.jsonBody, r'''$''').toList();
                  return ListView.builder(
                    padding: EdgeInsetsDirectional.only(top: 8.0),
                    itemCount: Pajaro.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Item = Pajaro[index];
                      return Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 8.0, bottom: 8.0, end: 8.0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('CatchBird', queryParams: {
                              'detalle': serializeParam(Item, ParamType.JSON),
                            }.withoutNulls);
                          },
                            child: Container(
                                width: MediaQuery.of(context).size.width - 16.0,
                                height: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(45),
                                    bottomRight: Radius.circular(45),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(-2, 4),
                                      blurRadius: 2,
                                      blurStyle: BlurStyle.normal
                                    )
                                  ],
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: (MediaQuery.of(context).size.width * 0.85) - 8,
                                          height: 220,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.only(start: 8.0, top: 4.0),
                                                    child: function.anadirTexto(context, getJsonField(Item, r'''$..nombre'''), FontWeight.w300, 14, false),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.only(start: 8.0, top: 2.0),
                                                    child: function.anadirTexto(context, getJsonField(Item, r'''$..nombre_cientifico'''), FontWeight.w200, 12, false),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.only(start: 8.0, top: 2.0),
                                                    child: SizedBox(
                                                      width: (MediaQuery.of(context).size.width * 0.85) - 24,
                                                      height: 165,
                                                      child: Image.network(
                                                        getJsonField(Item, r'''$..IMAGEN[0].url'''),
                                                        fit: BoxFit.cover
                                                      ),
                                                    )
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: (MediaQuery.of(context).size.width * 0.15) - 8,
                                          height: 220,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(45),
                                              bottomRight: Radius.circular(45),
                                            ),
                                            color: colorFromCssString(getJsonField(Item, r'''$..rareza'''))
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),)),
                      );
                    },
                  );
                });
              }),
        ),
      ]),
    );
  }
}
