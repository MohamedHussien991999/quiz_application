class History {
  final String name;
  final bool pass;
  final int scoreQuestion;

  History(this.name, this.pass, this.scoreQuestion);
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pass': pass,
      'scoreQuestion': scoreQuestion,
    };
  }

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      json['name'],
      json['pass'],
      json['scoreQuestion'],
    );
  }
}
