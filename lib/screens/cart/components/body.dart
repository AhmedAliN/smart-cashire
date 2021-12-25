import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_cashier/providers/cartProvider.dart';
import 'package:smart_cashier/providers/service/cartService.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CartProvider cartProvider;
  CartService cartService;

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartService = new CartService(cartProvider);
    cartProvider.reset();
    cartService.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Consumer<CartProvider>(builder: (context, model, child) {
          if (model.load) {
            return Center(child: CircularProgressIndicator());
          } else if (model.hasError || model.cart.isEmpty) {
            return Center(
              child: Text('noDAta'),
            );
          } else {
            return ListView.builder(
              itemCount: model.cart.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(model.cart[index].products.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) async {
                
                    await cartService.removeCart(model.cart[index]);
                    //  model.removeCart(model.cart[index]);
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: CartCard(model.cart[index]),
                ),
              ),
            );
          }
        }));
  }
}
