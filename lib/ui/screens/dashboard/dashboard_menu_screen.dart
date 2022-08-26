// ignore_for_file: unused_field, non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/data/blocs/script/use_cubit/fetch_scripts/fetch_scripts_cubit.dart';
import 'package:startercode_project/data/blocs/script/use_cubit/fetch_scripts/fetch_scripts_state.dart';
import 'package:startercode_project/ui/screens/dashboard/component/dashboard_banner.dart';
import 'package:startercode_project/ui/screens/dashboard/component/dashboard_icons_menu.dart';
import 'package:startercode_project/ui/screens/dashboard/component/dashboard_script_populer.dart';
import 'package:startercode_project/ui/screens/dashboard/component/dashboard_script_terbaru.dart';
import 'package:startercode_project/ui/widgets/widgets.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;
import 'package:startercode_project/utils/icons.dart' as AppIcon;
import 'package:startercode_project/utils/typography.dart' as AppText;
import 'package:startercode_project/utils/images.dart' as AppImage;
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
          backgroundColor: AppColor.blue_00AEFF,
          floatingActionButton: AddScriptButton(),
          body: BlocBuilder(
            bloc: _fetchScriptsCubit,
            builder: (context, state) {
              if (state is FetchScriptsSuccess) {
                return Stack(
                  children: [
                    /* dashboard banner */
                    const DashboardBanner(),

                    /* dashboard component */
                    DashboardComponent(state),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  /* Add Script Button */
  Widget AddScriptButton() {
    return FloatingActionButton(
      onPressed: (() => showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
            builder: (BuildContext context) {
              return AddScriptDialog();
            },
          )),
      elevation: 4,
      child: SizedBox(
        height: 16,
        child: AppIcon.dashboard_plus_icon,
      ),
    );
  }

  /* Add Script Dialog */
  Container AddScriptDialog() {
    return Container(
      height: 283,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(children: [
        Container(
          height: 6,
          width: 38,
          margin: const EdgeInsets.only(top: 15),
          child: AppIcon.dashboard_bottom_dialog_put_icon,
        ),
        Container(
          width: 340,
          height: 193,
          margin: const EdgeInsets.only(top: 24, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pilih Script untuk dibuat', style: AppText.Lato16w7_black),
              SizedBox(
                height: 153,
                child: Column(children: [
                  /* Buat Script */
                  ScriptToCreated(
                    text: 'Buat Script',
                    action: () => (debugPrint('clicked: Buat Script')),
                    image: AppImage.buat_script_icon,
                    top: true,
                    bot: true,
                  ),

                  /* Buat Script Campaign */
                  ScriptToCreated(
                    text: 'Buat Script Campaign',
                    action: () => (debugPrint('clicked: Buat Script Campaign')),
                    image: AppImage.buat_script_campaign_icon,
                    bot: true,
                  ),

                  /* Buat Campaign */
                  ScriptToCreated(
                    text: 'Buat Campaign',
                    action: () => (debugPrint('clicked: Buat Campaign')),
                    image: AppImage.buat_campaign_icon,
                    bot: true,
                  ),
                ]),
              )
            ],
          ),
        )
      ]),
    );
  }

  /* Script To Be Created */
  Widget ScriptToCreated({
    required String text,
    required String image,
    Function? action,
    bool top = false,
    bool bot = false,
  }) {
    return GestureDetector(
      onTap: () => (action != null ? action() : null),
      child: SizedBox(
        height: 51,
        child: Row(children: [
          Container(
            height: 35,
            margin: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              right: 23,
              left: 2,
            ),
            child: Image.asset(image),
          ),
          Expanded(
            child: Container(
              height: 51,
              margin: const EdgeInsets.only(right: 2),
              child: Text(text, style: AppText.Lato14w5_black),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColor.grey_E5E5E5,
                    width: top ? 1 : 0,
                  ),
                  bottom: BorderSide(
                    color: AppColor.grey_E5E5E5,
                    width: bot ? 1 : 0,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  /* Dashboard Component */
  Widget DashboardComponent(FetchScriptsSuccess state) {
    return Positioned(
      top: 250,
      left: 0,
      right: 0,
      child: Container(
        height: 642,
        decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                /* component of dashboard */
                const DashboardIconsMenu(),
                const AppDivider(),
                DashboardScriptPopular(),
                DashboardScriptTerbaru(),

                /* check the cubit data */
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: Text(state.data),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
