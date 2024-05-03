import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presention/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presention/views/book_details_view.dart';
import 'package:bookly/Features/home/presention/views/home_view.dart';
import 'package:bookly/Features/search/presention/views/search_view.dart';
import 'package:bookly/Features/splash/presention/views/splash_view.dart';
import 'package:bookly/core/utils/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';
  static const kBookDetails = '/BookDetails';
  static const kSearchView = '/SearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetails,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImp>(),
          ),
          child: BookDetailsView(
            books: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
