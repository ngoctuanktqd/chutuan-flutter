import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';
import 'package:shoppinggetx/model/cart_model.dart';

class ProductController extends GetxController {
  RxList<CartModel> listCart = <CartModel>[].obs;

  addToCart(item) {
    final index =
        listCart.indexWhere((element) => element.idProduct == item.id);
    if (index != -1) {
      // Da co thi chi can tang so luong
      listCart[index].qtl++;
      listCart.refresh();
    } else {
      // chua co thi them vao
      listCart.add(
        CartModel(
          id: DateTime.now().millisecondsSinceEpoch,
          idProduct: item.id,
          qtl: 1,
          price: item.price,
          discount: item.discount,
        ),
      );
    }
  }

  removeCart(item, bool remove) {
    final index =
        listCart.indexWhere((element) => element.idProduct == item.id);
    if (remove) {
      listCart.remove(listCart[index]);
    } else {
      if (listCart[index].qtl > 1) {
        listCart[index].qtl--;
        listCart.refresh();
      } else {
        listCart.remove(listCart[index]);
      }
    }
  }

  goToProduct() {
    Get.toNamed(RouterName.product);
  }
}
