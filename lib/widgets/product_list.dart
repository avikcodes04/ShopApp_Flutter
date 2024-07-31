import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//helloo
import 'package:shop_app_flutter/global_variable.dart';
import'package:shop_app_flutter/widgets/product_card.dart';
import 'package:shop_app_flutter/pages/product_details_page.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {



  final List<String> filters= const ['All','Adidas','Nike','Bata','Puma','Souled Store'];
  late String selectedFilter;
  @override
  void initState(){
    super.initState();
    selectedFilter=filters[0];
  }
  @override
  Widget build(BuildContext context) {
   
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 191, 191, 191)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );
    return SafeArea(

        child: Column(
          children: [
             Row(
              children: [
                 Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Shoe\nCollections',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                  child:  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,

                    ),
                  ),
                ),
                
              ],
            ),


            SizedBox(
              height:75,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context,index){
                  final filter =filters[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedFilter=filter;
                          //print(selectedFilter);
                        });
                      },
                      child: Chip(
                        side: BorderSide.none,
                        backgroundColor: selectedFilter == filter ? Theme.of(context).colorScheme.primary :
                         const Color.fromARGB(181, 207, 207, 207),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        label: Text(filter,
                        style: const TextStyle(
                          fontSize: 16,)
                          ),
                      ),
                    ),
                  );

                },
              ),
            ),

    
            Expanded(
              child: LayoutBuilder(
                builder: (context,constraints){
                if(constraints.maxWidth>1080) {
                  return 
                  GridView.builder(
                itemCount:products.length,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               
                crossAxisCount: 2,
                childAspectRatio: 1.5,
               ),
               itemBuilder: (context,index){
              
                final product=products[index];
                return  GestureDetector(
                    onTap: (){
                       Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                        return ProductDetailsPage(product: product);
                       }));
                    },
                    child: ProductCard(
                      title: product['title'] as String, 
                      price: product['Price'] as double, 
                      image: product['imageUrl'] as String,
                      backgroundColor: index.isEven 
                      ?const Color.fromARGB(255, 213, 255, 254)
                      :const Color.fromARGB(162, 206, 206, 206), 
                      ),
                  );
              
              
               }
               )            ;
              
                }
                else{
                    return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,index){
                  final product = products[index];
                  return  GestureDetector(
                    onTap: (){
                       Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                        return ProductDetailsPage(product: product);
                       }));
                    },
                    child: ProductCard(
                      title: product['title'] as String, 
                      price: product['Price'] as double, 
                      image: product['imageUrl'] as String,
                      backgroundColor: index.isEven 
                      ?const Color.fromARGB(255, 213, 255, 254)
                      :const Color.fromARGB(162, 206, 206, 206), 
                      ),
                  );
                },
                
                );
                  
                }
              
                },
              ),
            ),


          //  Expanded(child:  
            
            //  GridView.builder(
            //   itemCount:products.length,
            //  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             
            //   crossAxisCount: 2,
            //   childAspectRatio: 1.5,
            //  ),
            //  itemBuilder: (context,index){

            //   final product=products[index];
            //   return  GestureDetector(
            //       onTap: (){
            //          Navigator.of(context).push(
            //           MaterialPageRoute(builder: (context){
            //           return ProductDetailsPage(product: product);
            //          }));
            //       },
            //       child: ProductCard(
            //         title: product['title'] as String, 
            //         price: product['Price'] as double, 
            //         image: product['imageUrl'] as String,
            //         backgroundColor: index.isEven 
            //         ?const Color.fromARGB(255, 213, 255, 254)
            //         :const Color.fromARGB(162, 206, 206, 206), 
            //         ),
            //     );


            //  }
            //  )            
          
            //  : ListView.builder(
            //   itemCount: products.length,
            //   itemBuilder: (context,index){
            //     final product = products[index];
            //     return  GestureDetector(
            //       onTap: (){
            //          Navigator.of(context).push(
            //           MaterialPageRoute(builder: (context){
            //           return ProductDetailsPage(product: product);
            //          }));
            //       },
            //       child: ProductCard(
            //         title: product['title'] as String, 
            //         price: product['Price'] as double, 
            //         image: product['imageUrl'] as String,
            //         backgroundColor: index.isEven 
            //         ?const Color.fromARGB(255, 213, 255, 254)
            //         :const Color.fromARGB(162, 206, 206, 206), 
            //         ),
            //     );
            //   },
              
            //   ),
           //)
          ],
        ),
      );
  }
}