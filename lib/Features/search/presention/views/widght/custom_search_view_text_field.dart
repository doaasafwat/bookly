import 'package:bookly/Features/search/presention/manger/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key});

  final textController = TextEditingController();
  final textKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: textKey,
      child: TextFormField(
        controller: textController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This Field is required';
          } else {
            return null;
          }
        },
        onFieldSubmitted: (value) {
          if (textKey.currentState!.validate()) {
            BlocProvider.of<SearchCubit>(context)
                .fetchSearchedBooks(catagory: value);
            textController.clear();
          }
        },
        decoration: InputDecoration(
          hintText: 'Search',
          suffixIcon: IconButton(
            onPressed: () {
              if (textKey.currentState!.validate()) {
                BlocProvider.of<SearchCubit>(context)
                    .fetchSearchedBooks(catagory: textController.text);
                textController.clear();
              }
            },
            icon: const Icon(
              Icons.search_rounded,
              size: 25,
            ),
          ),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
