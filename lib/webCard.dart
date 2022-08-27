import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'menu.dart';
import 'plusMinus.dart';

class WebCards extends StatefulWidget {
  const WebCards({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  createState() => _WebCards();
}

class _WebCards extends State<WebCards> {
  late List<Product> _products;

  @override
  void initState() {
    super.initState();
    _products = widget.products;
    if (kDebugMode) {
      print('initState');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 450,
        childAspectRatio: 0.8,
      ),
      itemCount: _products.length,
      itemBuilder: (BuildContext context, int index) {
        return WebCard(product: _products[index]);
      },
    );
  }
}

class WebCard extends StatefulWidget {
  const WebCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _WebCard createState() => _WebCard();
}

class _WebCard extends State<WebCard> {
  late Product _product;
  bool focused = false;

  @override
  void initState() {
    super.initState();
    _product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (a) {
          setState(() {
            focused = true;
          });
        },
        onExit: (a) {
          setState(() {
            focused = false;
          });
        },
        child: Card(
          elevation: 5.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Column(
            children: [
              Stack(children: [
                Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(_product.image450),
                  )),
                ),
                IconButton(
                  icon: _product.favorite
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    setState(() {
                      _product.notFavorite();
                    });
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      icon: _product.count > 0
                          ? CircleAvatar(
                              backgroundColor: Colors.lightGreenAccent,
                              child: Text(_product.count.toString()),
                            )
                          : const Icon(Icons.shopping_cart_outlined),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return WebCardDialog(
                                product: _product,
                              );
                            });
                      }),
                ),
              ]),
              const SizedBox(
                height: 5,
              ),
              Text(
                _product.name!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('${_product.price} p.'),
              const SizedBox(
                height: 5,
              ),
              focused ? Text(_product.description!) : const Text(''),
            ],
          ),
        ));
  }
}

class WebCardDialog extends StatefulWidget {
  const WebCardDialog({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  createState() => _WebCardDialog();
}

class _WebCardDialog extends State<WebCardDialog> {
  late Product _product;

  @override
  void initState() {
    super.initState();
    _product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 20,
          ),
          Image.asset(_product.image600),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Text(
                  _product.name!,
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  _product.description!,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text('${_product.price} p.'),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Продолжить покупки'))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
