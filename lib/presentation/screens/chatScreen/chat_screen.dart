import 'package:flutter/material.dart';
import 'package:tangle/data/models/models.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key, required this.userMatched}) : super(key: key);
  final UserMatch userMatched;

  static const String routeName = '/chat';
  static Route route({required UserMatch userMatch}) {
    return MaterialPageRoute(
      builder: (_) => ChatScreen(userMatched: userMatch),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: CircleAvatar(
                radius: 17,
                backgroundImage:
                    NetworkImage(userMatched.matchedUser.imageUrls[0]),
              ),
            ),
            Text(
              userMatched.matchedUser.name,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: userMatched.chat.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: userMatched
                                        .chat[0].messages[index].senderId ==
                                    1
                                ?
                                //Listtile for user message on right
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                      child: Text(
                                        userMatched
                                            .chat[0].messages[index].message,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ),
                                  )
                                //listtile for matcheduser message on left
                                : Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        //matcheduser avatar on left on chat message
                                        CircleAvatar(
                                          radius: 17,
                                          backgroundImage: NetworkImage(
                                              userMatched
                                                  .matchedUser.imageUrls[0]),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          child: Text(
                                            userMatched.chat[0].messages[index]
                                                .message,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                      },
                      itemCount: userMatched.chat[0].messages.length,
                    )
                  : Container(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor),
                  child: IconButton(
                      alignment: Alignment.centerRight,
                      icon: const Icon(Icons.send_outlined),
                      color: Colors.white,
                      onPressed: () {}),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type Here...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
