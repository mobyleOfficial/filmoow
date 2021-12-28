import 'package:domain/use_case/sign_in_use_case.dart';
import 'package:filmoow/presentation/profile/sign_in/state/sign_in_action.dart';
import 'package:filmoow/presentation/profile/sign_in/state/sign_in_state.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc {
  SignInBloc({
    required this.signInUseCase,
  }) {
    _onSignInSubject
        .flatMap(
          (token) => _signIn(token),
        )
        .listen(_onNewState.add);
  }

  final SignInUseCase signInUseCase;
  final _onNewState = BehaviorSubject<SignInState>.seeded(Idle());
  final _onNewAction = PublishSubject<SignInAction>();
  final _onSignInSubject = PublishSubject<String>();

  Stream<SignInState> get onNewState => _onNewState;

  Stream<SignInAction> get onNewAction => _onNewAction;

  Stream<SignInState> _signIn(String token) async* {
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
