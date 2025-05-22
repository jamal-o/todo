// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageProvider = FutureProvider<List<Item>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return [
    Item(title: "Item 1", imageUrl: "https://picsum.photos/200/300"),
    Item(title: "Item 2", imageUrl: "https://picsum.photos/200/300"),
    Item(title: "Item 3", imageUrl: "https://picsum.photos/200/300"),
  ];
});

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homePageProvider);

    // ref.refresh(homePageProvider);
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () => ref.invalidate(homePageProvider),
        child: Icon(Icons.refresh),
      ),
      body: state.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return HomePageCard(item: data[index]);
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Item {
  final String title;
  final String imageUrl;

  Item({required this.title, required this.imageUrl});
}

class HomePageCard extends StatelessWidget {
  const HomePageCard({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    // a card to show a title and an image
    return Card(
      child: Column(
        children: [
          Image.network(item.imageUrl),
          Text(item.title),
        ],
      ),
    );
  }
}
