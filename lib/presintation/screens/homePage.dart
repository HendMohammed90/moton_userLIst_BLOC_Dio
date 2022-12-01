import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moton_users_bloc_api/business_logic/cubit/user_cubit.dart';
import 'package:moton_users_bloc_api/data/models/user_model.dart';
import 'package:moton_users_bloc_api/presintation/widgites/user-Item.dart';
import 'package:moton_users_bloc_api/utalites/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<UserModel> users;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacter();
  }

  Widget buildBlockWidget() {
    return BlocBuilder<CharacterCubit, UserState>(
      builder: (BuildContext context, state) {
        if (state is UserLoaded) {
          users = (state).userList as List<UserModel>;
          return buildLoadedListWidgets();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Constants.KMaincolor,
        child: Column(
          children: [
            buildUsersList(),
          ],
        ),
      ),
    );
  }

  Widget buildUsersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: users.length,
      itemBuilder: (ctx, index) {
        return UserItem(
          user: users[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: buildBlockWidget(),
    );
  }
}
