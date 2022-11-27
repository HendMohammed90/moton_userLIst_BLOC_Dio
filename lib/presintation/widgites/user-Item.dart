import 'package:flutter/material.dart';
import 'package:moton_users_bloc_api/data/models/user_model.dart';
import 'package:moton_users_bloc_api/utalites/constants.dart';

class UserItem extends StatelessWidget {
  const UserItem({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Constants.Klightbluecolor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${user}',
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: Constants.Klightbluecolor,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Text('No Data')
          // Container(
          //   child: user!.img!.isNotEmpty
          //       ? FadeInImage.assetNetwork(
          //     width: double.infinity,
          //     height: double.infinity,
          //     placeholder: 'assets/images/spinner.gif',
          //     image: user.img,
          //     fit: BoxFit.cover,
          //   )
          //       : Image.asset('assets/images/placholder.png'),
          // ),
          ),
    );
  }
}
