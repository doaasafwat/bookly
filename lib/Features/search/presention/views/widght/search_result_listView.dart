import 'package:bookly/Features/home/presention/views/widget/book_item_list_view.dart';
import 'package:bookly/Features/search/presention/manger/search_cubit/search_cubit.dart';
import 'package:bookly/core/widght/custom_error_widget.dart';
import 'package:bookly/core/widght/custom_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
              itemCount: state.books.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookItemListView(
                    books: state.books[index],
                  ),
                );
              });
        } else if (state is SearchFailure) {
          return CustomErrorWidght(
            erroeMessage: state.erroMessage,
          );
        } else if (state is SearchInitial) {
          return const Center(
            child: Text('No results yet'),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
