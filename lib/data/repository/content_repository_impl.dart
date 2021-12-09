import 'package:domain/model/content_detail.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:filmoow/data/remote/data_source/content/content_remote_data_source.dart';
import 'package:filmoow/data/remote/mappers/remote_to_domain_mapper.dart';

class ContentRepositoryImpl implements ContentRepository {
  const ContentRepositoryImpl({
    required this.dataSource,
  });

  final ContentRemoteDataSource dataSource;

  @override
  Future<ContentDetail> getContentDetail(String id) async {
    final contentRemoteModel = await dataSource.getContentDetail(id);

    return contentRemoteModel.toDomain();
  }
}
