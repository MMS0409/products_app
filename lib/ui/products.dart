import 'package:bottom_navigators/route/routes.dart';
import 'package:bottom_navigators/ui/products_about.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:like_button/like_button.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Center(child: Text("Products")),
        ),
        body: Column(
          children: [
            Expanded(
                child: GridView(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 20,
                      childAspectRatio: .8,
                    ),
                    children: List.generate(
                      price.length,
                      (index) => ZoomTapAnimation(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ProductAbout(about: [index,lst[index]]);
                          }));
                          Navigator.pushNamed(context, RoutesNames.productAbout,arguments: [index,lst[index]]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                right: 0,
                                child: LikeButton(
                                  onTap: (isLiked)async{
                                    if(isLiked){
                                      like.removeAt(index);
                                      return false;
                                    }
                                    like.add([price[index][0]]);
                                    return true;
                                  },
                                  size: 25,
                                  circleColor:
                                  const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                                  bubblesColor: const BubblesColor(
                                    dotPrimaryColor: Color(0xff33b5e5),
                                    dotSecondaryColor: Color(0xff0099cc),
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      Icons.favorite,
                                      color: isLiked ? Colors.red : Colors.grey,
                                      size: 25,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        lst[index],height: 100,),
                                    ),
                                    const SizedBox(height: 10,),
                                    RichText(text: TextSpan(text: 'Nomi - ',
                                        children: [
                                          TextSpan(text: price[index][0],style: const TextStyle(color: Colors.amber,fontSize: 15)),
                                        ]
                                    )),
                                    RichText(text: TextSpan(text: 'Narxi - ',
                                        children: [
                                          TextSpan(text: price[index][1],style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.red,
                                              decoration: TextDecoration.lineThrough
                                          )),
                                        ]
                                    )),
                                    Text(price[index][2],style: const TextStyle(color: Colors.amber,fontSize: 15),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))),
          ],
        ));
  }
}

List<dynamic> like=[];

List price = [
  ['Airpods','340000.0 \nso\'m','339996.0 so\'m'],
  ['Iphone','12000000.0 \nso\'m','11999985.0 so\'m'],
  ['Klaviatura va Sichqoncha','450000.0 \nso\'m','449979.0 so\'m'],
  ['Mac','14000000.0 \nso\'m','13999994.0 so\'m'],
  ['Computer','1340000.0 \nso\'m','1339996.0 so\'m'],
  ['Kalonka','300000.0 \nso\'m','299990.0 so\'m'],
];

List<String> lst=[
  "assets/images/airpods.png",
  "assets/images/iphone.png",
  "assets/images/keyboard_and_mouse.png",
  "assets/images/mac.png",
  "assets/images/pc.png",
  "assets/images/speaker.png",
];