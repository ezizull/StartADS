// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/data/blocs/article/use_cubit/fetch_articles/fetch_articles_cubit.dart';
import 'package:startercode_project/data/models/article.dart';
import 'package:startercode_project/ui/screens/screens.dart';
import 'package:startercode_project/utils/colors.dart' as AppColor;
import 'package:startercode_project/utils/typography.dart' as AppText;
import 'package:startercode_project/utils/extensions.dart' as AppExt;

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final FetchArticlesCubit _fetchArticlesCubit = FetchArticlesCubit()
    ..fetchArticles();

  late ScrollController scrollController = ScrollController();
  late bool showTop = true;

  @override
  void initState() {
    scrollController.addListener(() {
      // debugPrint(scrollController.offset.toInt().toString());
      setState(() {
        scrollController.offset.toInt() <= 0 ? showTop = true : showTop = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _fetchArticlesCubit.close();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => _fetchArticlesCubit,
          ),
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener(
                  bloc: _fetchArticlesCubit,
                  listener: (context, state) {
                    if (state is FetchArticlesSuccess) {
                      debugPrint("SUKSES FETCH");
                    }
                    if (state is FetchArticlesFailure) {
                      debugPrint("GAGAL FETCH :" + state.message);
                    }
                  })
            ],
            child: Scaffold(
              backgroundColor: AppColor.white,
              body: BlocBuilder(
                  bloc: _fetchArticlesCubit,
                  builder: (context, state) => state is FetchArticlesLoading
                      ? const Center(child: CircularProgressIndicator())
                      : state is FetchArticlesFailure
                          ? const Center(child: Text("terjadi kesalahan"))
                          : state is FetchArticlesSuccess
                              ? Column(
                                  children: [
                                    Container(
                                      height: showTop ? 300 : 100,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      color: showTop
                                          ? AppColor.blue_00AEFF
                                          : AppColor.white,
                                      child: showTop
                                          ? Container()
                                          : Container(
                                              alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.only(
                                                  top: 18, left: 18),
                                              child: Text(
                                                "List Data",
                                                style: AppText.Pops22w9_primary,
                                              )),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: showTop ? 560 : 760,
                                          color: AppColor.white_D4D6DD,
                                          padding: const EdgeInsets.only(
                                            bottom: 80,
                                          ),
                                          child: ListView(
                                            controller: scrollController,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            children: [
                                              SizedBox(
                                                height: showTop ? 560 : 760,
                                                child: ListView.separated(
                                                  itemCount: state.data.length,
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const SizedBox(
                                                    height: 12,
                                                  ),
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    Article article =
                                                        state.data[index];
                                                    return Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 14,
                                                        vertical: 12,
                                                      ),
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      decoration: BoxDecoration(
                                                        color: AppColor.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color: AppColor
                                                                .grey_777C7E,
                                                            offset:
                                                                Offset(0, 3),
                                                            blurRadius: 6,
                                                            spreadRadius: -6,
                                                          )
                                                        ],
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            article.title,
                                                            style: AppText
                                                                .Pops28w6_white,
                                                          ),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                          Text(
                                                            article.body,
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: AppText
                                                                .Pops10w4_black,
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          left: 10,
                                          right: 10,
                                          bottom: 5,
                                          child: InkWell(
                                            onTap: () async {
                                              bool isRefresh =
                                                  await AppExt.pushScreen(
                                                              context,
                                                              const EntryArticleScreen()) ==
                                                          Null
                                                      ? false
                                                      : true;
                                              if (isRefresh) {
                                                _fetchArticlesCubit
                                                    .fetchArticles();
                                              }
                                            },
                                            child: Container(
                                              height: 60,
                                              alignment: Alignment.center,
                                              child: Text(
                                                "New Article",
                                                style: AppText.Pops18w8_black,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColor.blue_00AEFF,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink()),
            )));
  }
}
