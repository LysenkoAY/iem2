import 'package:flutter/material.dart';
import 'menu.dart';

class PlusMinus extends StatefulWidget {
  const PlusMinus({
    Key? key,
    required this.product,
    required this.onValueChanged,
  }) : super(key: key);

  final Product product;
  final ValueChanged<Product> onValueChanged;

  @override
  createState() => _PlusMinusState();
}

class _PlusMinusState extends State<PlusMinus> {
  late Product _product;

  @override
  void initState() {
    super.initState();
    _product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      MaterialButton(
        minWidth: 60,
        onPressed: () {
          setState(() {
            if (_product.count > 0) {
              _product.count--;
              widget.onValueChanged(_product);
            }
          });
        },
        color: Theme.of(context).primaryColor,
        shape: const CircleBorder(),
        child: const Text('-'),
      ),
      Text(_product.count.toString()),
      MaterialButton(
        minWidth: 60,
        onPressed: () {
          setState(() {
            _product.count++;
            widget.onValueChanged(_product);
          });
        },
        color: Theme.of(context).primaryColor,
        shape: const CircleBorder(),
        child: const Text('+'),
      ),
    ]);
  }
}
