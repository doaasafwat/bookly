import 'package:bookly/Features/home/presention/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presention/views/widget/book_item_list_view.dart';
import 'package:bookly/core/widght/custom_error_widget.dart';
import 'package:bookly/core/widght/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BesrSellerListView extends StatelessWidget {
  const BesrSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookItemListView(
                  books: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidght(erroeMessage: state.erroMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
