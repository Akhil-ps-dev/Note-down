import 'package:flutter/material.dart';

class ScreenAllNote extends StatelessWidget {
  const ScreenAllNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Notes'),
      ),
      body: SafeArea(
        child: GridView.count(
          padding: EdgeInsets.all(20),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(
              10,
              (index) => NoteItem(
                    id: index.toString(),
                    title: 'DUMMY',
                    content:
                        'HAI, i love my nation, sdasdf at sdasdf · Experience · Looking for career advice? · Others named Kailas Nath · View Kailas ',
                  )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('New'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class NoteItem extends StatelessWidget {
  final String id;
  final String title;
  final String content;

  const NoteItem(
      {super.key,
      required this.id,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                  ),
                ],
              ),
              Text(
                content,
                style: TextStyle(fontSize: 16),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
