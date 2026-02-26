import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_store_app/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HmSlider({super.key, required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  final CarouselSliderController _sliderController = CarouselSliderController();
  int _currentIndex = 0;
  Widget _getSlider() {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider(
        carouselController: _sliderController,
        items: widget.bannerList.map((item) {
          return SizedBox.expand(
            child: Image.network(
              item.imgUrl,
              fit: BoxFit.cover, // 关键点：铺满
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 240, //
          viewportFraction: 1,
          autoPlay: true,
          onPageChanged: (int index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '搜索...',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _getDots() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (int index) {
            return GestureDetector(
              onTap: () {
                _sliderController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300), // 动画持续时间
                  curve: Curves.easeInOut, // 动画曲线
                );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                width: _currentIndex == index ? 40 : 20,
                height: 6,
                margin: EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
  }
}
