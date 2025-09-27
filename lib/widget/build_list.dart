import 'package:flutter/material.dart';
import 'package:userinput/models/grocery_item.dart';
import 'package:userinput/widget/new_item.dart';

class BuildList extends StatefulWidget {
  const BuildList({super.key});

  @override
  State<BuildList> createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {
  final List<GroceryItem> _GrocerylistItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (newItem == null) {
      return;
    }

    setState(() {
      _GrocerylistItems.add(newItem);
    });
  }

  void _removeItem(int index) {
    final removedItem = _GrocerylistItems[index];

    setState(() {
      _GrocerylistItems.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${removedItem.name} deleted'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _GrocerylistItems.insert(index, removedItem);
            });
          },
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _EmptyList(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'The list is Empty',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Add a Grocery',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grocery List:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: _GrocerylistItems.isEmpty
          ? _EmptyList(context)
          : ListView.builder(
              itemCount: _GrocerylistItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.local_grocery_store_sharp),
                  title: Text(
                    _GrocerylistItems[index].name,
                    style: TextStyle(
                      color: _GrocerylistItems[index].category.color,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_GrocerylistItems[index].quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
