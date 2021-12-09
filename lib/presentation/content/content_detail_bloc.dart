import 'package:filmoow/presentation/content/state/content_detail_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:domain/use_case/get_content_detail_use_case.dart';

class ContentDetailBloc {
  ContentDetailBloc({
    required this.id,
    required this.getContentDetailUseCase,
  }) {
    MergeStream([
      _getContentDetail(id),
    ]).listen(_onNewState.add);
  }

  final String id;
  final GetContentDetailUseCase getContentDetailUseCase;
  final BehaviorSubject<ContentDetailState> _onNewState =
      BehaviorSubject<ContentDetailState>();

  Stream<ContentDetailState> get onNewState => _onNewState;

  Stream<ContentDetailState> _getContentDetail(String id) async* {
    try {
      final contentDetail = await getContentDetailUseCase(id);
      yield Success(
        contentDetail: contentDetail,
      );
    } catch (error) {
      yield Error();
    }
  }

  void dispose() {
    _onNewState.close();
  }
}
