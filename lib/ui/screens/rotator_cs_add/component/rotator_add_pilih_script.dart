// ignore_for_file: non_constant_identifier_names, prefer_final_fields,  curly_braces_in_flow_control_structures, unrelated_type_equality_checks, use_key_in_widget_constructors, unused_import

import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_cubit.dart';
import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_state.dart';
import 'package:Scriptmatic/ui/widgets/rotator/rotator_appbar.dart';
import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/typography.dart' as AppText;
import 'package:flutter/services.dart';

class RotatorAddPilihScript extends StatefulWidget {
  const RotatorAddPilihScript({required this.cubit, required this.state})
      : super();
  final RotatorCubit cubit;
  final RotatorState state;

  @override
  State<RotatorAddPilihScript> createState() => _RotatorAdPilihScriptState();
}

class _RotatorAdPilihScriptState extends State<RotatorAddPilihScript> {
  @override
  void dispose() {
    super.dispose();
  }

  void onTap() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Scaffold(
        appBar: RotatorAppBar(
          text: 'Pilih Script',
          context: context,
          onTap: () => widget.cubit.setRotatorMethod(''),
        ),
        backgroundColor: AppColor.white,
        resizeToAvoidBottomInset: false,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
          children: [
            Stack(
              children: const [],
            ),
          ],
        ),
      ),
    );
  }
}
