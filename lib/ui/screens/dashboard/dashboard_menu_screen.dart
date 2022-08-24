// ignore_for_file: unused_field

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/data/blocs/script/use_cubit/fetch_scripts/fetch_scripts_cubit.dart';
import 'package:startercode_project/data/blocs/script/use_cubit/fetch_scripts/fetch_scripts_state.dart';
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
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 261,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.centerRight,
                                      stops: const [
                                        0.1,
                                        0.4,
                                        0.9,
                                      ],
                                      colors: [
                                        AppColor.whiteBlueBg.withOpacity(0.5),
                                        AppColor.childBlueBg,
                                        AppColor.darkBlueBg,
                                      ],
                                    )),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 0,
                                          bottom: 0,
                                          child: SizedBox(
                                            width: 450,
                                            height: 300,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  right: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    width: 252,
                                                    height: 237,
                                                    decoration:
                                                        const BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                      image: AssetImage(
                                                        "assets/images/dashboard/dashboard_bg_girl.png",
                                                      ),
                                                      fit: BoxFit.fitWidth,
                                                    )),
                                                  ),
                                                ),
                                                BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 29, sigmaY: 29),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: AppColor.white
                                                        .withOpacity(0.15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                              "assets/images/dashboard/dashboard_girl.png"),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 25),
                                                child: Row(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 36,
                                                      height: 36,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 11),
                                                      child: const CircleAvatar(
                                                        radius: 36,
                                                        backgroundColor:
                                                            AppColor.white,
                                                        backgroundImage: AssetImage(
                                                            'assets/images/profile/profile_avatar.png'),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 38,
                                                      width: 332,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 14),
                                                      decoration: BoxDecoration(
                                                        color: AppColor.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: const TextField(
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'Search',
                                                          icon: Icon(
                                                              Icons.search,
                                                              size: 16),
                                                          border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 0,
                                                                  style:
                                                                      BorderStyle
                                                                          .none)),
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          7),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Text("Paket Lifetime",
                                                  style: AppText.PopsTitle),
                                              Wrap(
                                                spacing: 13,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text("Expired Date:",
                                                      style:
                                                          AppText.PopsHeading2),
                                                  Container(
                                                    height: 15.24,
                                                    decoration:
                                                        const BoxDecoration(
                                                            boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 20,
                                                            color:
                                                                AppColor.white,
                                                          )
                                                        ]),
                                                    child: Icon(
                                                      Icons.all_inclusive,
                                                      color: AppColor.black2,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 250,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 795,
                                    padding: const EdgeInsets.all(16),
                                    decoration: const BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        )),
                                    child: ListView(
                                      children: [
                                        Center(child: Text(state.data)),
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
