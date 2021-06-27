import 'package:dsc_world_app/model/country.dart';
import 'package:dsc_world_app/shared/cubit/cubit.dart';
import 'package:dsc_world_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({Key? key, required this.country}) : super(key: key);
  final Country? country;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, DscWorldStates>(
        listener: (context, state) {},
        builder: (context, state) {
          print(country!.name);
          return Scaffold(
            appBar: AppBar(
              title: Text(country!.name),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Native',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        subtitle: Text(
                          country!.native,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Phone',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        subtitle: Text(
                          country!.phone,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'continent',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        subtitle: Text(
                          country!.continent,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'capital',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        subtitle: Text(
                          country!.capital,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'currency',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        subtitle: Text(
                          country!.native,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      ListTile(
                          title: Text(
                            'languages',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          subtitle: getLanguages(country!.languages,context)),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget getLanguages(List<dynamic> languages,BuildContext context) {
    String language = '';
    for (int i = 0; i < languages.length; i++) {
      language = language + "  " + languages[i];
    }
    return Text(
      language,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
