import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presention/views/widget/book_rating.dart';
import 'package:bookly/Features/home/presention/views/widget/custom_book_image.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_routers.dart';

import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookItemListView extends StatelessWidget {
  const BookItemListView({super.key, required this.books});
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetails, extra: books);
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: books.volumeInfo.imageLinks?.thumbnail ??
                    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.indiamart.com%2Fproddetail%2Fcomputer-science-book-18932105288.html&psig=AOvVaw1qBpPRrLj_qObtmTQOKOXk&ust=1714844221344000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPDRp9eC8oUDFQAAAAAdAAAAABAJ'),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      books.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGtSectraFine),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    books.volumeInfo.authors![0],
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: books.volumeInfo.averageRating ?? 0,
                        count: books.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
