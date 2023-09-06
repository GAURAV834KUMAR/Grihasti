import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loadinghome_model.dart';
export 'loadinghome_model.dart';

class LoadinghomeWidget extends StatefulWidget {
  const LoadinghomeWidget({Key? key}) : super(key: key);

  @override
  _LoadinghomeWidgetState createState() => _LoadinghomeWidgetState();
}

class _LoadinghomeWidgetState extends State<LoadinghomeWidget> {
  late LoadinghomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadinghomeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 1.0,
      decoration: BoxDecoration(
        color: Color(0xFFF1F4F8),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
