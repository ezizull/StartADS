import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Scriptmatic/data/blocs/article/without_cubit/article/article_bloc.dart';
import 'package:Scriptmatic/data/models/article.dart';
import 'package:Scriptmatic/ui/screens/article/entry_article_without_cubit_screen.dart';
import 'package:Scriptmatic/utils/colors.dart' as AppColor;
import 'package:Scriptmatic/utils/extensions.dart' as AppExt;

class ArticleScreenWithoutCubitScreen extends StatefulWidget {
  const ArticleScreenWithoutCubitScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreenWithoutCubitScreen> createState() =>
      _ArticleScreenWithoutCubitScreenState();
}

class _ArticleScreenWithoutCubitScreenState
    extends State<ArticleScreenWithoutCubitScreen> {
  late ArticleBloc _articleBloc;

  @override
  void initState() {
    _articleBloc = ArticleBloc()..add(ArticleFetched());
    super.initState();
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
            create: (context) => _articleBloc,
          ),
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<ArticleBloc, ArticleState>(
                  listener: (context, state) {
                if (state is ArticleSuccess) {
                  debugPrint("SUKSES FETCH");
                }
                if (state is ArticleFailure) {
                  debugPrint("GAGAL FETCH :" + state.message);
                  const SnackBar(
                    margin: EdgeInsets.zero,
                    duration: Duration(seconds: 2),
                    content: Text('GAGAL'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  );
                }
              })
            ],
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text("List Article Without Cubit"),
              ),
              body: Container(
                  child: BlocBuilder<ArticleBloc, ArticleState>(
                      builder: (context, state) => state is ArticleLoading
                          ? const Center(child: CircularProgressIndicator())
                          : state is ArticleFailure
                              ? const Center(child: Text("terjadi kesalahan"))
                              : state is ArticleSuccess
                                  ? Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            bool isRefresh =
                                                await AppExt.pushScreen(context,
                                                    const EntryArticleWithoutCubitScreen());
                                            if (isRefresh) {
                                              _articleBloc
                                                  .add(ArticleFetched());
                                            }
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 70,
                                            color: AppColor.blue_00AEFF,
                                            child: const Center(
                                                child: Text(
                                                    "Klik Tambah Article")),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListView.separated(
                                            itemCount: state.data!.length,
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                              height: 5,
                                            ),
                                            itemBuilder: (context, index) {
                                              Article article =
                                                  state.data![index];
                                              return Card(
                                                child: Column(
                                                  children: [
                                                    Text(article.id.toString()),
                                                    Text(article.title),
                                                    Text(article.body)
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink())),
            )));
  }
}
