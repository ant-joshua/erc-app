import 'package:erc_app/core/models/menu.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final List<HomeMenu> _menuList = [
    HomeMenu(name: 'Sermon', image: "assets/icons/sermon.svg"),
    HomeMenu(name: 'Join Cool', image: "assets/icons/cool.svg"),
    HomeMenu(name: 'Seat Booking', image: "assets/icons/booking.svg"),
    HomeMenu(name: 'All Menu', image: "assets/icons/all_menu.svg")
    // {"name": "Sermon"},
    // {"name": "Join Cool"},
    // {"name": "Seat Booking"},
    // {"name": "All Menu"}
    // // "Sermon",
    // "Join Cool",
    // "Seat Booking",
    // "All Menu"
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: imgList
                  .map(
                    (e) => Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 2.0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            e,
                            fit: BoxFit.cover,
                            width: 600,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(
            width: width,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  // runAlignment: WrapAlignment.spaceBetween,
                  children: [
                    ..._menuList
                        .map(
                          (value) => InkWell(
                            child: Expanded(
                              child: Column(
                                children: [
                                  (value.image != null)
                                      ? Container(
                                          height: 50,
                                          constraints: const BoxConstraints(
                                            maxHeight: 100,
                                            maxWidth: 80,
                                            minWidth: 50,
                                            minHeight: 50,
                                          ),
                                          padding: const EdgeInsets.all(2.0),
                                          child: SvgPicture.asset(
                                            value.image ?? '',
                                            fit: BoxFit.contain,
                                          ),
                                        )
                                      : const SizedBox(),
                                  Text(value.name),
                                ],
                              ),
                            ),
                            onTap: () => {},
                          ),
                        )
                        .toList()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
