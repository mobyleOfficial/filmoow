import 'package:domain/exceptions.dart';
import 'package:domain/use_case/get_user_information_use_case.dart';
import 'package:filmoow/presentation/profile/profile/state/profile_state.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {
  ProfileBloc({
    required this.getUserInformationUseCase,
  }) {
    MergeStream([
      _getUserInformation(),
    ]).listen(_onNewState.add);
  }

  final GetUserInformationUseCase getUserInformationUseCase;
  final _onNewState = BehaviorSubject<ProfileState>.seeded(Loading());

  Stream<ProfileState> get onNewState => _onNewState;

  Stream<ProfileState> _getUserInformation() async* {
    yield Loading();

    try {
      final userInformation = await getUserInformationUseCase();

      yield Success(
        userInformation: userInformation,
      );
    } catch (error) {
      if (error is UnauthorizedException) {
        yield Unauthorized();
      }
    }
  }

  void dispose() {
    _onNewState.close();
  }
}
