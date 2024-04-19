import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/screens/Home%20Page%20Detail%20View/home_page_detail_view.dart';
import 'package:healthcare_ui_challenge/screens/home/home%20page%20widget/home_page_product_data.dart';

class HomePageGridItem extends StatefulWidget {
  const HomePageGridItem({super.key});

  @override
  State<HomePageGridItem> createState() => _HomePageGridItemState();
}

class _HomePageGridItemState extends State<HomePageGridItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomePageDetailView(),),);
      },
      child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 174,
      ),
          itemCount: homePageProductData.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder:(context,index){
        //    Color? containerColor = Color(int.parse(homePageProductData[index]['containerColor']));
            Color containerColor = Color(int.parse(homePageProductData[index]['containerColor'].substring(1), radix: 16) + 0xFF000000);

            return  Container(
  height: 174,
  width: 164,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: containerColor,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset('${homePageProductData.elementAt(index)['images']}'),
      Text('${homePageProductData[index]['title']}',style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFF18181B),
      ),),
      Text('${homePageProductData[index]['subtitle']}',style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color:Color(0xFF71717A),
      ),),
    ],),
);

      }),

      );
  }
}
