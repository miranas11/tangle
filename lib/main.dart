import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangle/bussiness/blocs/auth/auth_bloc.dart';
import 'package:tangle/bussiness/blocs/swipe/swipe_bloc.dart';
import 'package:tangle/data/repositories/auth_repository.dart';
import 'package:tangle/presentation/config/app_router.dart';

import 'data/models/models.dart';
import 'presentation/screens/screens.dart';
import 'package:tangle/presentation/config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
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
          initialRoute: OnBoardingScreen.routeName,
          theme: theme(),
        ),
      ),
    );
  }
}
