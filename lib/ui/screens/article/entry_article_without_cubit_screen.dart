import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/data/blocs/article/without_cubit/article/article_bloc.dart';
import 'package:startercode_project/utils/extensions.dart' as AppExt;

class EntryArticleWithoutCubitScreen extends StatefulWidget {
  const EntryArticleWithoutCubitScreen({Key? key}) : super(key: key);

  @override
  State<EntryArticleWithoutCubitScreen> createState() =>
      _EntryArticleWithoutCubitScreenState();
}

class _EntryArticleWithoutCubitScreenState
    extends State<EntryArticleWithoutCubitScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleCtrl = TextEditingController(text: '');
  final TextEditingController _bodyCtrl = TextEditingController(text: '');

  late final ArticleBloc _articleBloc = ArticleBloc();

  @override
  void initState() {
    super.initState();
  }

  void _handleSubmit() {
    _articleBloc.add(ArticleAdded(_titleCtrl.text, _bodyCtrl.text));
  }

  @override
  void dispose() {
    _articleBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => _articleBloc,
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ArticleBloc, ArticleState>(
            listener: (context, state) {
              if (state is ArticleSuccess) {
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
              if (state is ArticleFailure) {
                debugPrint("GAGAL " + state.message);
                const SnackBar(
                  margin: EdgeInsets.zero,
                  duration: Duration(seconds: 2),
                  content: Text('GAGAL'),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                );
              }
            },
          )
        ],
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Form Artikel Without Cubit"),
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
                  ElevatedButton(
                      onPressed: _handleSubmit, child: const Text("Submit"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
