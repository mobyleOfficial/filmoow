import 'package:domain/use_case/sign_in_use_case.dart';
import 'package:filmoow/presentation/profile/user_info/state/user_info_action.dart';
import 'package:filmoow/presentation/profile/user_info/state/user_info_state.dart';
import 'package:rxdart/rxdart.dart';

class UserInfoBloc {
  UserInfoBloc({
    required this.signInUseCase,
  }) {
    _onSignInSubject
        .flatMap(
          (token) => _signIn(token),
        )
        .listen(_onNewState.add);
  }

  final SignInUseCase signInUseCase;
  final _onNewState = BehaviorSubject<UserInfoState>.seeded(Idle());
  final _onNewAction = PublishSubject<UserInfoAction>();
  final _onSignInSubject = PublishSubject<String>();

  Stream<UserInfoState> get onNewState => _onNewState;

  Stream<UserInfoAction> get onNewAction => _onNewAction;

  Stream<UserInfoState> _signIn(String token) async* {
    yield Loading();

    try {
      await signInUseCase(token);
      _onNewAction.add(NavigateToUserProfile());
    } catch (error) {
      print('Do something');
    } finally {
      yield Idle();
    }
  }

  void signIn(String token) => _onSignInSubject.add(token);

  void dispose() {
    _onNewState.close();
    _onNewAction.close();
  }
}
