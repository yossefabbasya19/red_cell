import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/views/authentication/presentation/view_model/auth_view_model_cubit.dart';

class GenderUserInputField extends StatefulWidget {
  const GenderUserInputField({super.key});

  @override
  State<GenderUserInputField> createState() => _GenderUserInputFieldState();
}

class _GenderUserInputFieldState extends State<GenderUserInputField> {
  late bool cc;

  /*@override
  void initState() {
    cc = BlocProvider.of<SelectGenderCubit>(context).isFemale;
    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: BlocBuilder<AuthViewModelCubit, AuthViewModelState>(
        builder: (context, state) {
          cc = BlocProvider.of<AuthViewModelCubit>(context).isFemale;
          return Container(
            padding: EdgeInsets.only(top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose your gender",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: ColorsManeger.redWithOpacity1,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          backgroundColor:
                              cc
                                  ? WidgetStatePropertyAll(ColorsManeger.red)
                                  : WidgetStatePropertyAll(Colors.transparent),
                          elevation: WidgetStatePropertyAll(0),
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthViewModelCubit>(
                            context,
                          ).switchGender();
                        },
                        child: Text(
                          "Male",
                          style:
                              cc
                                  ? Theme.of(context).textTheme.labelMedium
                                  : Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: ColorsManeger.redWithOpacity1,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          backgroundColor:
                              !cc
                                  ? WidgetStatePropertyAll(ColorsManeger.red)
                                  : WidgetStatePropertyAll(Colors.transparent),
                          elevation: WidgetStatePropertyAll(0),
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthViewModelCubit>(
                            context,
                          ).switchGender();
                        },
                        child: Text(
                          "Female",
                          style:
                              !cc
                                  ? Theme.of(context).textTheme.labelMedium
                                  : Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
