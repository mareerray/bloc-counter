import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Counter Bloc', 
            style: GoogleFonts.limelight(color: Colors.white, fontSize: 30)),
            SizedBox(width: 10),
            Icon( Icons.add_reaction, color: Colors.white, size: 30),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF2f688e),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bluebg.jpg'), 
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.2), BlendMode.darken), 
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, int>(
                builder: (context, state) {
                  return Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$state',
                        style: GoogleFonts.limelight(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2f688e),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => context.read<CounterBloc>().add(CounterEvent.decrement),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2f688e),
                      foregroundColor: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                    ),
                    child: Text('-', style: TextStyle(fontSize: 24)),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => context.read<CounterBloc>().add(CounterEvent.increment),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2f688e),
                      foregroundColor: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                    ),
                    child: Text('+', style: TextStyle(fontSize: 24)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
