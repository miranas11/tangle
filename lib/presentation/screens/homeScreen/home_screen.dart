import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangle/presentation/widgets/widgets.dart';
import '../../../bussiness/blocs/swipe/swipe_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Tangle',
      ),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeLoaded) {
            return Column(
              children: [
                InkWell(
                  onDoubleTap: () => Navigator.pushNamed(context, '/user',
                      arguments: state.users[0]),
                  child: Draggable(
                    feedback: UserCard(user: state.users[0]),
                    childWhenDragging: UserCard(user: state.users[1]),
                    axis: Axis.horizontal,
                    onDragEnd: (drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        context
                            .read<SwipeBloc>()
                            .add(SwipeLeft(user: state.users[0]));
                        print('Swipe Left');
                      } else {
                        context
                            .read<SwipeBloc>()
                            .add(SwipeRight(user: state.users[0]));
                        print("Swipe Right");
                      }
                    },
                    child: UserCard(
                      user: state.users[0],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 30),
                  child: Hero(
                    tag: 'choice_buttons',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<SwipeBloc>()
                                .add(SwipeLeft(user: state.users[0]));
                            print('Swipe Left');
                          },
                          child: ChoiceButton(
                            height: 60,
                            width: 60,
                            size: 25,
                            icon: Icons.clear_rounded,
                            color: Theme.of(context).colorScheme.secondary,
                            hasGradient: false,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<SwipeBloc>()
                                .add(SwipeRight(user: state.users[0]));
                            print('Swipe Right');
                          },
                          child: const ChoiceButton(
                            height: 80,
                            width: 80,
                            size: 30,
                            icon: Icons.favorite,
                            color: Colors.white,
                            hasGradient: true,
                          ),
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
                )
              ],
            );
          } else {
            return const Text("ERROR");
          }
        },
      ),
    );
  }
}
