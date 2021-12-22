abstract class AuthSecureDataSource {
  Future<void> upsertAccessToken(String accessToken);

  Future<String?> getAccessToken();

  Future<void> deleteAccessToken();
}