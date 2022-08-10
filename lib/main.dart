import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/core/utils/constants.dart';
import 'package:clean_architecture/injector.dart';
import 'package:clean_architecture/presentation/blocs/article/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleBloc>(
      create: (_) => getIt.get<ArticleBloc>()..add(GetArticles()),
      child: MaterialApp(
        title: kAppTitle,
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
