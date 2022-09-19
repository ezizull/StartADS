// ignore_for_file: non_constant_identifier_names, prefer_final_fields,  curly_braces_in_flow_control_structures, unrelated_type_equality_checks

import 'package:Scriptmatic/ui/widgets/app_informat.dart';
import 'package:Scriptmatic/utils/constants.dart';
import 'package:Scriptmatic/utils/transitions.dart';
import 'package:flutter/material.dart';

import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;
import 'package:Scriptmatic/utils/icons.dart' as AppIcon;
import 'package:Scriptmatic/utils/typography.dart' as AppText;
import 'package:flutter/services.dart';

class RotatorAddPilihScript extends StatefulWidget {
  const RotatorAddPilihScript({Key? key}) : super(key: key);

  @override
  State<RotatorAddPilihScript> createState() => _RotatorAddPilihScriptState();
}

class _RotatorAddPilihScriptState extends State<RotatorAddPilihScript> {
  // variable
  bool bobotInfo = false;
  bool Submit = false;

  String infoShow = 'Bobot bukan lah persentase melainkan pola,\n'
      'contoh:\n'
      ' • CS A -> Bobot 3\n'
      ' • CS B -> Bobot 2\n'
      'Artinya CS A akan menerima 3 pesan, kemudian setelah 3 pesan secara berurutan akan merotasi ke CS B, dst.';

  String? isiPesan = CustomScript;

  String? produk;
  String? track;
  String? group;
  String? bobot;

  String? customURL;
  String? customISI;
  String? pixelID;

  String showDialog = '';
  double? grubDialog;

  double topSimpan = 0;

  final _customURL = TextEditingController();
  final _customISI = TextEditingController();
  final _pixeID = TextEditingController();
  final _bobot = TextEditingController();

  List<String> ListProduct = [
    'Gamis Aqila1',
    'Gamis Aqila2',
    'Gamis Aqila3',
    'Gamis Aqila4',
    'Gamis Aqila5'
  ];

  List<Map> listCS = [
    {
      'title': 'Susi Susanti',
      'phone': '082150784267',
      'photo': 'assets/images/rotator/rotator_add/rotator_susi_susanti.png',
    },
    {
      'title': 'Dwi Listya',
      'phone': '082150784267',
      'photo': 'assets/images/rotator/rotator_add/rotator_dwi_listya.png',
    },
    {
      'title': 'Savannah Nguyen',
      'phone': '082150784267',
      'photo': 'assets/images/rotator/rotator_add/rotator_savannah_nguyen.png',
    },
  ];

  List<String> cboxActive = [];
  List<String> _cboxActive = [];

  @override
  void dispose() {
    _customURL.dispose();
    super.dispose();
  }

