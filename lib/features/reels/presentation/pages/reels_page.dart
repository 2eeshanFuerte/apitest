import 'package:apitest/core/utilities/constant.dart';
import 'package:apitest/features/reels/presentation/blocs/reels_bloc.dart';
import 'package:apitest/features/reels/presentation/blocs/reels_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ReelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            Text("Reels",
                style: GoogleFonts.mateSc(
                    color: lightYellowColor, fontWeight: FontWeight.bold)),
            Image.asset(
              "assets/images/reels.png",
              height: 0.1 * h,
              width: 0.06 * w,
            ),
          ],
        ),
      ),
      body: BlocBuilder<ReelsBloc, ReelsState>(
        // Correctly refer to ReelsState
        builder: (context, state) {
          if (state is ReelsLoading) {
            return const Center(child: CircularProgressIndicator());
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
          return Center(
              child: Text(
            'No Reels Available',
            style: TextStyle(color: whitecolor, fontWeight: FontWeight.bold),
          ));
        },
      ),
    );
  }
}
