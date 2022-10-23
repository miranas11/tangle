import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangle/presentation/widgets/homeScreen/choice_button.dart';

import '../../../bussiness/blocs/swipe/swipe_bloc.dart';
import '../../../data/models/models.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key, required this.user}) : super(key: key);

  static const String routeName = '/user';

  static Route route({required User user}) {
    return MaterialPageRoute(
      builder: (_) => UserScreen(user: user),
      settings: const RouteSettings(name: routeName),
    );
  }

  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<SwipeBloc, SwipeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Hero(
                      tag: 'user_image',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              user.imageUrls[0],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Hero(
                        tag: 'choice_butons',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ChoiceButton(
                              height: 60,
                              width: 60,
                              size: 25,
                              icon: Icons.clear_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                              hasGradient: false,
                            ),
                            const ChoiceButton(
                              height: 80,
                              width: 80,
                              size: 30,
                              icon: Icons.favorite,
                              color: Colors.white,
                              hasGradient: true,
                            ),
                            ChoiceButton(
                              height: 60,
                              width: 60,
                              size: 25,
                              icon: Icons.watch_later,
                              color: Theme.of(context).primaryColor,
                              hasGradient: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name}, ${user.age}',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    user.jobTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    user.bio,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.normal,
                          height: 2,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Interests',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Row(
                    children: user.interests
                        .map(
                          (interest) => Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(top: 5, right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.secondary,
                                  Theme.of(context).primaryColor,
                                ],
                              ),
                            ),
                            child: Text(
                              interest,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}
