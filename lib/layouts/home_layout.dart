import 'package:dsc_world_app/shared/cubit/cubit.dart';
import 'package:dsc_world_app/shared/cubit/data_cubit.dart';
import 'package:dsc_world_app/shared/cubit/data_states.dart';
import 'package:dsc_world_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, DscWorldStates>(
        listener: (BuildContext context, DscWorldStates state) {},
        builder: (BuildContext context, DscWorldStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
         
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: CircleAvatar(
                            child: Image.asset('assets/images/profile.png'),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'John Doe',
                          style:Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text('Dark mode'),
                    trailing: Switch(
                      value: AppCubit.get(context).isDark,
                      onChanged: (value) {
                        AppCubit.get(context).changeAppMode(value: value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.star), label: 'Favourite'),
              ],
            ),
          );
        },
      
    );
  }
}
