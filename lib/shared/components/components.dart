import 'package:dsc_world_app/model/country.dart';
import 'package:dsc_world_app/screens/countries_screen.dart';
import 'package:dsc_world_app/screens/country_screen.dart';
import 'package:dsc_world_app/shared/cubit/data_cubit.dart';
import 'package:dsc_world_app/shared/network/cashe_helper.dart';
import 'package:dsc_world_app/shared/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget continentCard(
        {required String continentName,
        required String imagePath,
        required BuildContext context}) =>
    InkWell(
      onTap: () {
        navigateTo(
            context,
            CountriesScreen(
              name: continentName,
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
          color: darkGrey,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(imagePath),
            ),
            Text(
              continentName,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
Widget countryWidget({
  Country? country,
  String name = '',
  required BuildContext context,
  required int index,
  bool favourited = false,
}) {
  return InkWell(
    onTap: () => navigateTo(
        context,
        CountryScreen(
          country: country,
        )),
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: darkGrey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: favourited
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            IconButton(
                onPressed: () => DataCubit.get(context)
                    .changeFavouriteStatus(key: country!.key,name: country.name),
                icon: favourited
                    ? Container()
                    : Icon(
                CasheHelper.getFavourite(key:  country!.key)== true
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.white,
                      ))
          ],
        ),
      ),
    ),
  );
}

Widget defaultTextFormField(
        {required TextEditingController controller,
        required TextInputType type,
        context,
        onSubmitted,
        onChanged,
        onTab,
        required validate,
        required String label,
        required IconData icon}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      validator: validate,
      onTap: onTab,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.deepOrange,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.deepOrange,
            width: 2.0,
          ),
        ),
        prefixIcon: Icon(
          icon,
        ),
        labelText: label,
        suffixStyle: TextStyle(color: Colors.white),
        labelStyle: Theme.of(context).textTheme.bodyText1,
      ),
    );
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
Widget buildCountryList(data, context, {isSearch = false}) {
  DataCubit cubit = DataCubit.get(context);

  return data.length == 0
      ? Center(child: CircularProgressIndicator())
      : ListView.separated(
          itemBuilder: (context, index) {

            return countryWidget(
              name: data[index].name,
              country: data[index],
              context: context,
              index: index,
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                height: 16,
              ),
          itemCount: data.length);
}

Widget searchItem({context, name}) => InkWell(
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: darkGrey,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
