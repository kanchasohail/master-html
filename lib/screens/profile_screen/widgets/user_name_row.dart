import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/consts.dart';
import '../../../cubits/profile_cubit/user_name_cubit.dart';
import '../../../cubits/theme_cubit/theme_cubit.dart';

class UserNameRow extends StatelessWidget {
  const UserNameRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNameCubit = BlocProvider.of<UserNameCubit>(context);
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 16, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      color: BlocProvider.of<ThemeCubit>(context, listen: false)
                                  .themeMode ==
                              ThemeMode.dark
                          ? darkSettingsHeaderColor
                          : lightSettingsHeaderColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Text(
                    "Name:",
                    style: TextStyle(fontSize: 20),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: BlocBuilder<UserNameCubit, UserNameState>(
                    builder: (context, state) {
                  if (state is UserNameInitialState) {
                    return Text(
                      userNameCubit.userName ?? "Your Name Here",
                      style: userNameCubit.userName == null ? const TextStyle(color: Colors.grey , fontSize: 17) :  const TextStyle(fontSize: 18),
                    );
                  } else if (state is UserNameEditingState) {
                    return SizedBox(
                        height: 30,
                        width: 200,
                        child: TextField(
                          autofocus: true,
                          cursorColor: orangeColor,
                          onSubmitted: (value){
                            userNameCubit
                                .saveName(value.trim());
                          },
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: orangeColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: orangeColor),
                            ),
                          ),
                          style: const TextStyle(fontSize: 18),
                          controller: userNameCubit.nameController,
                        )
                    );
                  } else {
                    return Text(
                      userNameCubit.userName ?? "Your Name",
                      style: const TextStyle(fontSize: 18),
                    );
                  }
                }),
              ),
            ],
          ),
          BlocBuilder<UserNameCubit, UserNameState>(builder: (context, state) {
            if (state is UserNameInitialState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                    onPressed: () {
                      userNameCubit.startEditing();
                    },
                    icon: const Icon(Icons.edit , size: 28,)),
              );
            } else if (state is UserNameEditingState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(onPressed: () {
                  userNameCubit
                      .saveName(userNameCubit.nameController.text.trim());
                }, icon: const Icon(Icons.save, size: 28),),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                    onPressed: () {
                      userNameCubit.startEditing();
                    },
                    icon: const Icon(Icons.edit, size: 28)),
              );
            }
          })
        ],
      ),
    );
  }
}
