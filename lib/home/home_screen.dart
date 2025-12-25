// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../repository/home_repository.dart';
// import 'home_bloc/home_bloc.dart';
// import 'home_bloc/home_state.dart';
//
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//     //  create: (_) => HomeBloc(HomeRepository())..add(FetchHomeData()),
//       create: (_) => HomeBloc(HomeRepository())..add(FetchHomeData()),
//       child: Scaffold(
//         appBar: AppBar(title: const Text("Home")),
//         body: BlocBuilder<HomeBloc, HomeState>(
//           builder: (context, state) {
//             if (state.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//
//             if (state.error != null) {
//               return Center(child: Text(state.error!));
//             }
//
//             return ListView.builder(
//               itemCount: state.items.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(state.items[index].title),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }




/// From cubit
///
///
///
import 'package:bloc_demo/home/home_screen_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/home_repository.dart';
import 'home_bloc/home_bloc.dart';
import 'home_bloc/home_state.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //  create: (_) => HomeBloc(HomeRepository())..add(FetchHomeData()),
      create: (_) => HomeCubit(HomeRepository())..fetchHomeData(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: Text(state.error!));
            }

            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.items[index].title),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
