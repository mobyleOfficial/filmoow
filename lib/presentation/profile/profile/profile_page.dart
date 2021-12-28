import 'package:domain/model/user_information.dart';
import 'package:domain/model/watched_time.dart';
import 'package:filmoow/presentation/common/remote_image.dart';
import 'package:filmoow/presentation/common/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    required this.userInformation,
    Key? key,
  }) : super(key: key);

  final UserInformation userInformation;

  WatchedTime get watchedTime => userInformation.watchedTime;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Perfil'),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: Sizes.dp8,
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    //todo: logout
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.signOutAlt,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: Sizes.dp10,
                left: Sizes.dp10,
                right: Sizes.dp10,
              ),
              child: Column(
                children: [
                  Center(
                    child: RemoteImage(
                      width: Sizes.dp100,
                      height: Sizes.dp100,
                      imageUrl: userInformation.imageUrl,
                    ),
                  ),
                  Text(userInformation.name),
                  Text(userInformation.userName),
                  const SizedBox(
                    height: Sizes.dp10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _StatsInformation(
                        stats: userInformation.seenNumber,
                        text: "Vistos",
                        onTap: () {
                          //todo: do something
                        },
                      ),
                      _StatsInformation(
                        stats: userInformation.commentNumber,
                        text: "Comentados",
                        onTap: () {
                          //todo: do something
                        },
                      ),
                      _StatsInformation(
                        stats: userInformation.listNumber,
                        text: "Listas",
                        onTap: () {
                          //todo: do something
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Sizes.dp10,
                  ),
                  Wrap(
                    children: [
                      const Text(
                        'Tempo assistido: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${watchedTime.days} dias, '
                        '${watchedTime.hours} horas e '
                        '${watchedTime.minutes} minutos',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Sizes.dp10,
                  ),
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      _ProfileItem(
                        title: 'Atividades',
                        onTap: () {
                          //todo: do something
                        },
                      ),
                      _ProfileItem(
                        title: 'Mensagens',
                        onTap: () {
                          //todo: do something
                        },
                      ),
                      _ProfileItem(
                        title: 'Solicitações',
                        onTap: () {
                          //todo: do something
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.dp8,
                        ),
                        child: Divider(
                          thickness: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _StatsInformation extends StatelessWidget {
  const _StatsInformation({
    required this.stats,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final int stats;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(
            Sizes.dp8,
          ),
          child: Column(
            children: [
              Text(
                stats.toString(),
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      );
}

class _ProfileItem extends StatelessWidget {
  const _ProfileItem({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.dp8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(
              thickness: 1.5,
            ),
            InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(title),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
