import 'package:flutter/material.dart';

class messanger_screen extends StatelessWidget {
  const messanger_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 13,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            IconButton(
              splashColor: Colors.white,
              highlightColor: Colors.white,
              onPressed: () {},
              icon: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg')),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Chats',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 15,
                child: Icon(
                  Icons.camera_alt,
                  size: 17,
                  color: Colors.white,
                ),
              )),
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 15,
                child: Icon(
                  Icons.edit,
                  size: 17,
                  color: Colors.white,
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildStoryItems(),
                    separatorBuilder: (context, index) => const SizedBox(width: 20,),
                    itemCount: 7,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                  itemBuilder: (context, index) => buildChatItems(),
                  separatorBuilder: (context , index)=> const SizedBox(height: 20,),
                  itemCount: 15
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItems() => Row(
    children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg'),
            radius: 27,
          ),
          Padding(
            padding:
            EdgeInsetsDirectional.only(bottom: 2, end: 2),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 7,
            ),
          )
        ],
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AbdulAllah Jihad Doj',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Hello, i am new here, can we talk??',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const Text('02:09 pm')
              ],
            ),
          ],
        ),
      )
    ],
  );

  Widget buildStoryItems() => SizedBox(
    width: 60,
    child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg'),
              radius: 27,
            ),
            Padding(
              padding:
              EdgeInsetsDirectional.only(bottom: 2, end: 2),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 7,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        const Text(
          'Ahmed Mohammed Bin Adam',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}
