import 'package:flutter_telegram_bot/config/import.dart';

class ProductController extends GetxController {
  List<ProductModel> products = productFromModel(AppDatabse.products);
  GetStorage base = GetStorage();
  List cartProducts = [];

  fetchCartProduct() {
    cartProducts = base.read('cart-product') ?? [];
  }

  add(ProductModel product) async {
    await fetchCartProduct();
    var index =
        cartProducts.indexWhere((element) => element['id'] == product.id);
    if (index > -1) {
      cartProducts[index]['count']++;
    } else {
      cartProducts.add({
        "id": product.id,
        "title": product.title,
        "price": product.price,
        "count": product.count
      });
    }

    base.write('cart-product', cartProducts);
    Get.snackbar("Bajarildi", "Mahsulot qo'shildi");
    print(cartProducts);
  }

  rem(ProductModel product) async {
    await fetchCartProduct();
    var index =
        cartProducts.indexWhere((element) => element['id'] == product.id);
    if (index > -1) {
      cartProducts[index]['count']--;
    } else {
      cartProducts.remove({
        "id": product.id,
        "title": product.title,
        "price": product.price,
        "count": product.count
      });
    }

    base.write('cart-product', cartProducts);
    Get.snackbar("Ayrildi", "Mahsulot ayrildi");
    print(cartProducts);
  }
}
