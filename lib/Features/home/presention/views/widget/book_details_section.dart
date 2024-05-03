import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presention/views/widget/book_rating.dart';
import 'package:bookly/Features/home/presention/views/widget/button_action.dart';
import 'package:bookly/Features/home/presention/views/widget/custom_book_image.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.20),
          child: CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ??
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.indiamart.com%2Fproddetail%2Fcomputer-science-book-18932105288.html&psig=AOvVaw1qBpPRrLj_qObtmTQOKOXk&ust=1714844221344000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPDRp9eC8oUDFQAAAAAdAAAAABAJ',
          ),
        ),
        const SizedBox(
          height: 33,
        ),
        Text(
          book.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors![0],
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BookRating(
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 33,
        ),
        ButtonAction(
          books: book,
        ),
      ],
    );
  }
}
