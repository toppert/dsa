class Todo {
  String title;
  String? description;
  String? day;

  Todo({required this.title, this.description, this.day});

  @override
  String toString() => 'Todo(title: $title)';

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    title: json['title'] as String,
    description: json['description'] as String,
    day: json['day'] as String,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'day': day,
  };

  Todo copyWith({
    required String title,
    String? description,
  }) {
    return Todo(
      title: title,
      description: description,
      day: day
    );
  }

  @override
  bool operator ==(other) {
    if (other is! Todo) {
      return false;
    }
    return title == (other).title;
  }

  @override
  int get hashCode => title.hashCode;
}
