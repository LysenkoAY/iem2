import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'menu.dart';
import 'plusMinus.dart';

class AndroidCards extends StatefulWidget {
  const AndroidCards({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  createState() => _AndroidCards();
}

class _AndroidCards extends State<AndroidCards> {
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
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (BuildContext context, int index) {
        return AndroidCard(product: _products[index]);
      },
    );
  }
}

class AndroidCard extends StatefulWidget {
  const AndroidCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _AndroidCard createState() => _AndroidCard();
}

class _AndroidCard extends State<AndroidCard> {
  late Product _product;
  bool focused = false;

  @override
  void initState() {
    super.initState();
    _product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AndroidCardDialog(
                product: _product,
                onValueChanged: (product) {setState(() {});},
              );
            });
      },
      child: Card(
        elevation: 2.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Stack(children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_product.image450),
                          fit: BoxFit.fill,
                        ),
                      ),
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
                  ])),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      _product.name!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      _product.description!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: false,
                      style: const TextStyle(fontSize: 10),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    _product.count == 0
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _product.incCount();
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.lightGreen),
                              ),
                              child: Text(
                                '${_product.price.toString()} p.',
                              ),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            child: Row(children: [
                              PlusMinus(
                                product: _product,
                                onValueChanged: (p) {
                                  setState(() {});
                                },
                              ),
                              Text('${_product.count * _product.price} p.')
                            ]),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AndroidCardDialog extends StatefulWidget {
  const AndroidCardDialog({Key? key, required this.product, required this.onValueChanged}) : super(key: key);
  final Product product;
  final ValueChanged<Product> onValueChanged;

  @override
  createState() => _AndroidCardDialog();
}

class _AndroidCardDialog extends State<AndroidCardDialog> {
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(_product.image450),
            const SizedBox(
              height: 20,
            ),
            Text(
              _product.name!,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              _product.description!,
              style: const TextStyle(fontSize: 10),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              PlusMinus(
                product: _product,
                onValueChanged: (p) {
                  setState(() {});
                },
              ),
              Text('${_product.count * _product.price} p.')
            ]),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Продолжить покупки')),
          ],
        ),
      ),
    );
  }
}
