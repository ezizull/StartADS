// ignore_for_file: non_constant_identifier_names, prefer_final_fields, curly_braces_in_flow_control_structures, unrelated_type_equality_checks

import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_cubit.dart';
import 'package:Scriptmatic/data/blocs/rotator/use_cubit/rotator_state.dart';
import 'package:Scriptmatic/ui/screens/rotator_cs_add/component/rotator_add_custom_script.dart';
import 'package:Scriptmatic/ui/screens/rotator_cs_add/component/rotator_add_default.dart';
import 'package:Scriptmatic/ui/screens/rotator_cs_add/component/rotator_add_pilih_script.dart';
import 'package:Scriptmatic/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;

class RotatorAddScreen extends StatefulWidget {
  const RotatorAddScreen({Key? key}) : super(key: key);

  @override
  State<RotatorAddScreen> createState() => _RotatorAddScreenState();
}

class _RotatorAddScreenState extends State<RotatorAddScreen> {
  final RotatorCubit rotatorCubit = RotatorCubit()..fetchRotator();

  @override
  void dispose() {
    rotatorCubit.dispose();
    rotatorCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RotatorCubit>(
      create: (context) => RotatorCubit(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<RotatorCubit, RotatorState>(
              bloc: rotatorCubit,
              listener: (context, state) {
                if (state is RotatorLoaded) {
                  debugPrint("SUKSES FETCH");
                }
                if (state is RotatorFailure) {
                  debugPrint("GAGAL FETCH :" + state.message);
                }
              }),
        ],
        child: BlocBuilder<RotatorCubit, RotatorState>(
          bloc: rotatorCubit,
          builder: (context, state) {
            if (state is RotatorLoaded) {
              if (state.isiPesan == CustomScript) {
                return RotatorAddCustomScript(
                  state: state,
                  cubit: rotatorCubit,
                );
              }

              if (state.isiPesan == PilihScript) {
                return RotatorAddPilihScript(
                  state: state,
                  cubit: rotatorCubit,
                );
              }

              return RotatorAddDefault(state: state, cubit: rotatorCubit);
            }

            return const Scaffold(
              backgroundColor: AppColor.white,
              body: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
