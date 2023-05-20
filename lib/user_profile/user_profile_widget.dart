import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_profile_model.dart';
export 'user_profile_model.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  final displayNameController = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;
  User? currentUser;
  late UserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
    _model = createModel(context, () => UserProfileModel());
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    await currentUser?.reload();
    DocumentSnapshot userSnapshot =
        await firestoreInstance.collection('users').doc(currentUser?.uid).get();
    setState(() {
      displayNameController.text = userSnapshot['display_name'] ?? '';
    });
  }

  Future<void> _updateDisplayName() async {
    await firestoreInstance
        .collection('users')
        .doc(currentUser?.uid)
        .update({'display_name': displayNameController.text});

    await _loadUserData();
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
      backgroundColor: Color(0xFFA8C6FA),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, top: 16.0),
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.85,
            child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: (MediaQuery.of(context).size.height * 0.50) + 128,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.20,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45),
                            ),
                            color: Colors.black,
                          ),
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/Cara.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(45),
                              bottomRight: Radius.circular(45),
                            ),
                            color: Color.fromRGBO(201, 221, 255, 100),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(top: 16),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                              0.95 -
                                          2,
                                      height: 32,
                                      child: Center(
                                        child: functions.anadirTexto(
                                          context,
                                          "Correo Electrónica",
                                          FontWeight.w300,
                                          16,
                                          true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                      start: MediaQuery.of(context).size.width *
                                          0.025,
                                      top: 4,
                                      end: MediaQuery.of(context).size.width *
                                          0.025,
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                              0.90 -
                                          2,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: functions.anadirTexto(
                                          context,
                                          currentUserEmail ?? '',
                                          FontWeight.w400,
                                          16,
                                          true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(top: 4.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                              0.95 -
                                          2,
                                      height: 32,
                                      child: Center(
                                        child: functions.anadirTexto(
                                          context,
                                          "Nombre",
                                          FontWeight.w300,
                                          16,
                                          true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            0.95 -
                                        2,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: TextField(
                                        controller: displayNameController,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              'Ingrese su nombre de usuario',
                                        ),
                                        onChanged: (value) async {
                                          // Cada vegada que el text canvia, actualitza el valor a la base de dades del Firebase.
                                          await _updateDisplayName();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(top: 16),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45),
                              ),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 96,
                          child: Center(
                            child: functions.anadirTexto(
                              context,
                              'I’m a complete fanatic of birds, I’m devoted to this cause and willing to help ornithologists in their research.',
                              FontWeight.w300,
                              16,
                              true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(45),
                              bottomRight: Radius.circular(45),
                            ),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
