import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/search/data/repo/search_repo.dart';
import 'package:bookly/core/errors/Failures.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String category}) async {
    try {
      var data = await apiServices.get(
          endPoint: 'volumes?q=subject:$category&Filtering=free-ebooks');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          FailureServices.fromDioError(e),
        );
      }

      return left(
        FailureServices(
          e.toString(),
        ),
      );
    }
  }
}
