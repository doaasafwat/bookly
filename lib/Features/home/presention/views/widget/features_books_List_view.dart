import 'package:bookly/Features/home/presention/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presention/views/widget/custom_book_image.dart';
import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/widght/custom_error_widget.dart';
import 'package:bookly/core/widght/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FearuresBookListView extends StatelessWidget {
  const FearuresBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kBookDetails,
                            extra: state.books[index]);
                      },
                      child: CustomBookImage(
                        imageUrl: state.books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.indiamart.com%2Fproddetail%2Fcomputer-science-book-18932105288.html&psig=AOvVaw1qBpPRrLj_qObtmTQOKOXk&ust=1714844221344000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPDRp9eC8oUDFQAAAAAdAAAAABAJ',
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidght(erroeMessage: state.erroMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
