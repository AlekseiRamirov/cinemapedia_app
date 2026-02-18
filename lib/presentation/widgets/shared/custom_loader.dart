import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  Stream<String> getLoadingMessages() {
    final List<String> messages = <String>[
      'Loading Movies',
      'Cooking pop corn',
      'Preparing all cinemas',
      'Looking for better movies',
      'Why this take so much time?',
    ];
    return Stream.periodic(Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Loading...'),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 2),
          SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context, snapshot) {
            if(!snapshot.hasData) return Text('Wait a moment');
            return FadeIn(child: Text(snapshot.data!));
          })
        ],
      ),
    );
  }
}