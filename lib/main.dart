

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_lesson/src/bloc/login_form_validation_bloc.dart';
import 'package:simple_lesson/src/pages/home_page.dart';

void main()=> runApp( MaterialApp(
  home: BlocProvider(
     create: (context)=> LoginFormValidationBloc() ,
     child: const HomePage(),
  ),
));