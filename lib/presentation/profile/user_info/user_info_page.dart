import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({
    required this.signIn,
    Key? key,
  }) : super(key: key);

  final ValueChanged<String> signIn;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(
          24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                FaIcon(
                  FontAwesomeIcons.film,
                  color: Colors.black,
                ),
                Text(
                  'Bem-vindo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text('Escolha o método de acesso'),
                TextButton(
                  onPressed: () async {
                    final token =
                        await Navigator.of(context, rootNavigator: true)
                            .pushNamed(
                      RouteNameBuilder.getLoginRoute(),
                    );

                    if (token != null) {
                      signIn(token as String);
                    }
                  },
                  child: const Text(
                    'Entrar com Filmow',
                  ),
                ),
                const Text('- Ou -'),
                TextButton(
                  onPressed: () {},
                  child: const Text('Entrar com Facebook ou Twitter'),
                ),
                const Text('- Ou -'),
                TextButton(
                  onPressed: () {},
                  child: const Text('Cadastre-se'),
                ),
              ],
            ),
            const Text(
              'Esse app não é afiliado ao Filmow. Todas as informações '
              'aqui contidas são oriundas e de responsabilidade do Filmow.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
}
