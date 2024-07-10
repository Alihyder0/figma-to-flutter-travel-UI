import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/app_style.dart';
import 'package:travel_app/size_config.dart';

class NewDetailScreen extends StatelessWidget {
  const NewDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kLighterWhite,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical!*110,
              child: Stack(
                children: [
                  const FullScreenSlider(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:  Container(
                      height: 50,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(42),
                          topRight: Radius.circular(42)
                        ),
                        color: kLighterWhite,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, -16, 0),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text('HUNZA VALLEY',
                style: kPoppinsBold.copyWith(
                  color: kDarkBlue,
                  fontSize: SizeConfig.blockSizeHorizontal!*3
                ) ,),),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 40,
              vertical: 20),
              height: 54,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal!*2),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius
                ),
                border: Border.all(
                    color: kBorderColor)
              ),
              child: Row(
                children: [

                  const CircleAvatar(
                    radius: 12,
                    backgroundColor: kBlue,
                    backgroundImage:
                    NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6wxpQXlzN3rve70xBEXB9q021chZ9TQZ7Aw&usqp=CAU'),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal!*2.5,
                  ),
                  Text('Emily Lush April 1 • 8 min read',
                    maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kPoppinsRegular.copyWith(
                    color: kGrey,
                    fontSize: SizeConfig.blockSizeHorizontal!*1.8
                  ),)
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'If you live in Pakistan – or have read anything about the country – it’s almost certain you’ve come across the name Hunza. Don’t let the word ‘valley’ confuse you, though – '
                  'Hunza is actually a massive district made up of numerous'
                  ' valleys and villages. One part of the ancient Silk Road,'
                  ' here are some of the most beautiful sights in Hunza.',
              style: kPoppinsMedium.copyWith(
                color: kDarkBlue,
                fontSize: SizeConfig.blockSizeHorizontal!*2
              ),
            ),),
            SizedBox(height: SizeConfig.blockSizeVertical!*5,)
          ],
        ),
      ),
    );
  }
}

final List<String> imageList = [
  'https://wander-lush.org/wp-content/uploads/2020/01/SwatValleyPakistanSAKhanPhotographyCanvaPro.jpg',
  'https://wander-lush.org/wp-content/uploads/2020/12/Beautiful-places-in-Pakistan-Hunza-Valley-undefinedGetty-CanvaPro.jpg',
  'https://wander-lush.org/wp-content/uploads/2020/01/YarkhunValleySamanthaIntentionalDetours.jpg'
];

class FullScreenSlider extends StatefulWidget {
  const FullScreenSlider({super.key});

  @override
  State<FullScreenSlider> createState() => _FullScreenSliderState();
}

class _FullScreenSliderState extends State<FullScreenSlider> {
  int _current =1;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
            items: imageList.map((item) => Center(
              child: Image.network(item,
                fit: BoxFit.cover,
              height: SizeConfig.blockSizeVertical!*110,
              width: double.infinity,
              ),
            )).toList(),
            options: CarouselOptions(
              height: SizeConfig.blockSizeVertical!*110,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason){
                setState(() {
                  _current = index;
                });
              },
              initialPage: _current,
            ),

        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(padding: const EdgeInsets.only(bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList
                .asMap()
                .entries
                .map((entry) =>
                GestureDetector(
                  onTap: ()=> _controller.animateToPage(entry.key),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6),
                  child: SvgPicture.asset(_current == entry.key?
                  'assets/carousel_indicator_enabled.svg':
                  'assets/carousel_indicator_disabled.svg'),),
                )).toList(),
          ),),
        ),
        Align(alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 70,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      kBorderRadius
                    ),
                    border: Border.all(
                      color: kWhite
                    )
                  ),
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/arrow_back_icon.svg'),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          kBorderRadius
                      ),
                      border: Border.all(
                          color: kWhite
                      )
                  ),
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/Book_mark_icon.svg'),
                )

              ],
            ),
          ),
        )
      ],
    );
  }
}
