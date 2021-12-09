import 'package:dio/dio.dart';
import 'package:filmoow/data/remote/data_source/content/content_remote_data_source.dart';
import 'package:filmoow/data/remote/model/content_detail_remote_model.dart';

class ContentRemoteDataSourceImpl implements ContentRemoteDataSource {
  const ContentRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<ContentDetailRemoteModel> getContentDetail(String id) async {
    final response = await dio.get('/content/$id');

    return ContentDetailRemoteModel.fromJson(response.data);
  }
}
