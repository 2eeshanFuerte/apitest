import 'package:apitest/features/reels/presentation/blocs/reels_bloc.dart';
import 'package:apitest/features/reels/presentation/blocs/reels_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../blocs/reels_bloc.dart';       // Import BLoC
// import '../blocs/reels_state.dart';      // Import state classes
import '../../data/models/reel_model.dart';

class ReelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reels'),
      ),
      body: BlocBuilder<ReelsBloc, ReelsState>(
        // Correctly refer to ReelsState
        builder: (context, state) {
          if (state is ReelsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ReelsLoaded) {
            return ListView.builder(
              itemCount: state.reels.length,
              itemBuilder: (context, index) {
                final reel = state.reels[index];
                return ListTile(
                  title:
                      Text(reel.title), // Replace with your desired properties
                  // Display your reel information, like the title, thumbnail, etc.
                );
              },
            );
          }
          if (state is ReelsError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No Reels Available'));
        },
      ),
    );
  }
}
