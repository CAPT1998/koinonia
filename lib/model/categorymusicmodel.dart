class Categorymusicmodel {
  final String musicId;
  final String musicTitle;
  final String musicFile;
  final String musicImage;
  final String categoryId;
  final String albumId;
  final String artistId;
  final dynamic movieId;
  final dynamic musicSize;
  final String musicDuration;
  final String musicStatus;
  final String createdDate;
  final String playlistId;

  Categorymusicmodel({
    required this.musicId,
    required this.musicTitle,
    required this.musicFile,
    required this.musicImage,
    required this.categoryId,
    required this.albumId,
    required this.artistId,
    required this.movieId,
    required this.musicSize,
    required this.musicDuration,
    required this.musicStatus,
    required this.createdDate,
    required this.playlistId,
  });

  Categorymusicmodel.fromJson(Map<String, dynamic> json)
      : musicId = json['music_id'] as String,
        musicTitle = json['music_title'] as String,
        musicFile = json['music_file'] as String,
        musicImage = json['music_image'] as String,
        categoryId = json['category_id'] as String,
        albumId = json['album_id'] as String,
        artistId = json['artist_id'] as String,
        movieId = json['movie_id'],
        musicSize = json['music_size'],
        musicDuration = json['music_duration'] as String,
        musicStatus = json['music_status'] as String,
        createdDate = json['created_date'] as String,
        playlistId = json['playlist_id'] as String;

  Map<String, dynamic> toJson() => {
        'music_id': musicId,
        'music_title': musicTitle,
        'music_file': musicFile,
        'music_image': musicImage,
        'category_id': categoryId,
        'album_id': albumId,
        'artist_id': artistId,
        'movie_id': movieId,
        'music_size': musicSize,
        'music_duration': musicDuration,
        'music_status': musicStatus,
        'created_date': createdDate,
        'playlist_id': playlistId
      };
}