  void onTap() {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() => showDialog = '');
  }

  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;

    setState(() {
      // Group Dialog
      if (customURL == '' && pixelID == '') {
        grubDialog = 615;
      } else if (customURL != '' && pixelID != '') {
        grubDialog = 576;
      } else {
        grubDialog = 591;
      }

      // Simpan Button
      if (isiPesan == CustomScript) {
        topSimpan = sheight * 0.042;
      } else {
        topSimpan = sheight * 0.29;
      }

      if (isiPesan == CustomScript) {
        var bool = customURL != '' &&
            cboxActive.isNotEmpty &&
            track != '' &&
            produk != '' &&
            customISI != '' &&
            group != '' &&
            pixelID != '' &&
            bobot != '';

        if (bool) Submit = true;
        if (!bool) Submit = false;
      } else {
        var bool = customURL != '' &&
            cboxActive.isNotEmpty &&
            track != '' &&
            produk != '';

        if (bool) Submit = true;
        if (!bool) Submit = false;
      }
    });

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // custom script
              TitleText(CustomISI, showTitle: isiPesan == CustomScript),
              InputRotator(
                initial: CustomISI,
                hintText: 'Masukan isi pesan',
                controller: _customISI,
                height: 97,
                maxLines: 5,
                showInput: isiPesan == CustomScript,
                onChanged: (value) => setState(() => customISI = value),
                margin: EdgeInsets.only(bottom: customURL == '' ? 8 : 16),
              ),

              // Custom URL
              TitleText(CustomURL),
              InputRotator(
                initial: CustomURL,
                hintText: 'Masukan URL (cth: Gamis Aqila)',
                controller: _customURL,
                onChanged: (value) => setState(() => customURL = value),
                margin: EdgeInsets.only(bottom: customURL == '' ? 8 : 16),
              ),
              ErrorMsg(
                'Wajib Diisi!',
                initial: CustomURL,
                margin: const EdgeInsets.only(bottom: 16),
              ),

              // Pilih Tracking Option
              TitleText(Track),
              Button(
                textBtn: track ?? 'Pilih Tracking Option',
                margin: const EdgeInsets.only(bottom: 16),
                tile: AppIcon.drawer_down,
                height: 48,
                textBtnStyle: AppText.Inter14w4_grey_8F9098,
                onPressed: () => setState(() => showDialog = Track),
              ),

              // Custom URL
              TitleText(PixelID, showTitle: isiPesan == CustomScript),
              InputRotator(
                controller: _pixeID,
                initial: PixelID,
                hintText: 'XXXXXX',
                showInput: isiPesan == CustomScript,
                onChanged: (value) => setState(() => pixelID = value),
                margin: EdgeInsets.only(bottom: pixelID == '' ? 8 : 16),
                textCapitalization: TextCapitalization.characters,
                inputFormatters: [UpperCaseText()],
              ),
              ErrorMsg(
                'Wajib Diisi!',
                showMessage: isiPesan == CustomScript,
                initial: PixelID,
                margin: const EdgeInsets.only(bottom: 16),
              ),

              // Pilih Tracking Option
              TitleText(GroubPel, showTitle: isiPesan == CustomScript),
              Button(
                textBtn: group ?? 'New Costumer',
                height: 48,
                tile: AppIcon.drawer_down,
                showButton: isiPesan == CustomScript,
                margin: const EdgeInsets.only(bottom: 16),
                textBtnStyle: AppText.Inter14w4_grey_8F9098,
                onPressed: () => setState(() => showDialog = GroubPel),
              ),

              // Costumer Service
              TitleText('Customer Service'),
              Button(
                textBtn: cboxActive.isNotEmpty
                    ? cboxActive.join(', ')
                    : 'Pilih Customer Service',
                onPressed: () => BottomModal(context),
                height: 48,
                textBtnStyle: AppText.Inter14w4_grey_8F9098,
                margin: const EdgeInsets.only(bottom: 16),
              ),

              // Bobot
              TitleText(
                'Bobot',
                onTap: () => setState(() => bobotInfo = !bobotInfo),
                showTitle: isiPesan == CustomScript,
                icon: AppIcon.rotator_info,
              ),
              InputRotator(
                hintText: '1',
                controller: _bobot,
                height: 48,
                initial: 'Bobot',
                margin: const EdgeInsets.only(bottom: 16),
                showInput: isiPesan == CustomScript,
                onChanged: ((value) => setState(() => bobot = value)),
              ),

              // Show Info
              Button(
                showButton: isiPesan == CustomScript && bobotInfo,
                borderWidth: 0,
                height: 172,
                margin: const EdgeInsets.only(bottom: 16),
                backgroundColor: AppColor.blue_EAF2FF,
                foregroundColor: AppColor.blue_00AEFF,
                padding: const EdgeInsets.all(16),
                btnShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      margin: const EdgeInsets.only(right: 16),
                      child: AppIcon.rotator_info_show,
                    ),
                    Expanded(
                        child: Text(
                      infoShow,
                      style: AppText.Inter_12w4h20_orange_FF8C51,
                    )),
                  ],
                ),
              ),

              // Tambah Customer Service
              Button(
                textBtn: 'Tambah Customer Service +',
                onPressed: () => BottomModal(context),
                btnTextAlgn: Alignment.center,
                height: 48,
                showButton: isiPesan == CustomScript,
                textBtnStyle: AppText.Inter14w4h20_blue_00AEFF,
                btnShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    width: 1.5,
                    color: AppColor.blue_00AEFF,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ],
          ),

          // Pilih Tracking Option
          RotatorDialog(
            top: customURL != '' ? 402 : 417,
            popup: showDialog == Track,
            children: [...ListProduct.map((value) => RotatorDialogItem(value))],
          ),

          // Group Pelanggan
          RotatorDialog(
            top: grubDialog,
            popup: showDialog == GroubPel,
            children: [...ListProduct.map((value) => RotatorDialogItem(value))],
          ),
        ],
      ),
    );
  }

  // Rotator AppBar
  AppBar RotatorAppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      leading: GestureDetector(
        onTap: () => AppExt.popScreen(context),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          color: AppColor.transparent,
          child: AppIcon.package_left_button,
        ),
      ),
      title: Text(RotatorAdd, style: AppText.Inter16w7_black_1F2024),
      centerTitle: true,
      backgroundColor: AppColor.transparent,
      elevation: 0, // 1
    );
  }

  // Dialog of Rotator
  Widget RotatorDialog({
    List<Widget> children = const <Widget>[],
    double? bottom,
    double left = 0,
    double? top,
    double right = 0,
    bool popup = false,
  }) {
    const boxShadow = BoxShadow(
      color: AppColor.grey_C5C6CC,
      blurRadius: 2,
      offset: Offset(0, 1),
    );

    return Positioned(
      right: right,
      left: left,
      top: top,
      bottom: bottom,
      child: FadeScaleMotion(
        alignment: Alignment.topCenter,
        popup: popup,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: AppColor.white,
              boxShadow: const [boxShadow],
              borderRadius: BorderRadius.circular(12)),
          child: Column(children: children),
        ),
      ),
    );
  }

  // Item of Rotator Dialog
  Widget RotatorDialogItem(String value) {
    var color = (showDialog == Produk && produk == value) ||
            (showDialog == Track && track == value) ||
            (showDialog == GroubPel && group == value)
        ? AppColor.grey_F5F4F6
        : AppColor.transparent;

    return GestureDetector(
      onTap: () => setState(() {
        if (showDialog == Produk) produk = value;
        if (showDialog == Track) track = value;
        if (showDialog == GroubPel) group = value;
      }),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        color: color,
        child: Text(value),
      ),
    );
  }

  // title in Rotator
  Widget TitleText(
    String title, {
    bool showTitle = true,
    Widget? icon,
    double spacing = 8,
    Function? onTap,
    Function? iconTap,
  }) {
    var localChildren = [
      Text(title, style: AppText.Inter12w7h14_black_2F3036),

      // with onTap
      if (onTap != null) ...[
        SizedBox(width: 11, height: 11, child: icon)
      ]

      // whit iconTap
      else if (icon != null) ...[
        GestureDetector(
          onTap: () => iconTap != null ? iconTap() : null,
          child: SizedBox(width: 11, height: 11, child: icon),
        )
      ]
    ];

    return showTitle
        ? GestureDetector(
            onTap: () => onTap != null ? onTap() : null,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              alignment: Alignment.centerLeft,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: spacing,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: localChildren,
              ),
            ),
          )
        : Container();
  }

  // Radio Button List
  Widget RowButtons({
    List<Widget> children = const <Widget>[],
    String? title,
    EdgeInsetsGeometry? margin,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 14),
          child: Text(title ?? '', style: AppText.Inter12w7h14_black_2F3036),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        ),
        Container(margin: margin)
      ],
    );
  }

  // Radio Button
  Widget RadioBtn({
    required String? groupValue,
    required String value,
    EdgeInsetsGeometry? margin,
    double width = 130,
    double spacing = 10,
    Color? color,
  }) {
    // component
    var children = [
      Radio(
        onChanged: (String? value) => setState(() => isiPesan = value),
        groupValue: groupValue,
        value: value,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
      ),
      SizedBox(width: spacing),
      Flexible(
          child: GestureDetector(
        onTap: () => setState(() => isiPesan = value),
        child: Text(value, style: AppText.Pops14w4h21_black_464E5F),
      )),
    ];

    return Container(
      color: color,
      width: width,
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
    );
  }

  // Input Textfield
  Widget InputRotator({
    required Function(String) onChanged,
    List<TextInputFormatter>? inputFormatters,
    required TextEditingController controller,
    bool showInput = true,
    String? hintText,
    int? maxLines = 1,
    double height = 48,
    required String initial,
    EdgeInsetsGeometry? margin,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    const enableBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 1,
        color: AppColor.grey_C5C6CC,
        style: BorderStyle.solid,
      ),
    );

    const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 1,
        color: AppColor.red_FF616D,
        style: BorderStyle.solid,
      ),
    );

    InputBorder border() {
      if (customURL != null && initial == CustomURL && controller.text == '') {
        return errorBorder;
      }

      if (pixelID != null && initial == PixelID && controller.text == '') {
        return errorBorder;
      }

      if (customISI != null && initial == CustomISI && controller.text == '') {
        return errorBorder;
      }

      return enableBorder;
    }

    var inputDecoration = InputDecoration(
      hintStyle: AppText.Inter14w4_grey_8F9098,
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      focusedBorder: border(),
      enabledBorder: border(),
    );

    return showInput
        ? Container(
            margin: margin,
            height: height,
            child: TextField(
              keyboardType: TextInputType.text,
              controller: controller,
              style: AppText.Inter14w4_black,
              maxLines: maxLines,
              decoration: inputDecoration,
              onChanged: onChanged,
              inputFormatters: inputFormatters,
            ),
          )
        : Container();
  }

  Widget ErrorMsg(
    String text, {
    required String initial,
    EdgeInsets? margin,
    bool showMessage = true,
  }) {
    if (showMessage) {
      if (customURL == '' && initial == CustomURL) {
        return Container(
          alignment: Alignment.centerLeft,
          margin: margin,
          child: Text(text, style: AppText.Inter12w4_red_FF616D),
        );
      }
      if (pixelID == '' && initial == PixelID) {
        return Container(
          alignment: Alignment.centerLeft,
          margin: margin,
          child: Text(text, style: AppText.Inter12w4_red_FF616D),
        );
      }

      return Container();
    }

    return Container();
  }

  // Add Link Button
  Widget Button({
    OutlinedBorder? btnShape,
    double borderWidth = 1.0,
    Function? onPressed,
    EdgeInsets? padding,
    Alignment? btnTextAlgn,
    Color? backgroundColor,
    Color? foregroundColor,
    double radius = 12,
    double height = 0,
    Widget? tile,
    Widget? child,
    String? textBtn,
    bool showButton = true,
    TextStyle? textBtnStyle,
    EdgeInsetsGeometry? margin,
  }) {
    var shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
      side: BorderSide(
        width: borderWidth,
        color: AppColor.grey_C5C6CC,
        style: BorderStyle.solid,
      ),
    );

    var styleFrom = ElevatedButton.styleFrom(
      foregroundColor: foregroundColor,
      shadowColor: AppColor.transparent,
      shape: btnShape ?? shape,
      padding: padding,
      alignment: btnTextAlgn ?? Alignment.centerLeft,
      minimumSize: Size.fromHeight(height),
      backgroundColor: backgroundColor ?? AppColor.transparent,
    );

    var localText = Text(textBtn ?? '', style: textBtnStyle);
    var locaChild = child ??
        (tile == null
            ? localText
            : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                localText,
                SizedBox(width: 12, height: 12, child: tile),
              ]));

    var elevatedButton = ElevatedButton(
      onPressed: (() => onPressed != null ? onPressed() : null),
      style: styleFrom,
      child: locaChild,
    );

    return showButton
        ? Container(margin: margin, child: elevatedButton)
        : Container();
  }

  // 1 : Add Rotator CS Modal
  Future<dynamic> BottomModal(BuildContext context) {
    const shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
    );

    // function
    builder(BuildContext context) {
      double sheight = MediaQuery.of(context).size.height;

      // Choose Rotator CS
      return StatefulBuilder(builder: (context, setState) {
        return BottomModalBody(setState, sheight: sheight);
      });
    }

    return showModalBottomSheet(
      context: context,
      shape: shape,
      builder: builder,
    );
  }

  // 2 : Add Rotator CS
  Widget BottomModalBody(var setState, {double? sheight}) {
    debugPrint(cboxActive.toString());
    return Container(
      height: sheight! * 0.46,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(children: [
        // icons
        Container(
          height: 6,
          width: 38,
          margin: const EdgeInsets.symmetric(vertical: 13),
          child: AppIcon.dashboard_bottom_dialog_put,
        ),

        // header
        Container(
          height: 27,
          margin: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Cancel button
              GestureDetector(
                child: Text('Cancel', style: AppText.Inter12w6_blue_00AEFF),
                onTap: () {
                  setState(() => _cboxActive = List.from(cboxActive));
                  Navigator.pop(context);
                },
              ),

              // Title
              Text('Pilih CS', style: AppText.Inter12w6h14_black_1F2024),

              // Clear all button
              GestureDetector(
                onTap: () {
                  setState(() => cboxActive.clear());
                  setState(() => _cboxActive.clear());
                },
                child: Text('ClearAll', style: AppText.Inter12w6_blue_00AEFF),
              ),
            ],
          ),
        ),

        // main
        BottomModalMain(setState, sheight),

        Button(
          textBtnStyle: AppText.Inter12w6_white,
          textBtn: 'Pilih',
          height: 40,
          onPressed: () {
            setState(() => cboxActive = List.from(_cboxActive));
            Navigator.pop(context);
            FocusScope.of(context).requestFocus(FocusNode());
          },
          btnTextAlgn: Alignment.center,
          backgroundColor: AppColor.blue_00AEFF,
        ),
      ]),
    );
  }

  // 2 : Add Rotator CS
  Widget BottomModalMain(var setState, double sheight) {
    const boxDecoration = BoxDecoration(
        border: Border(
      bottom: BorderSide(width: 1.5, color: AppColor.grey_E8EDF0),
    ));

    var titleStyle = AppText.NunitoSans12w6h16_black_464E5F;
    var subtitleStyle = AppText.NunitoSans12w4h14_black_464E5F;

    const contentPading = EdgeInsets.symmetric(horizontal: 15, vertical: 4);

    return Container(
      height: sheight * 0.286,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ...listCS.map(
            (e) {
              var trailing = _cboxActive.contains(e['title'])
                  ? AppIcon.rotator_checkbox_active
                  : AppIcon.rotator_checkbox;

              var leading = CircleAvatar(
                backgroundImage: AssetImage(e['photo']),
              );

              return Container(
                decoration: boxDecoration,
                alignment: Alignment.centerLeft,
                child: ListTile(
                  onTap: () {
                    if (_cboxActive.contains(e['title'])) {
                      setState(() => _cboxActive.remove(e['title']));
                    } else {
                      setState(() => _cboxActive.add(e['title']));
                    }
                  },
                  contentPadding: contentPading,
                  leading: leading,
                  title: Text(e['title'], style: titleStyle),
                  subtitle: Text(e['phone'], style: subtitleStyle),
                  trailing: trailing,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
