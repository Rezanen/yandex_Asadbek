import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_asadbek/data/hive/locationData.dart';

import '../main/bloc/main_bloc.dart';
import 'bloc/editor_bloc.dart';

@RoutePage()
class EditorPage extends StatelessWidget {
  const EditorPage(
      {super.key, required this.lat, required this.lon, required this.str});

  final double? lat;
  final double? lon;
  final String? str;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => EditorBloc(), child: _EditorPageView(lat, lon, str));
  }
}

class _EditorPageView extends StatelessWidget {
  final double? lat;
  final double? lon;
  final String? str;

  const _EditorPageView(this.lat, this.lon, this.str);

  @override
  Widget build(BuildContext context) {
    if (lat != null) {
      context
          .read<EditorBloc>()
          .add(EditorEvAddLocation(LocationData(lat!, lon!, str!)));
    } else {
      context.read<EditorBloc>().add(EditorEvAddLocation(null));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: BlocBuilder<EditorBloc, EditorState>(
          builder: (BuildContext context, EditorState state) {
        return state.data?.placeName != null
            ? Column(
                children: [
                  Container(
                    width: double.infinity,
                  ),
                  Text("${state.data?.lat}"),
                  Text("${state.data?.lon}"),
                  Text("${state.data?.placeName}"),
                  GestureDetector(
                    onTap: () {
                      if (state.data != null) {
                        context
                            .read<EditorBloc>()
                            .add(EditorEvDeleteLocation(state.data!));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "ochirish",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  )
                ],
              )
            : Text("malumotla yoq");
      }),
    );
  }
}
