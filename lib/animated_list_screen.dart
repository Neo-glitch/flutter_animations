import 'package:flutter/material.dart';

// as name implies, it works with lists
class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _items.insert(0, "items ${_items.length + 1}");
    _key.currentState!.insertItem(
      0,
      duration: const Duration(seconds: 1),
    );
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(index, (context, animation) {
      // size transition to reduce the size of item till it disappears
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color: Colors.red,
          child: ListTile(
            title: Text(
              "Deleted",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
    }, duration: const Duration(milliseconds: 300));

    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        IconButton(
          onPressed: _addItem,
          icon: const Icon(Icons.add),
        ),
        Expanded(
            child: AnimatedList(
          key: _key,
          initialItemCount: 0,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index, animation) {
            // to make item go bigger ad bigger till it reaches needed height
            return SizeTransition(
              key: UniqueKey(),
              sizeFactor: animation,
              child: Card(
                margin: const EdgeInsets.all(10),
                color: Colors.orangeAccent,
                child: ListTile(
                  title: Text(
                    _items[index],
                    style: const TextStyle(fontSize: 24),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _removeItem(index);
                    },
                  ),
                ),
              ),
            );
          },
        ))
      ],
    );
  }
}
