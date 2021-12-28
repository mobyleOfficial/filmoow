import 'package:filmoow/presentation/profile/filmow_sign_in/state/filmow_sign_in_state.dart';
import 'package:rxdart/rxdart.dart';

class FilmowSignInBloc {
  final BehaviorSubject<FilmowSignInState> _onNewState =
      BehaviorSubject<FilmowSignInState>();

  Stream<FilmowSignInState> get onNewState => _onNewState;

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
