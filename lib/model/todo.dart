class Todo {
  final String id;
  final String title;
  final String description;
  final bool isDone;

  const Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
