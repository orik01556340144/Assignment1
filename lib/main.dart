import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String image;
  final double price;
  final String description;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
}

class MyApp extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Neighbourhood Cat',
      image: 'https://placekitten.com/200/200',
      price: 500.00,
      description: 'Stray picked up cat and vaccinated',
    ),
    Product(
      name: 'NewBorn kitten',
      image: 'https://placekitten.com/201/201',
      price: 600.00,
      description: 'A newly born kitten ',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
          foregroundColor: Colors.red[400],
          backgroundColor: Colors.green[800],
        ),
        body: Padding(
          padding:  EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              Product product = products[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Image.network(
                    product.image,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Product Price: ${product.price.toStringAsFixed(2)  } tk',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    product.description,
                    style:  TextStyle(fontSize: 16),
                  ),
                   SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyNowPage(
                            itemName: product.name,
                            itemPrice: product.price.toStringAsFixed(2),
                          ),
                        ),
                      );
                    },
                    child:  Text('Buy Now'),
                  ),
                   Divider(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class BuyNowPage extends StatelessWidget {
  final String itemName;
  final String itemPrice;

  BuyNowPage({
    required this.itemName,
    required this.itemPrice,
    Key? key,
  }) : super(key: key);

  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Section'),
        foregroundColor: Colors.red[400],
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Choose Payment Method',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PaymentMethodButton(image: 'images/bkash.png'),
                  const SizedBox(width: 16),
                  PaymentMethodButton(image: 'images/nagad.png'),
                  const SizedBox(width: 16),
                  PaymentMethodButton(image: 'images/rocket.png'),
                  const SizedBox(width: 16),
                  PaymentMethodButton(image: 'images/mastercard.png'),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Choose Pick Up',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: 'Select Pick UP',
                onChanged: (value) {},
                items: [
                  DropdownMenuItem(
                    child: const Text('Select Pick UP'),
                    value: 'Select Pick UP',

                  ),
                  DropdownMenuItem(
                    child: const Text('Home PICK UP'),
                    value: 'Home PICK UP',

                  ),
                  DropdownMenuItem(
                    child: const Text('Store Pickup'),
                    value: 'Store Pickup',

                  ),
                ],
              ),

              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class PaymentMethodButton extends StatelessWidget {
  final String image;

   PaymentMethodButton({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
