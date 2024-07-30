import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
//import 'package:shop_app_flutter/global_variable.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) { 
    final cart = context.watch<CartProvider>().cart;
    
    //final cart = Provider.of<CartProvider>(context).cart;
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text('Cart')),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
        final cartItem=cart[index];

   
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            radius: 45,
          ),
          trailing: IconButton(
            onPressed: (){
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context){
                  return  AlertDialog(
                    
                    title: Text('Delete Product',
                    style: Theme.of(context).textTheme.titleMedium,
                    ),
                    content: const Text(
                      'Are you sure you want to delete the product ?'
                      ),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();

                        },
                        child: const Text('No',
                        style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        ),
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                        Provider.of<CartProvider>(context,listen: false)
                        .removeproduct(cartItem) ;
                        Navigator.of(context).pop();
                        },
                        child: const Text('yes',
                        style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.red,
                        )
                        ),

                      )
                    ],
                  );
                });
            },
          icon: const Icon(Icons.delete,
          color: Color.fromARGB(255, 255, 71, 57),
          ),
          
          ),
          title: Text(
            cartItem['title'].toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          subtitle: Text('size: ${cartItem['size']}'),
        );

        },
      )
    );
  }
}