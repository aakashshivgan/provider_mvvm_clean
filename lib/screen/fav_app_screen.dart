import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_clean/provider/fav_app_provider.dart';
import 'package:provider_mvvm_clean/screen/myFavs.dart';

class FavAppScreen extends StatelessWidget {
  const FavAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    // final provider = Provider.of<FavAppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyFavroiteScreen(),
                    ));
              },
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          )
        ],
        title: const Text('Fav App Screen'),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: 11,
        itemBuilder: (context, index) {
          return Consumer<FavAppProvider>(
            builder:
                (BuildContext context, FavAppProvider value, Widget? child) {
              return ListTile(
                onTap: () {
                  if (value.selectedItems.contains(index)) {
                    value.removeSelectedItems(index);
                  } else {
                    value.addSelectedItems(index);
                  }
                },
                trailing: value.selectedItems.contains(index)
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_border_outlined),
                title: Text(index.toString()),
              );
            },
          );
        },
      )),
    );
  }
}
