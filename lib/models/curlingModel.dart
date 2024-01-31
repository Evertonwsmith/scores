class curlingModel {
  final String gamename;
  final String team1name;
  final String team2name;
  List<int> scores;
  final String date;

  curlingModel(
      {required this.gamename,
      required this.team1name,
      required this.team2name,
      required this.scores,
      required this.date});
}
