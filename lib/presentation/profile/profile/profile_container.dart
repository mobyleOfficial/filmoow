import 'package:domain/use_case/get_user_information_use_case.dart';
import 'package:filmoow/presentation/common/async_snapshot_response_view.dart';
import 'package:filmoow/presentation/profile/profile/profile_bloc.dart';
import 'package:filmoow/presentation/profile/profile/profile_page.dart';
import 'package:filmoow/presentation/profile/profile/state/profile_state.dart';
import 'package:filmoow/presentation/profile/sign_in/sign_in_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() =>
      ProxyProvider<GetUserInformationUseCase, ProfileBloc>(
        update: (_, getUserInformationUseCase, bloc) =>
            bloc ??
            ProfileBloc(
              getUserInformationUseCase: getUserInformationUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<ProfileBloc>(
          builder: (_, bloc, __) => ProfileContainer(
            bloc: bloc,
          ),
        ),
      );

  final ProfileBloc bloc;

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: bloc.onNewState,
        builder: (_, snapshot) =>
            AsyncSnapshotResponseView<Loading, Success, Error>(
          snapshot: snapshot,
          successWidgetBuilder: (success) => ProfilePage(
            userInformation: success.userInformation,
          ),
          errorWidgetBuilder: (error) {
            if (error is Unauthorized) {
              return SignInContainer.create();
            }

            return Container(
              color: Colors.red,
            );
          },
        ),
      );
}
