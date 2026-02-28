import 'package:hm_store_app/constants/index.dart';
import 'package:hm_store_app/utils/DioRequest.dart';
import 'package:hm_store_app/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  // 先获取到数据 断言为list
  // list在map循环，给返回的数据转移成BannerItem类型
  // 将转义好的数据转换成list
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}


Future<List<CategoryItem>> getCategoryListAPI() async {
  // 先获取到数据 断言为list
  // list在map循环，给返回的数据转移成BannerItem类型
  // 将转义好的数据转换成list
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ) {
    return CategoryItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}

// 特惠推荐
Future<SpecialRecommendResult> getProductListAPI() async {
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.PRODUCT_LIST)
  );
}