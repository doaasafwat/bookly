import 'package:bookly/Features/home/presention/views/widget/similar_book_ListView.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('You can also like',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 15,
        ),
        const SimilarBookListview(),
      ],
    );
  }
}
