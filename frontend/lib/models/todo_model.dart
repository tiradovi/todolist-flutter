// lib/models/todo_model.dart
// Todo 데이터 모델

class TodoModel {
  final int? id;
  final String content;
  final bool isCompleted;
  final DateTime? createdAt;

  const TodoModel({
    this.id,
    required this.content,
    this.isCompleted = false,
    this.createdAt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'] as int?,
        content: json['content'] as String,
        isCompleted: json['isCompleted'] as bool? ?? false,
        createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'isCompleted': isCompleted
    };
  }
  TodoModel copyWith({
    int? id,
    String? content,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return TodoModel(
      id:  id ?? this.id,
      content:  content ?? this.content,
      isCompleted:  isCompleted ?? this.isCompleted,
      createdAt:  createdAt ?? this.createdAt,
    );
  }

  /*
   * TODO: formattedDate getter 작성
   * - createdAt가 null이면 빈 문자열 반환
   * - 아니면 'yyyy-MM-dd' 형식으로 반환
   * - 예: '2026-01-12'
   */
  String get formattedDate {
    if(createdAt == null) return '';
    return '${createdAt!.year}=${createdAt!.month.toString().padLeft(2,'0')}-${createdAt!.day.toString().padLeft(2,'0')}';
  }
}