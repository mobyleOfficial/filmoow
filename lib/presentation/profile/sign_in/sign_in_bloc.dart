import 'package:filmoow/presentation/profile/sign_in/state/sign_in_state.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc {
  final BehaviorSubject<SignInState> _onNewState =
      BehaviorSubject<SignInState>();

  Stream<SignInState> get onNewState => _onNewState;

  void dismissLoading() {
    _onNewState.value = Success();
  }

  void showLoading() {
    _onNewState.value = Loading();
  }

  void dispose() {
    _onNewState.close();
  }
}
