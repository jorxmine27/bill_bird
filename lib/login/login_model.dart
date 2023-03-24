import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress1 widget.
  TextEditingController? emailAddress1Controller;
  String? Function(BuildContext, String?)? emailAddress1ControllerValidator;
  // State field(s) for password1 widget.
  final password1Key = GlobalKey();
  TextEditingController? password1Controller;
  String? password1SelectedOption;
  late bool password1Visibility;
  String? Function(BuildContext, String?)? password1ControllerValidator;
  // State field(s) for emailAddress-Create widget.
  TextEditingController? emailAddressCreateController;
  String? Function(BuildContext, String?)?
      emailAddressCreateControllerValidator;
  // State field(s) for password-Create widget.
  final passwordCreateKey = GlobalKey();
  TextEditingController? passwordCreateController;
  String? passwordCreateSelectedOption;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)? passwordCreateControllerValidator;
  // State field(s) for password-Creater-repeate widget.
  final passwordCreaterRepeateKey = GlobalKey();
  TextEditingController? passwordCreaterRepeateController;
  String? passwordCreaterRepeateSelectedOption;
  late bool passwordCreaterRepeateVisibility;
  String? Function(BuildContext, String?)?
      passwordCreaterRepeateControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    password1Visibility = false;
    passwordCreateVisibility = false;
    passwordCreaterRepeateVisibility = false;
  }

  void dispose() {
    emailAddress1Controller?.dispose();
    emailAddressCreateController?.dispose();
  }

  /// Additional helper methods are added here.

}
