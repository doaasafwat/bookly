import 'package:bookly/Features/home/presention/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presention/views/widget/custom_book_image.dart';
import 'package:bookly/core/widght/custom_error_widget.dart';
import 'package:bookly/core/widght/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookListview extends StatelessWidget {
  const SimilarBookListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.17,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                      imageUrl: state
                              .books[index].volumeInfo.imageLinks?.thumbnail ??
                          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.indiamart.com%2Fproddetail%2Fcomputer-science-book-18932105288.html&psig=AOvVaw1qBpPRrLj_qObtmTQOKOXk&ust=1714844221344000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPDRp9eC8oUDFQAAAAAdAAAAABAJ',
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidght(erroeMessage: state.erroMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
