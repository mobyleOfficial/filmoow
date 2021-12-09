import 'package:domain/exceptions.dart';
import 'package:meta/meta.dart';

abstract class UseCase<Params, Response> {
  @protected
  Future<Response> getRawFuture({Params? params});
}

abstract class UseCaseImpl<Params, Response> extends UseCase<Params, Response> {
  Future<Response> call() {
    try {
      return getRawFuture();
    } catch (error) {
      if (error is! FilmoowException) {
        throw GenericException();
      } else {
        rethrow;
      }
    }
  }
}

abstract class ParametrizedUseCaseImpl<Params, Response>
    extends UseCase<Params, Response> {
  Future<Response> call(Params params) {
    try {
      return getRawFuture(params: params);
    } catch (error) {
      if (error is! FilmoowException) {
        throw GenericException();
      } else {
        rethrow;
      }
    }
  }
}
