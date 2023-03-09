import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jappa/cubit/app_cubit_states.dart';
import 'package:jappa/cubit/app_cubits.dart';
import 'package:jappa/misc/colors.dart';
import 'package:jappa/widgets/app_buttons.dart';
import 'package:jappa/widgets/app_large_text.dart';
import 'package:jappa/widgets/app_text.dart';
import 'package:jappa/widgets/responsive_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int gottenStarts = 3;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          //This will include our state (DetailState) and the information that is stored in it
          DetailState detail = state as DetailState;

          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                //Background image
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                          'http://mark.bslmeiyu.com/uploads/${detail.place.img}'),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                //Menu icon
                Positioned(
                    left: 20,
                    top: 50,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        )
                      ],
                    )),
                //Body
                Positioned(
                  top: 320,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Name and amount
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: AppLargeText(
                                    text: detail.place.name.toString(),
                                    color: Colors.black.withOpacity(0.8)),
                              ),
                              AppLargeText(
                                text: '\$ ${detail.place.price}',
                                color: AppColors.mainColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          //Location
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(width: 5),
                              AppText(
                                text: detail.place.location.toString(),
                                color: AppColors.textColor1,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          //Rating
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star,
                                    color: index < detail.place.stars!
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              AppText(
                                text: '(${detail.place.stars}.0)',
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          AppLargeText(
                            text: 'People',
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          SizedBox(height: 5),
                          AppText(
                            text: 'Number of people in your group',
                            color: AppColors.mainTextColor,
                          ),
                          SizedBox(height: 10),
                          //Buttons
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: AppButtons(
                                    text: (index + 1).toString(),
                                    size: 50,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          AppLargeText(
                            text: 'Description',
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          SizedBox(height: 10),
                          AppText(
                            text: detail.place.description.toString(),
                            color: AppColors.mainTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Bottom bar
                Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButtons(
                          size: 60,
                          color: AppColors.textColor1,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor1,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        SizedBox(width: 20),
                        ResponsiveButton(
                          isResponsive: true,
                        ),
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
