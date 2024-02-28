import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_clean/provider/fav_app_provider.dart';

class MyFavroiteScreen extends StatefulWidget {
  const MyFavroiteScreen({super.key});

  @override
  State<MyFavroiteScreen> createState() => _MyFavroiteScreenState();
}

class _MyFavroiteScreenState extends State<MyFavroiteScreen> {
  @override
  Widget build(BuildContext context) {
    final myFavProvider = Provider.of<FavAppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Fav Screen'),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: myFavProvider.selectedItems.length,
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
