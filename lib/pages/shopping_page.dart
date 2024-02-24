import 'package:flutter_telegram_bot/config/import.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShState();
}

class _ShState extends State<ShoppingPage> {
  Map user = GetStorage().read('user');

  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user['name'] + "ning harid oynasi"),
      ),
      body: ListView.builder(
          itemCount: controller.cartProducts.length,
          itemBuilder: (context, index) {
            var item = controller.products[index];
            return ProductItems(
                item: item,
                onTapadd: () {
                  controller.add(item);
                },
                onTaprem: () {
                  controller.rem(item);
                });
          }),
    );
  }
}

class ProductItems extends StatelessWidget {
  ProductItems({
    super.key,
    required this.item,
    required this.onTapadd,
    required this.onTaprem,
  });
  ProductModel item;
  Function onTapadd;
  Function onTaprem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            Text(
              item.id.toString() + " kg",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      onTapadd();
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.green,
                    )),
                Text(
                  (item.id * item.price).toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () {
                      onTaprem();
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
