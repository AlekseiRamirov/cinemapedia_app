import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colorsTheme.primary),
              SizedBox(width: 5),
              Text('CineMania', style: titleStyle),
              Spacer(),
              IconButton(onPressed: (){
      
              }, icon: Icon(Icons.search))
            ],
          ),
        ),
      ),
    );
  }
}
