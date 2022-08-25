// ignore_for_file: unused_field

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/data/blocs/script/use_cubit/fetch_scripts/fetch_scripts_cubit.dart';
import 'package:startercode_project/data/blocs/script/use_cubit/fetch_scripts/fetch_scripts_state.dart';
import 'package:startercode_project/ui/screens/dashboard/component/dashboard_banner.dart';
import 'package:startercode_project/ui/screens/dashboard/component/dashboard_icons_menu.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;
import 'package:startercode_project/utils/typography.dart' as AppText;
import 'package:startercode_project/utils/extensions.dart' as AppExt;

class DashboardMenuScreen extends StatefulWidget {
  const DashboardMenuScreen({Key? key}) : super(key: key);

  @override
  State<DashboardMenuScreen> createState() => _DashboardMenuScreenState();
}

class _DashboardMenuScreenState extends State<DashboardMenuScreen> {
  final FetchScriptsCubit _fetchScriptsCubit = FetchScriptsCubit()
    ..fetchScripts();

  @override
  void dispose() {
    _fetchScriptsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _fetchScriptsCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener(
              bloc: _fetchScriptsCubit,
              listener: (context, state) {
                if (state is FetchScriptsSuccess) {
                  debugPrint("SUKSES FETCH");
                }
                if (state is FetchScriptsFailure) {
                  debugPrint("GAGAL FETCH :" + state.message);
                }
              })
        ],
        child: Scaffold(
          backgroundColor: AppColor.childBlueBg,
          body: BlocBuilder(
              bloc: _fetchScriptsCubit,
              builder: (context, state) => state is FetchScriptsLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state is FetchScriptsFailure
                      ? const Center(child: Text("terjadi kesalahan"))
                      : state is FetchScriptsSuccess
                          ? Stack(
                              children: [
                                /* component of dashboard */
                                const DashboardBanner(),
                                /* all parts in white background component */
                                Positioned(
                                  top: 250,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 795,
                                    decoration: const BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        )),
                                    child: ListView(
                                      children: [
                                        /* component of dashboard */
                                        const DashboardIconsMenu(),
                                        Container(
                                          height: 1,
                                          color: AppColor.line,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                        ),
                                        Container(
                                          height: 158,
                                          margin: const EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Script Populer',
                                                    style: AppText.LatoTitle,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        /* check the cubit data */
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 30),
                                          child: Center(
                                            child: Text(state.data),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          : const SizedBox.shrink()),
        ),
      ),
    );
  }
}
