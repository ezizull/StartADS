// ignore_for_file: unused_field, non_constant_identifier_names, library_prefixes, deprecated_member_use

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:Scriptmatic/utils/constants.dart';
import 'package:Scriptmatic/data/blocs/paket/use_cubit/paket_cubit.dart';
import 'package:Scriptmatic/data/blocs/paket/use_cubit/paket_state.dart';
import 'package:Scriptmatic/data/blocs/script/use_cubit/script_cubit.dart';
import 'package:Scriptmatic/data/blocs/script/use_cubit/script_state.dart';
import 'package:Scriptmatic/ui/screens/dashboard_pkg/package_screen.dart';
import 'package:Scriptmatic/ui/widgets/app_divider.dart';
import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/images.dart' as AppImage;
import 'package:Scriptmatic/utils/typography.dart' as AppText;
import '../../widgets/app_drawer.dart';
import './component/dashboard_banner.dart';
import './component/dashboard_menu.dart';
import './component/dashboard_script_populer.dart';
import './component/dashboard_script_terbaru.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ScriptCubit scriptCubit = ScriptCubit()..fetchScript();
  final PaketCubit paketCubit = PaketCubit()..paketStatus();

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void dispose() {
    scriptCubit.close();
    paketCubit.close();
    super.dispose();
  }

  void _onTap() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => scriptCubit),
        BlocProvider(create: (context) => paketCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ScriptCubit, ScriptState>(
              bloc: scriptCubit,
              listener: (context, state) {
                if (state is ScriptLoaded) {
                  debugPrint("SUKSES FETCH");
                }
                if (state is ScriptFailure) {
                  debugPrint("GAGAL FETCH :" + state.message);
                }
              }),
          BlocListener<PaketCubit, PaketState>(
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) async {
              if (state is ExpiredPaket) {
                //  handle
                ExpiredPaketDialog(context); // comment to skip
              }
            },
          ),
        ],
        child: BlocBuilder<ScriptCubit, ScriptState>(
          bloc: scriptCubit,
          builder: (context, state) {
            if (state is ScriptLoaded) {
              return GestureDetector(
                onTap: _onTap,
                child: Scaffold(
                  backgroundColor: AppColor.blue_00AEFF,
                  key: _key,
                  floatingActionButton: AddScriptButton(),
                  drawer: AppDrawer(Dashboard),
                  body: Stack(
                    children: [
                      // dashboard banner
                      DashboardBanner(
                        onTapDrawer: (() {
                          // debugPrint('Avatar dashboard on click');
                          _key.currentState!.openDrawer(); // Open Drawer
                        }),
                      ),

                      // dashboard component
                      DashboardComponent(
                        cubit: scriptCubit,
                        state: state,
                        height: sheight * 0.695,
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is ExpiredPaket) {
              debugPrint("INSIDE: Expired Paket");
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

  // Dialog when Expired Paket
  Future<dynamic> ExpiredPaketDialog(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: paketCubit,
        //  remove GestureDetector to SHOULD SUBSCRIBE first
        child: GestureDetector(
          onTap: (() => Navigator.pop(context, true)), // remove GestureDetector
          child: Scaffold(
            backgroundColor: AppColor.transparent,
            body: Center(
              child: Container(
                width: swidth * 0.92,
                height: 328,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.white,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 136,
                      child: Image.asset(AppImage.paket_habis),
                      margin: const EdgeInsets.only(bottom: 20),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Wrap(
                        direction: Axis.vertical,
                        spacing: 5,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            'Paket Langganan Kamu Habis !',
                            style: AppText.Inter16w7_black,
                          ),
                          Text(
                            'Pilih dan Beli Langganan paket baru dan \ngunakan fitur tanpa batas !',
                            textAlign: TextAlign.center,
                            style: AppText.Inter12w4_grey_777C7E,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 361,
                      child: ElevatedButton(
                        onPressed: () {
                          AppExt.pushScreen(context, PackageScreen());
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(40),
                            primary: AppColor.blue_00AEFF,
                            shape: const StadiumBorder()),
                        child: const Text('Beli Sekarang'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Dashboard Component
  Widget DashboardComponent({
    required ScriptLoaded state,
    required ScriptCubit cubit,
    double? height,
  }) {
    return Positioned(
      top: 265,
      left: 0,
      right: 0,
      child: Container(
        height: height,
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
                // component of dashboard
                const DashboardMenu(),
                const AppDivider(),
                DashboardScriptPopular(state: state, cubit: cubit),
                DashboardScriptTerbaru(state: state, cubit: cubit),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 1 : Add Script Button
  Widget AddScriptButton() {
    return FloatingActionButton(
      onPressed: (() => showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
            builder: (BuildContext context) {
              double sheight = MediaQuery.of(context).size.height;

              // Add Script Dialog
              return AddScriptDialog(height: sheight * 0.35);
            },
          )),
      elevation: 4,
      child: SizedBox(
        height: 16,
        child: AppIcon.dashboard_plus,
      ),
    );
  }

  // 2 : Add Script Dialog
  Widget AddScriptDialog({double? height}) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(children: [
        Container(
          height: 6,
          width: 38,
          margin: const EdgeInsets.only(top: 15),
          child: AppIcon.dashboard_bottom_dialog_put,
        ),
        Container(
          width: 340,
          height: 193,
          margin: const EdgeInsets.only(top: 24, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pilih Script untuk dibuat',
                  style: AppText.Inter12w6_black_222831),
              SizedBox(
                height: 153,
                child: Column(children: [
                  // Buat Script
                  ScriptToCreated(
                    text: 'Buat Script',
                    action: () => (debugPrint('clicked: Buat Script')),
                    image: AppImage.buat_script,
                    top: true,
                    bot: true,
                  ),

                  // Buat Script Campaign
                  ScriptToCreated(
                    text: 'Buat Script Campaign',
                    action: () => (debugPrint('clicked: Buat Script Campaign')),
                    image: AppImage.buat_script_campaign,
                    bot: true,
                  ),

                  // Buat Campaign
                  ScriptToCreated(
                    text: 'Buat Campaign',
                    action: () => (debugPrint('clicked: Buat Campaign')),
                    image: AppImage.buat_campaign,
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

  // 3 : Script To Be Created
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
}
