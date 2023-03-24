import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'user_profile_model.dart';
export 'user_profile_model.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late UserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileModel());
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.06, -0.49),
                child: Container(
                  width: 350.0,
                  height: 428.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFC9DDFF),
                    borderRadius: BorderRadius.circular(34.0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.1, -0.68),
                child: Container(
                  width: 350.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF070707),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                      topLeft: Radius.circular(34.0),
                      topRight: Radius.circular(34.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.61),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/156/600',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.06, 0.32),
                child: Container(
                  width: 315.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF070707),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(180.0),
                      topRight: Radius.circular(180.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.12, 0.55),
                child: Container(
                  width: 315.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF070707),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(180.0),
                      bottomRight: Radius.circular(180.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.13, 0.13),
                child: Container(
                  width: 320.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => GradientText(
                        currentUserDisplayName.maybeHandleOverflow(
                            maxChars: 100),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1,
                        colors: [
                          FlutterFlowTheme.of(context).primaryColor,
                          FlutterFlowTheme.of(context).secondaryColor
                        ],
                        gradientDirection: GradientDirection.ltr,
                        gradientType: GradientType.linear,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.88, -0.96),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  fillColor: Color(0xFFFFFCFC),
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('MainPage');
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.1, -0.1),
                child: Container(
                  width: 320.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: GradientText(
                      currentUserEmail,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      colors: [
                        FlutterFlowTheme.of(context).primaryColor,
                        FlutterFlowTheme.of(context).secondaryColor
                      ],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.01, -0.2),
                child: Text(
                  'Correo electrónico',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.03),
                child: Text(
                  'Nombre',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.46),
                child: Text(
                  'I’m a complete fanatic of birds, I’m devoted to this cause and willing to help ornithologists in their research.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
