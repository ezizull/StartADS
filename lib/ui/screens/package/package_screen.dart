// ignore_for_file: library_prefixes, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Scriptmatic/data/blocs/paket/use_cubit/paket_cubit.dart';
import 'package:Scriptmatic/data/blocs/paket/use_cubit/paket_state.dart';
import 'package:Scriptmatic/ui/screens/package/component/package_list.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/typography.dart' as AppText;
import 'package:Scriptmatic/utils/images.dart' as AppImage;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;

class PackageScreen extends StatelessWidget {
  PackageScreen({Key? key}) : super(key: key);
  final PaketCubit paketCubit = PaketCubit()..fetchPaket();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => paketCubit,
      child: BlocListener<PaketCubit, PaketState>(
        listener: (context, state) => {},
        child: Scaffold(
          appBar: PackageAppBar(context),
          backgroundColor: AppColor.white,
          body: BlocBuilder<PaketCubit, PaketState>(
            builder: (context, state) {
              if (state is UsablePaket) {
                return ListView(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // Banner Package
                    PackageCanvas(
                        height: 176,
                        color: AppColor.blue_CCF2F4,
                        borderRadius: BorderRadius.circular(12),
                        margin: const EdgeInsets.only(top: 15, bottom: 32),
                        children: [
                          PackageDecor(
                            left: 0,
                            bottom: -62,
                            right: 0,
                            child: SizedBox(
                              height: 176,
                              child: Image.asset(AppImage.wave_banner),
                            ),
                          ),
                          PackageDecor(
                            left: 0,
                            bottom: -27,
                            right: 0,
                            child: SizedBox(
                              height: 176,
                              child: Image.asset(AppImage.line_wave_banner),
                            ),
                          ),
                          PackageDecor(
                            left: 0,
                            right: -235,
                            bottom: 0,
                            child: SizedBox(
                              height: 168,
                              child: Image.asset(AppImage.man_banner),
                            ),
                          ),
                          PackageContent(
                            margin: const EdgeInsets.only(
                                top: 33, bottom: 33, right: 153, left: 18),
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 6),
                                child: Text("Dapatkan Paket Lifetime",
                                    style: AppText.Pops12w6h12_black_1F2024),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 25),
                                child: Text("Rp. 397.000,-",
                                    style: AppText.Inter12w6h14_black_1F2024),
                              ),
                              ButtonContent(
                                text: 'Miliki Sekarang',
                                backgroundColor: AppColor.blue_00AEFF,
                                icon: AppIcon.haveit_now_white,
                              )
                            ],
                          )
                        ]),

                    // Choose Package
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Text('Pilihan Paket',
                          style: AppText.Inter14w7_black_1F2024),
                    ),

                    // List Choose Package
                    PackageList(cubit: paketCubit, state: state),
                  ],
                );
              }
              return const Scaffold(
                backgroundColor: AppColor.white,
                body: Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ),
      ),
    );
  }

  // Package Banner
  AppBar PackageAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          color: AppColor.transparent,
          child: AppIcon.package_left_button,
        ),
      ),
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      title: Text('Package', style: AppText.Inter16w7_black_1F2024),
      centerTitle: true,
      backgroundColor: AppColor.transparent,
      elevation: 0, // 1
    );
  }

  // 1 : Package Canvas to be Decorated
  Widget PackageCanvas({
    required double height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Color? color,
    Widget? child, // when only have PackageContent
    List<Widget>? children, // when using PackageDecoration
    List<BoxShadow>? boxShadow,
    BorderRadiusGeometry? borderRadius,
  }) {
    return Container(
      height: height,
      width: double.infinity, // change this, if width become error
      margin: margin,
      padding: padding,
      clipBehavior: Clip.hardEdge, // apply rounded to child
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: color,
        boxShadow: boxShadow,
      ),
      child: child ?? Stack(children: children ?? []),
    );
  }

  // 2 : Single Package Decoration
  Positioned PackageDecor({
    double? left,
    double? bottom,
    double? right,
    double? top,
    Widget? child,
  }) {
    return Positioned(
      left: left,
      bottom: bottom,
      right: right,
      top: top,
      child: child ?? Container(),
    );
  }

  // 3 : Package Content build your own Content
  Widget PackageContent({
    EdgeInsets? margin,
    List<Widget>? children,
  }) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children ?? [],
      ),
    );
  }

  // 4 : Button of Content
  Widget ButtonContent({
    double? width,
    Widget? icon,
    Function? onPressed,
    String text = '',
    double height = 32,
    Color? backgroundColor,
  }) {
    return SizedBox(
        width: width,
        child: ElevatedButton(
          onPressed: (() => onPressed != null ? onPressed() : null),
          style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(height),
              primary: backgroundColor,
              shape: const StadiumBorder()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(margin: const EdgeInsets.only(right: 7), child: icon),
              Text(text),
            ],
          ),
        ));
  }
}
