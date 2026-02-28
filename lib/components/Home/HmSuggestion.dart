import 'package:flutter/material.dart';
import 'package:hm_store_app/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  SpecialRecommendResult specialRecommendResult;
  HmSuggestion({super.key, required this.specialRecommendResult});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  Widget _builderHeader() {
    return Row(
      children: [
        Text(
          '特惠推荐',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color.fromARGB(255, 86, 24, 20),
          ),
        ),
        SizedBox(width: 10),
        Text(
          '精选省钱攻略',
          style: TextStyle(
            color: Color.fromARGB(255, 86, 24, 20),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _builderLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/home_cmd_inner.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 获取数据
  List<GoodsItem> _getDisplayItems() {
    // return widget.specialRecommendResult.subTypes.first.goodsItems.items
    //     .take(3)
    //     .toList();
    final subTypes = widget.specialRecommendResult.subTypes;

    if (subTypes.isEmpty) {
      return [];
    }

    final items = subTypes.first.goodsItems.items;

    if (items.isEmpty) {
      return [];
    }

    return items.take(3).toList();
  }

  List<Widget> _getChildrenList() {
    List<GoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (int index) {
      final item = list[index];
      return Column(
        children: [
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item.picture),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red,
            ),
            width: 80,
            child: Text(
              '\$:${item.price}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: AssetImage('lib/assets/home_cmd_sm.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            _builderHeader(),
            SizedBox(height: 10),
            Row(
              children: [
                _builderLeft(),
                SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _getChildrenList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
