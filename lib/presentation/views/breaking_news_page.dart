import 'package:clean_architecture/core/enums/request_state_enum.dart';
import 'package:clean_architecture/presentation/blocs/article/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreakingNewsPage extends HookWidget {
  const BreakingNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useEffect(() {
      scrollController
          .addListener(() => _onScrollListener(context, scrollController));
      return scrollController.dispose;
    }, [scrollController]);

    return Scaffold(
      appBar: AppBar(title: const Text('Breaking news')),
      body: BlocConsumer<ArticleBloc, ArticleState>(
        listener: (context, state) {
          if (state.state == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!.message),
                backgroundColor: Colors.red[900],
              ),
            );
          }
        },
        builder: (context, state) {
          return ListView.separated(
            controller: scrollController,
            itemCount: state.state == RequestState.loading
                ? state.articles.length + 1
                : state.articles.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12.0);
            },
            itemBuilder: (context, index) {
              if (index == state.articles.length) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }
              final article = state.articles[index];

              return ListTile(
                leading: Container(
                  width: 80.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: article.urlToImage != null
                      ? Image.network(
                          article.urlToImage!,
                          fit: BoxFit.cover,
                          width: 80.0,
                          height: 120.0,
                        )
                      : null,
                ),
                title: Text(
                  article.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                subtitle: Text(
                  article.description ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                onTap: () => _navigateToArticleDetails(context),
              );
            },
          );
        },
      ),
    );
  }

  void _onScrollListener(BuildContext context, ScrollController controller) {
    final maxScroll = controller.position.maxScrollExtent;
    final offset = controller.position.pixels;

    if (maxScroll == offset) {
      context.read<ArticleBloc>().add(GetArticles());
    }
  }

  void _navigateToArticleDetails(BuildContext context) {
    Navigator.pushNamed(context, '/article');
  }
}
