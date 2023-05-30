import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemExtent: 80,
      itemBuilder: (context, int index) {
        return ListTile(
          onTap: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                        MediaQuery.of(context).devicePixelRatio * 20)),
              ),
              context: context,
              builder: (BuildContext context) {
                return Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.12),
                  height: MediaQuery.of(context).devicePixelRatio * 500,
                  child: Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).devicePixelRatio * 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.12,
                            foregroundImage: AssetImage(items[index].image),
                          ),
                          Column(
                            children: [
                              Text(
                                '${items[index].title} ',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                items[index].contact,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 90),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff58749c))),
                            child: const Text(
                              'Send Message',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 112),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff58749c))),
                            child: const Text(
                              "  Cancle ",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          leading: CircleAvatar(
              radius: 30, foregroundImage: AssetImage(items[index].image)),
          title: Text(items[index].title),
          subtitle: Text(items[index].title1, overflow: TextOverflow.ellipsis),
          trailing: Text(DateFormat('hh:mm a').format(DateTime.now())),
        );
      },
    );
  }
}
