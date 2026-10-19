import 'package:flutter/material.dart';

import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';

  bool isGridView = true;

  int sharedDiscount = 20;

  void decreaseDiscount() {
    setState(() {
      if (sharedDiscount > 0) {
        sharedDiscount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> filteredMovies = movies.where((movie) {
      final query = searchQuery.toLowerCase();
      final matchesTitle = movie.title.toLowerCase().contains(query);
      final matchesGenre = movie.genre.toLowerCase().contains(query);
      return matchesTitle || matchesGenre;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Library"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(182, 65, 138, 64),
        actions: [
          IconButton(
            tooltip: widget.isDarkMode
                ? "Switch to light mode"
                : "Switch to dark mode",
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onThemeToggle,
          ),
          IconButton(
            icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: const InputDecoration(
                hintText: "Search movies...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: filteredMovies.isEmpty
                  ? const Center(
                      child: Text(
                        "No movies found",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : isGridView
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // عمودين حسب المطلوب
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 25,
                          ),
                      itemCount: filteredMovies.length,
                      itemBuilder: (context, index) {
                        return MovieCard(
                          movie: filteredMovies[index],
                          discount: sharedDiscount,
                          onDiscountTap: decreaseDiscount,
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: filteredMovies.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: SizedBox(
                            height: 260, // ارتفاع مناسب لصف الـ ListView
                            child: MovieCard(
                              movie: filteredMovies[index],
                              discount: sharedDiscount,
                              onDiscountTap: decreaseDiscount,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
