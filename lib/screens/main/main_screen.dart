import 'package:flutter/material.dart';
import 'package:healthcare_ui_challenge/constant/App_Colors.dart';
import 'package:healthcare_ui_challenge/screens/home/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
const HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: SizedBox(
        height: 88,
        child: Container(
          height: 88,
          width: 375,
          decoration: BoxDecoration(
          color: AppColors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),
    ),
          ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            IconBottomBar(onTap: (){
              setState(() {
                _selectedIndex=0;
              });
            }, icon: Icons.home, selected:_selectedIndex==0, text: "Home") ,
            IconBottomBar(onTap: (){
              setState(() {
                _selectedIndex=1;
              });
            }, icon: Icons.calendar_today, selected:_selectedIndex==1, text: 'Calender') ,
            IconBottomBar(onTap: (){
              setState(() {
                _selectedIndex=2;
              });
            }, icon: Icons.history_edu, selected:_selectedIndex==2, text: "History") ,
            IconBottomBar(onTap: (){
              setState(() {
                _selectedIndex=3;
              });
            }, icon: Icons.chat, selected:_selectedIndex==3, text: "Chat") ,
            IconBottomBar(onTap: (){
              setState(() {
                _selectedIndex=4;
              });
            }, icon: Icons.person, selected:_selectedIndex==4, text: "Account") ,
          ],),
        ),
     const SizedBox(height: 5,),
      Container(
        height: 5,
        width: 134,
        decoration: BoxDecoration(
          color: Color(0xff020E22),
        ),
      ),
      ],),
        ),
      ),
body: _pages.elementAt(_selectedIndex),
    );
  }
}
/*IconBottomBar start here*/
class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onTap;
  const IconBottomBar({super.key,required this.onTap,required this.icon,required this.selected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(onPressed: onTap, icon: Icon(icon),
        color:selected?AppColors.kPrimaryColor:AppColors.kSecondaryColor ,
      ),
      Text(text,style: TextStyle(
        color: selected?AppColors.kPrimaryColor:AppColors.kSecondaryColor,
      ),),
    ],);
  }
}

/*IconBottomBar end here*/