import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/features/profile/presentation/bloc/profile_data_bloc.dart';

class ProfileCard extends StatelessWidget{
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileDataBloc>(
      create: (BuildContext context) => ProfileDataBloc()..add(ProfileDataFetchEvent()),
      child: Container(
        
      ),
    );
    
  }
}