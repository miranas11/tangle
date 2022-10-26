import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangle/bussiness/blocs/swipe/swipe_bloc.dart';
import 'package:tangle/presentation/config/app_router.dart';
import 'package:tangle/presentation/config/theme.dart';
import 'data/models/user_model.dart';
import 'presentation/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SwipeBloc()
            ..add(
              const LoadUser(
                users: User.users,
              ),
            ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: _appRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
        theme: theme(),
      ),
    );
  }
}
