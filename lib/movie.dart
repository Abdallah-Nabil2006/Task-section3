class Movie {
  final String title;
  final String genre;
  final String year;
  final String rating;
  final String image;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}

final List<Movie> movies = [
  const Movie(
    title: 'Wall-E',
    genre: 'Animation',
    year: '2008',
    rating: '8.4',
    image: 'images/walle.jpg',
  ),
  const Movie(
    title: 'Shutter Island',
    genre: 'Crime',
    year: '2010',
    rating: '8.4',
    image: 'images/shutter_island.jpg',
  ),
  const Movie(
    title: 'The Dark Knight',
    genre: 'Action',
    year: '2008',
    rating: '9.0',
    image: 'images/dark_knight.jpg',
  ),
  const Movie(
    title: 'The Green Mile',
    genre: 'Crime',
    year: '1999',
    rating: '8.6',
    image: 'images/greenmile.jpg',
  ),
  const Movie(
    title: 'Mad Max',
    genre: 'Action',
    year: '2015',
    rating: '8.1',
    image: 'images/madmax.jpg',
  ),
  const Movie(
    title: 'The Invisible Man',
    genre: 'Sci-Fi',
    year: '2020',
    rating: '7.1',
    image: 'images/invisible_man.jpg',
  ),
  const Movie(
    title: 'The Joker',
    genre: 'Crime',
    year: '2019',
    rating: '8.4',
    image: 'images/joker.jpg',
  ),
  const Movie(
    title: 'The Croods',
    genre: 'Animation',
    year: '2013',
    rating: '7.2',
    image: 'images/croods.jpg',
  ),
  const Movie(
    title: 'Interstellar',
    genre: 'Sci-Fi',
    year: '2014',
    rating: '8.7',
    image: 'images/interstellar.jpg',
  ),
  const Movie(
    title: 'Annabelle',
    genre: 'Horror',
    year: '2014',
    rating: '6.0',
    image: 'images/annabelle.jpg',
  ),
];