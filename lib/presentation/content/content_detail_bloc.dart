import 'package:domain/model/seen_status.dart';
import 'package:domain/use_case/change_seen_status_use_case.dart';
import 'package:domain/use_case/get_content_detail_use_case.dart';
import 'package:filmoow/presentation/content/state/content_detail_state.dart';
import 'package:filmoow/presentation/content/state/seen_status_state.dart';
import 'package:rxdart/rxdart.dart';

class ContentDetailBloc {
  ContentDetailBloc({
    required this.id,
    required this.getContentDetailUseCase,
    required this.changeSeenStatusUseCase,
  }) {
    MergeStream([
      _getContentDetail(id),
    ]).listen(_onNewState.add);
  }

  final String id;
  final GetContentDetailUseCase getContentDetailUseCase;
  final ChangeSeenStatusUseCase changeSeenStatusUseCase;
  final BehaviorSubject<ContentDetailState> _onNewState =
      BehaviorSubject<ContentDetailState>();
  final BehaviorSubject<SeenStatusState> _onSeenStatus =
      BehaviorSubject<SeenStatusState>();

  Stream<ContentDetailState> get onNewState => _onNewState;

  Stream<SeenStatusState> get onSeenStatus => _onSeenStatus;

  Stream<ContentDetailState> _getContentDetail(String id) async* {
    try {
      final contentDetail = await getContentDetailUseCase(id);
      _onSeenStatus.value = StatusSuccess(
        status: contentDetail.seenStatus,
      );

      yield Success(
        contentDetail: contentDetail,
      );
    } catch (error) {
      yield Error();
    }
  }

  Future<void> changeSeenStatus(
    SeenStatus status,
  ) async {
    _onSeenStatus.value = StatusLoading();

    try {
      final id = this.id.split('-').last.replaceAll('t', '').replaceAll('/', '');

      await changeSeenStatusUseCase(
        ChangeSeenStatusUseCaseParams(
          id: id,
          status: status,
        ),
      );

      _onSeenStatus.value = StatusSuccess(
        status: status,
      );
    } catch (error) {
      print(error);
    }
  }

  void dispose() {
    _onNewState.close();
    _onSeenStatus.close();
  }
}
