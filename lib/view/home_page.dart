import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/controller.dart';
import '../view/loading_widget.dart';

final controllerProvider = ChangeNotifierProvider((ref) => Controller());

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(controllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty Characters'),
      ),
      body: LoadingWidget(
        isLoading: controller.isLoading,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: controller.allCharactersButton,
                  child: const Text('All Characters'),
                ),
                ElevatedButton(
                  onPressed: controller.favCharactersButton,
                  child: const Text('Favorite Characters'),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                children: [
                  allCharacters(controller),
                  favCharacters(controller),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50)
          ],
        ),
      ),
    );
  }
  ListView allCharacters(Controller controller){
    return ListView.separated(
      controller: controller.allCharactersScrollController,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: controller.characters.length + (controller.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        var user = controller.characters[index];
        var isFavorite = controller.isFavorite(user);
        if (index == controller.characters.length && controller.isLoadingMore) {
          return const Center(child: CircularProgressIndicator());
        }
        return InkWell(
          onDoubleTap: (){
            controller.toggleFavorite(controller.characters[index]);
          },
          onTap: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: Text(user.name ?? ''),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 100,
                      backgroundImage: NetworkImage(user.image ?? ''),
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Status: ${user.status ?? ''}"),
                        Divider(thickness: 1),
                        Text("Gender: ${user.gender ?? ''}"),
                        Divider(thickness: 1),
                        Text("Species: ${user.species ?? ''}"),
                        Divider(thickness: 1),
                        Text("Location: ${user.location?.name ?? ''}")
                        ,
                      ],
                    ),

                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: Colors.grey, width: 1),
            ),
            child: ListTile(
              title: Text(controller.characters[index].name ?? ''),
              subtitle: Text(controller.characters[index].status ?? ''),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(controller.characters[index].image ?? ''),
              ),
              trailing: IconButton(
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,),
                onPressed: () {
                  controller.toggleFavorite(controller.characters[index]);
                },
              )
            ),
          ),
        );
      },
    );
  }
  ListView favCharacters(Controller controller){
    return ListView.separated(
      controller: controller.favCharactersScrollController,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: controller.favCharacters.length + (controller.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        var user = controller.characters[index];
        if (index == controller.favCharacters.length && controller.isLoadingMore) {
          return const Center(child: CircularProgressIndicator());
        }
        return InkWell(
          onTap: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: Text(user.name ?? ''),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 100,
                      backgroundImage: NetworkImage(controller.favCharacters[index].image ?? ''),
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Status: ${controller.favCharacters[index].status ?? ''}"),
                        Divider(thickness: 1),
                        Text("Gender: ${controller.favCharacters[index].gender ?? ''}"),
                        Divider(thickness: 1),
                        Text("Species: ${controller.favCharacters[index].species ?? ''}"),
                        Divider(thickness: 1),
                        Text("Location: ${controller.favCharacters[index].location?.name ?? ''}")
                        ,
                      ],
                    ),

                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: Colors.grey, width: 1),
            ),
            child: ListTile(
              title: Text(controller.favCharacters[index].name ?? ''),
              subtitle: Text(controller.favCharacters[index].status ?? ''),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(controller.favCharacters[index].image ?? ''),
              ),
            ),
          ),
        );
      },
    );
  }

}
