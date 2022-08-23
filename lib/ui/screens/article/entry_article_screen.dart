import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/data/blocs/article/use_cubit/create_article/create_article_cubit.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;
import 'package:startercode_project/utils/extensions.dart' as AppExt;

class EntryArticleScreen extends StatefulWidget {
  const EntryArticleScreen({Key? key}) : super(key: key);

  @override
  State<EntryArticleScreen> createState() => _EntryArticleScreenState();
}

class _EntryArticleScreenState extends State<EntryArticleScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleCtrl = TextEditingController(text: '');
  final TextEditingController _bodyCtrl = TextEditingController(text: '');

  late final CreateArticleCubit _createArticleCubit = CreateArticleCubit();

  @override
  void initState() {
    super.initState();
  }

  void _handleSubmit() {
    _createArticleCubit.addArticle(
        title: _titleCtrl.text, bodyArticle: _bodyCtrl.text);
  }

  @override
  void dispose() {
    _createArticleCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => _createArticleCubit,
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener(
            bloc: _createArticleCubit,
            listener: (context, state) {
              if (state is CreateArticleSuccess) {
                AppExt.popScreen(context, true);
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      margin: EdgeInsets.zero,
                      duration: Duration(seconds: 2),
                      content: Text('SUKSES'),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
              }
              if (state is CreateArticleFailure) {
                debugPrint("GAGAL " + state.message);
              }
            },
          )
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.appPrimary,
            centerTitle: true,
            title: const Text("Form Artikel"),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text("Title"),
                  TextFormField(
                    controller: _titleCtrl,
                  ),
                  const Text("Body"),
                  TextFormField(
                    controller: _bodyCtrl,
                  ),
                  TextButton(
                    onPressed: _handleSubmit,
                    child: const Text("Submit"),
                    style: TextButton.styleFrom(
                      primary: AppColor.black,
                      backgroundColor: AppColor.primary,
                      onSurface: AppColor.grey, // Disable color
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
