import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/app_style.dart';
import 'package:travel_app/size_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kLighterWhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPZob-roOCV5Q54sF9k0oRrvRZ846yMMAtJg&usqp=CAU',
                      fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal!*3,),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Elly Byers',style: kPoppinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal!*2.0
                            ),),
                            Text('Author & Writer',style: kPoppinsRegular.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal!*1.5
                            ),),
                          ],
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 42,
                            maxWidth: SizeConfig.blockSizeHorizontal!*13,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              kBorderRadius,
                            ),
                            color: kBlue,
                          ),
                          child: Center(
                            child: Text(
                              'Following',style: kPoppinsMedium.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal!*1.5,
                              color: kWhite
                            ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical!*8,),
              Text('Every piece of chocolate I ever ate is getting back '
                  ' at me.. desserts are very revengeful..',style: kPoppinsMedium.copyWith(
              fontSize: SizeConfig.blockSizeHorizontal!*1.6,
                  color: kGrey
              ),),
              SizedBox(height: SizeConfig.blockSizeVertical!*6,),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal!*3,
                vertical: SizeConfig.blockSizeVertical!*6),
              decoration: BoxDecoration(
                color: kDarkBlue,
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            Text('54.21k',style: kPoppinsBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal!*2.0,
                                color: kWhite
                            ),),
                            Text('Followers',style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal!*1.6,
                                color: kWhite
                            ),)
                          ],
                        ),
                    ),
                    Container(
                      width: 1,
                      height: SizeConfig.blockSizeVertical!*10,
                      decoration: const BoxDecoration(
                        color: kLighterBlue
                      ),
                    ),

                    Expanded(
                        child: Column(
                          children: [
                            Text('2.11k',style: kPoppinsBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal!*2.0,
                                color: kWhite
                            ),),
                            Text('Posts',style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal!*1.6,
                                color: kWhite
                            ),)
                          ],
                        )),
                    Container(
                      width: 1,
                      height: SizeConfig.blockSizeVertical!*10,
                      decoration: const BoxDecoration(
                          color: kLighterBlue
                      ),
                    ),

                    Expanded(
                        child: Column(
                          children: [
                            Text('36.40k',style: kPoppinsBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal!*2.0,
                                color: kWhite
                            ),),
                            Text('Following',style: kPoppinsMedium.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal!*1.6,
                                color: kWhite
                            ),)
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical!*8,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Emily's Post", style: kPoppinsBold.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal!*2.5,
                  ),),
                  Text("View all",style: kPoppinsRegular.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal!*2.0,
                    color: kBlue
                  ),)
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical!*8,),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Container(
                        height: 100,
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.blockSizeVertical!*4),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(kBorderRadius),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 24,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 3),
                                    color: kDarkBlue.withOpacity(0.051)
                                  )
                                ]
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(kBorderRadius),
                                child: Image.network('https://wander-lush.org/wp-content/uploads/2020/01/SwatValleyPakistanSAKhanPhotographyCanvaPro.jpg',
                                  fit: BoxFit.cover,),
                              ),
                            ),
                            SizedBox(width: SizeConfig.blockSizeHorizontal!*3,),
                            Expanded(
                                child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('News: Politics', style: kPoppinsRegular.copyWith(
                                  color: kGrey,
                                  fontSize: SizeConfig.blockSizeHorizontal!*1.5
                                ),),
                                SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                                Text("Iran's raging protests Fifth Iranian paramilitary me..."
                                ,maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: kPoppinsSemiBold.copyWith(
                                    fontSize: SizeConfig.blockSizeHorizontal!*1.7,
                                  ),),
                                SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/calender_icon.svg'),
                                        SizedBox(width: SizeConfig.blockSizeHorizontal!*1,),
                                        Text('16th July',
                                          style: kPoppinsRegular.copyWith(
                                            color: kGrey,
                                            fontSize: SizeConfig.blockSizeHorizontal!*1.5
                                          ) ,)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/clock_icon.svg'),
                                        SizedBox(width: SizeConfig.blockSizeHorizontal!*1,),
                                        Text('8:32 pm',
                                          style: kPoppinsRegular.copyWith(
                                              color: kGrey,
                                              fontSize: SizeConfig.blockSizeHorizontal!*1.5
                                          ) ,)
                                      ],
                                    ),
                                  ],
                                )

                              ],
                            ))
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical!*4,),
              Row(
                children: [
                  Text('Popular from Emily',
                    style: kPoppinsBold.copyWith(
                      color: kDarkBlue,
                      fontSize: SizeConfig.blockSizeHorizontal!*2
                    ),),
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical!*6,),
              SizedBox(
                height: 143,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: 10,

                    itemBuilder: (context, index){
                      return Container(
                        height: 143,
                        width: 248,
                        margin: EdgeInsets.only(
                            right: SizeConfig.blockSizeHorizontal!*2.5 ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          child: Image.network(  'https://wander-lush.org/wp-content/uploads/2020/01/YarkhunValleySamanthaIntentionalDetours.jpg'
                          ,fit: BoxFit.cover,),
                        ),

                      );
                    }),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical!*8,)



            ],
          ),
        ),
      ),
    );
  }
}
