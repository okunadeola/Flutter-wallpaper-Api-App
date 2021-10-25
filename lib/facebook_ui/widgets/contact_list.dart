import 'package:flutter/material.dart';

import 'package:newapp/facebook_ui/models/models.dart';
import 'package:newapp/facebook_ui/widgets/user_card.dart';

class ContactList extends StatelessWidget {
  final List<User>? users;

  const ContactList({
    Key? key,
    @required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 200.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "Contacts",
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              )),
              Icon(Icons.search, color: Colors.grey[600],),
              const SizedBox(width: 8.0),
              Icon(Icons.more_horiz, color: Colors.grey[600],),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemCount: users?.length,
              itemBuilder:(BuildContext context, int index){
                final User  user = users![index];
                return Padding(padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: UserCard(user: user,)
                ) ;
              },
              ),
          )
        ],
      ),
    );
  }
}
