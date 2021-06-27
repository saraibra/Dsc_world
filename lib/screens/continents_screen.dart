import 'package:dsc_world_app/model/country.dart';
import 'package:dsc_world_app/shared/components/components.dart';
import 'package:dsc_world_app/shared/cubit/cubit.dart';
import 'package:dsc_world_app/shared/cubit/data_cubit.dart';
import 'package:dsc_world_app/shared/cubit/data_states.dart';
import 'package:dsc_world_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContinentsScreen extends StatelessWidget {
  const ContinentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    BlocConsumer<AppCubit, DscWorldStates>(
        listener: (BuildContext context, DscWorldStates state) {},
        builder: (BuildContext context, DscWorldStates state) {
   
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  continentCard(
                      continentName: "Africa",
                      imagePath: 'assets/images/africa.png',
                      context: context),
                  continentCard(
                      continentName: "Europe",
                      imagePath: 'assets/images/europe.png',
                      context: context)
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  continentCard(
                      continentName: "Asia",
                      imagePath: 'assets/images/asia.png',
                      context: context),
                  continentCard(
                      continentName: "Australia",
                      imagePath: 'assets/images/australia.png',
                      context: context)
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  continentCard(
                      continentName: "South America",
                      imagePath: 'assets/images/south_america.png',
                      context: context),
                  continentCard(
                      continentName: "North America",
                      imagePath: 'assets/images/north_america.png',
                      context: context)
                ],
              ),
              SizedBox(
                height: 16,
              ),
                    continentCard(
                      continentName: "Antarctica",
                      imagePath: 'assets/images/antarctic.png',
                      context: context)
            ],
          ),
        ),
       );}
    );
  }
}
