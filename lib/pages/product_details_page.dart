import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
    });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize=0;
  
void onTap(){
  if(selectedSize != 0){
    Provider.of<CartProvider>(context,listen: false)
     .addProduct(
      { 'id':widget.product['id'],
    'title' :widget.product['title'],
    'Price' :widget.product['Price'],
    'imageUrl':widget.product['imageUrl'],//14
    'company':widget.product['company'],
    'size':selectedSize,
      },
     );
     ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content:
       Text("Product added to your cart",
       style: TextStyle(color: Colors.black),),
       duration:  Duration(seconds: 1),
      backgroundColor: Color.fromARGB(255, 219, 219, 219),
       )
      
      );

  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content:
       Text("Please select your size",
       style: TextStyle(color: Colors.black),),
       duration:  Duration(seconds: 1),
       backgroundColor: Color.fromARGB(255, 219, 219, 219),
       )
      
      );

  }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: const Center(child:  Text('Details')),
      ),
         body:  Column(
          
          children: [
            
            Text(widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge
            ),
           const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(widget.product['imageUrl'] as String,
              height: 250,),
            ),
            
          const Spacer(flex: 2,),
            Container(
              height: 250,
              width: double.infinity,
              decoration:  const BoxDecoration(
                borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20), 
                        topRight: Radius.circular(20)
                        ),
                color: Color.fromARGB(208, 222, 229, 229)
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('\$${widget.product['Price']}',
                    style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context,index){
                        final size = (widget.product['sizes']as List<int>)[index];
                    
                        return Padding(
                          padding: const EdgeInsets.only(
                             left :8.0,
                             right :8.0,
                             bottom :8.0,
                             top :5.0,
                            ),
                          child: GestureDetector(
                            onTap:(){
                              setState(() {
                                selectedSize=size;
                              });
                            } ,
                            child: Chip(label: Text(size.toString()),
                            backgroundColor: selectedSize == size 
                            ? Theme.of(context).colorScheme.primary 
                            : null,
                            
                            
                            ),
                          ),
                        );
                      }
                      
                      
                      ),
                  ),
                  
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.shopping_cart_checkout,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          fixedSize: const Size(double.infinity, 50),
                        )
                      ),
                    ),
            
              ],
              ),
            )
          ],
         
         
                 
          
         )

    );
  }
}
