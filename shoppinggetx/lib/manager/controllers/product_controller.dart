import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';
import 'package:shoppinggetx/model/cart_model.dart';
import 'package:shoppinggetx/model/product_model.dart';

class ProductController extends GetxController {
  // di toi router
  goToProduct(id) {
    Get.toNamed(RouterName.product, arguments: id);
  }

  // Xu ly san pham
  ProductModel getProductById(id) {
    int index =
        DataConstant.listProduct.indexWhere((element) => element.id == id);
    if (index != -1) {
      return DataConstant.listProduct[index];
    } else {
      return DataConstant.listProduct[0];
    }
  }

// Xu ly gio hang
  RxList<CartModel> listCart = <CartModel>[].obs;

  updateToCart(qtl, item) {
    final index =
        listCart.indexWhere((element) => element.idProduct == item.id);
    if (qtl > 0) {
      listCart[index].qtl = qtl;
      listCart.refresh();
    } else {
      listCart.remove(listCart[index]);
      listCart.refresh();
    }
  }

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

  // Xu ly san pham yeu thich
  RxList<ProductModel> listFavorit = <ProductModel>[].obs;
  setFavorit(item) {
    final index = listFavorit.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      // Da co thi chi can tang so luong
      listFavorit.remove(listFavorit[index]);
      listFavorit.refresh();
    } else {
      // chua co thi them vao
      listFavorit.add(item);
    }
  }
}
