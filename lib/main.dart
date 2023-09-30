import 'package:coredumpedapp/app_routes.dart';
import 'package:coredumpedapp/bloc/auth/auth_bloc.dart';
import 'package:coredumpedapp/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Core Dumped APP',
          theme: ThemeData(
            useMaterial3: true,
          ),
          initialRoute: '/splash',
          getPages: AppRoutes.routes,
        ),
      ),
    );
  }
}
