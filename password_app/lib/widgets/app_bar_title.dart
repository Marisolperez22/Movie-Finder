import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  final String storeName;
  const AppbarTitle({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(80),
            ),
            child: Image.asset('assets/images/photo.jpg', fit: BoxFit.cover,),
          ),
           Expanded(child: Text(storeName)),
          IconButton(
            onPressed: () => print('Presionaron notification button'),
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () => print('Presionaron options button'),
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
