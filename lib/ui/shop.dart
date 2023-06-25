import 'package:bottom_navigators/ui/products.dart';
import 'package:bottom_navigators/ui/products_about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: Colors.indigo,
      ),
      body: GridView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          scrollDirection: Axis.vertical,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            childAspectRatio: 3,
          ),
          children: List.generate(
            saveIndex.length,
                (index) => Slidable(
                  endActionPane: ActionPane(
                    extentRatio: 0.3,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context){
                          setState(() {
                            saveIndex.removeAt(index);
                          });
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child:Container(
                    height: 160,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Center(
                          child: Image.asset(
                            saveIndex[index][2],height: 100,width: 100,),
                        ),
                        const SizedBox(width: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(text: TextSpan(text: 'Nomi - ',
                                  children: [
                                    TextSpan(text: price[saveIndex[index][0]][0],style: const TextStyle(color: Colors.amber,fontSize: 15)),
                                  ]
                              )),
                              RichText(text: TextSpan(text: 'Narxi - ',
                                  children: [
                                    TextSpan(text: price[saveIndex[index][0]][1],style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough
                                    )),
                                  ]
                              )),
                              Text(price[saveIndex[index][0]][2],style: const TextStyle(color: Colors.amber,fontSize: 15),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          ))
    );
  }
}
