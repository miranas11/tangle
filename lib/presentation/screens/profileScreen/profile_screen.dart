import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangle/bussiness/blocs/blocs.dart';
import 'package:tangle/data/models/models.dart';
import 'package:tangle/data/repositories/auth/auth_repository.dart';

import '../../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ProfileScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'PROFILE'),
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProfileLoaded) {
              User user = state.user;
              return Column(
                children: [
                  Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Theme.of(context).primaryColor.withOpacity(0.1),
                          Theme.of(context).primaryColor.withOpacity(0.9)
                        ]),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3, 3),
                            blurRadius: 3,
                            spreadRadius: 3,
                          )
                        ],
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrls[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context).primaryColor.withOpacity(0.1),
                            Theme.of(context).primaryColor.withOpacity(0.9)
                          ],
                        ),
                      ),
                    ),
                  ]),
                  //Below Main Image
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleWithWidget(
                            text: 'Biography', icon: Icons.edit),
                        Text(
                          user.bio,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(height: 1.5),
                        ),
                        const TitleWithWidget(
                            text: 'Pictures', icon: Icons.edit),
                        SizedBox(
                          height: 125,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: user.imageUrls.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Container(
                                  height: 125,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage(user.imageUrls[index]),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        const TitleWithWidget(
                            text: 'Location', icon: Icons.edit),
                        Text(
                          user.location,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(height: 1.5),
                        ),
                        const TitleWithWidget(
                            text: 'Interests', icon: Icons.edit),
                        Row(
                          children: [
                            CustomTextContainer(text: user.interests[0]),
                            CustomTextContainer(text: user.interests[1]),
                            CustomTextContainer(text: user.interests[2]),
                          ],
                        ),
                        TextButton(
                          onPressed: () => {
                            RepositoryProvider.of<AuthRepository>(context)
                                .signOut()
                          },
                          child: Center(
                            child: Text(
                              'SIGN OUT',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: Text('Something Went Wrong!'),
              );
            }
          },
        ),
      ),
    );
  }
}

class TitleWithWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const TitleWithWidget({
    required this.text,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline3,
        ),
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
        )
      ],
    );
  }
}
