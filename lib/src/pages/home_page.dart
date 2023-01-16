import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:simple_lesson/src/bloc/login_form_validation_bloc.dart';
import 'package:simple_lesson/src/bloc/login_form_validation_state.dart';

import '../bloc/login_form_validation_event.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  final GlobalKey<FormState> _form  =  GlobalKey<FormState>();
  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController _passwordController  = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Container(
        padding:const EdgeInsets.symmetric(horizontal: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:   [
            const  Text("LOGIN" , style:    TextStyle(
              color: Colors.black,
              fontSize:16
            ),),
           const  SizedBox(height:10,),
            Text("Make your login fast as possible" , style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize:11
            ),),
            const SizedBox(height:40,),
            Form(
              key: _form,
              child: BlocConsumer<LoginFormValidationBloc ,LoginFormValidationState>(
                listener: (contex,snapshot){

                },
                builder: (context, snapshot){

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        onChanged: (input){
                           BlocProvider.of<LoginFormValidationBloc>(context)
                               .add(EmailChangedEvent(input: input));
                        },
                        decoration: const InputDecoration(
                            hintText: "Email"
                        ),
                      ) ,
                      const SizedBox(height:40,),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Password"
                        ),
                        controller: _passwordController,
                        onChanged: (input){
                          BlocProvider.of<LoginFormValidationBloc>(context)
                              .add(PasswordChangedEvent(input: input));

                        },
                      ) ,
                      const SizedBox(height:20,),
                      MaterialButton(
                        onPressed: snapshot.status.isValid? (){} : null,
                        minWidth: 300,
                        height:60,
                        disabledColor:Colors.grey,
                        color: Colors.black,
                        child: const  Text("Entrar",style: TextStyle(
                            color: Colors.white,
                            fontSize: 11
                        ),),
                      )

                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

