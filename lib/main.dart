import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/new_detail_screen.dart';
import 'app_style.dart';
import 'size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'profile_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays:[SystemUiOverlay.top]);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex =0;

  void _onItemTapped(int index){
      setState(() {
        selectedIndex=index;
      });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    List<Widget> pages=[
      HomeScreen(),
      NewDetailScreen(),
      Scaffold(),
      ProfileScreen()
    ];


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kLighterWhite,
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kWhite,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: selectedIndex == 0 ?
            SvgPicture.asset('assets/home.svg',colorFilter: const ColorFilter.mode(kBlue, BlendMode.srcIn) ,):
                SvgPicture.asset('assets/home.svg',colorFilter: const ColorFilter.mode(kGrey, BlendMode.srcIn),),
              label: ''
            ),
            BottomNavigationBarItem(
                icon: selectedIndex == 1 ?
                SvgPicture.asset('assets/zoom.svg',colorFilter: const ColorFilter.mode(kBlue, BlendMode.srcIn),):
                SvgPicture.asset('assets/zoom.svg',),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: selectedIndex == 2 ?
                SvgPicture.asset('assets/notifi.svg',colorFilter: const ColorFilter.mode(kBlue, BlendMode.srcIn),):
                SvgPicture.asset('assets/notifi.svg',),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: selectedIndex == 3 ?
                SvgPicture.asset('assets/person.svg',colorFilter: const ColorFilter.mode(kBlue, BlendMode.srcIn),):
                SvgPicture.asset('assets/person.svg',),
                label: ''
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            Row(
              children: [
                Container(
                  height: 51,
                  width: 51,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kLightBlue,
                    image: const DecorationImage(image: NetworkImage('https://img.freepik.com/premium-psd/character-avatar-3d-illustration_460336-702.jpg?w=2000'))
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome Back!',style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal!*3,
                    ),),
                    Text('Wednesday, 8 October',style: kPoppinsRegular.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.blockSizeHorizontal!*2,
                    ),)
                  ],
                )
              ],
            ),
            const SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kWhite,
                boxShadow: [
                  BoxShadow(
                    color: kDarkBlue.withOpacity(0.051),
                    offset: const Offset(0.0, 3.0),
                    blurRadius: 24.0,
                    spreadRadius: 0.0,
                  )
                ]
              ),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        style: kPoppinsRegular.copyWith(
                          color: kBlue,
                          fontSize: SizeConfig.blockSizeHorizontal!*3
                        ),
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 13,
                          ),
                          hintText: 'Search for Article...',
                          border: kBorder,
                          errorBorder: kBorder,
                          disabledBorder: kBorder,
                          focusedBorder: kBorder,
                          focusedErrorBorder: kBorder,
                          hintStyle: kPoppinsRegular.copyWith(
                            color: kLightGrey,
                            fontSize: SizeConfig.blockSizeHorizontal!*3
                          ),
                        ),
                      )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kBlue,
                      borderRadius: BorderRadius.circular(kBorderRadius),

                    ),
                    child: IconButton(onPressed: (){},
                        icon: SvgPicture.asset('assets/search.svg')),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15,),

            SizedBox(
              height: 18,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 38),
                      child: Text('#Health',style: kPoppinsMedium.copyWith(
                        color: kGrey,
                        fontSize: SizeConfig.blockSizeHorizontal!*2,
                      ),),
                    );
                  }),
            ),
            const SizedBox(height: 30,),

            SizedBox(height: 325,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Container(
                    margin: const EdgeInsets.only(right: 20),
                     height: 304,
                    padding: const EdgeInsets.all(12),
                    width: 255,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: kDarkBlue.withOpacity(0.080),
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 24.0,
                            spreadRadius: 0.0,
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 164,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                    image: NetworkImage('https://www.travelinglifestyle.net/wp-content/uploads/2020/05/Beautiful-Places-Pakistan-To-Visit.jpg')
                              ),
                          ),
                        ),
                        const SizedBox(height: 16,),

                        Flexible(
                            child: Text(
                              'Naltar Valley is graced by charming and beautiful '
                                  'and has being one of a gorgeous place',
                              style: kPoppinsBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal!*2.5
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),),
                        const SizedBox(height: 16,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children:[
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: kLightBlue,
                              backgroundImage: AssetImage('assets/for_profile.png'),
                            ),
                            const SizedBox(width: 12,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Ali Hyder',
                                  style: kPoppinsSemiBold.copyWith(
                                    fontSize: SizeConfig.blockSizeHorizontal!*2
                                  ),),
                                const SizedBox(height: 2,),
                                Text('November 12, 2022',
                                  style: kPoppinsRegular.copyWith(
                                    fontSize: SizeConfig.blockSizeHorizontal!*2,
                                    color: kGrey,
                                  ),)
                              ],
                            )
                              ]),
                          Container( height: 38, width: 38,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kBorderRadius),
                              color: kLightWhite,
                            ),
                            child: SvgPicture.asset('assets/share_icon.svg'),
                          )],
                        )
                      ],
                    ),
                  );

            }),
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Short For You',style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal!*3,
                ),),
                TextButton(onPressed: (){},
                    child: Text('View All', style: kPoppinsMedium.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal!*2,
                      color: kBlue
                    ),))
              ],
            ),
            const SizedBox(height: 19,),
            SizedBox(
              height: 88,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context,index){
                return Container(
                  width: 208,
                  height: 88,
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kWhite,
                      boxShadow: [
                        BoxShadow(
                          color: kDarkBlue.withOpacity(0.051),
                          offset: const Offset(0.0, 3.0),
                          blurRadius: 24.0,
                          spreadRadius: 0.0,
                        )
                      ]
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        padding: const EdgeInsets.all(26),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                              image: NetworkImage('https://www.travelanddestinations.com/wp-content/uploads/2019/10/Beautiful-places-in-Pakistan.jpg')
                          )
                        ),
                        child: SvgPicture.asset('assets/play.svg'),
                      ),
                      const SizedBox(width: 12,),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Top Trending Island in 2022',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis ,
                            style: kPoppinsSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal!*2
                            ),),
                            const SizedBox(height: 4 ,),
                            Row(
                              children: [
                                const Icon(Icons.remove_red_eye_outlined,
                                  color: kGrey,
                                  size: 18,),
                                const SizedBox(width: 4,),
                                Text('50,999',style: kPoppinsMedium.copyWith(
                                  color: kGrey,
                                    fontSize: SizeConfig.blockSizeHorizontal!*1.5
                                ),)

                              ],
                            )

                          ],
                        ),
                      )
                    ],

                  ),
                );
                  }),
            )

          ],

        ) ,

    );
  }
}
