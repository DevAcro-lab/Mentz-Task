import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentz_task/features/spot_finder/presentation/widgets/spot.dart';
import '../cubits/spots_cubit.dart';

class SpotFinderPage extends StatefulWidget {
  const SpotFinderPage({super.key});

  @override
  State<SpotFinderPage> createState() => _PostsState();
}

class _PostsState extends State<SpotFinderPage> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
    context.read<SpotsCubit>().getSpots();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      context.read<SpotsCubit>().getSpots(searchQuery: query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpotsCubit, SpotsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Spots'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search spots...',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                _performSearch('');
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      _performSearch(value);
                    },
                  ),
                ),
                Expanded(
                  child: Builder(builder: (_) {
                    if (state is SpotsLoading) {
                      return Center(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: CircularProgressIndicator(),
                          ));
                    }
                    if (state is LoadedSpots) {
                      if (state.spots.isEmpty) {
                        return Center(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Text("No spots found"),
                          ),
                        );
                      }
                      return ListView.builder(
                            itemCount: state.spots.length,
                            itemBuilder: (_, index) {
                              return Spot(
                                  key: Key(state.spots[index].id.toString()),
                                  title: state.spots[index].name,
                                  body: state.spots[index].parentName ?? '-');
                            });
                    }
                    return Center(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Text("No data"),
                        ));
                  }),
                ),
              ],
            ));
      },
    );
  }
}