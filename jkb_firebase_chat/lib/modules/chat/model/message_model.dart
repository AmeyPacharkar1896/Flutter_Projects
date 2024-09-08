enum MessageType { text, image }

class MessageModel {
  MessageModel({
    required this.senderName,
    required this.id,
    required this.text,
    required this.type,
    required this.sentAt,
    required this.sentBy,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderName: map['senderName'] as String,
      id: map['id'] as String,
      text: map['text'] as String,
      type: _getMessageType(map['type'] as String),
      sentAt: DateTime.fromMicrosecondsSinceEpoch(map['sentAt'] as int),
      sentBy: map['sentBy'] as String,
    );
  }

  final String senderName;
  final String id;
  final String text;
  final MessageType type;
  final DateTime sentAt;
  final String sentBy;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderName' : senderName,
      'id': id,
      'text': text,
      'type': type.name,
      'sentAt': sentAt.millisecondsSinceEpoch,
      'sentBy': sentBy,
    };
  }

  MessageModel copyWith({
    String? senderName,
    String? id,
    String? text,
    MessageType? type,
    DateTime? sentAt,
    String? sentBy,
  }) {
    return MessageModel(
      senderName: senderName ?? this.senderName,
      id: id ?? this.id,
      text: text ?? this.text,
      type: type ?? this.type,
      sentAt: sentAt ?? this.sentAt,
      sentBy: sentBy ?? this.sentBy,
    );
  }

  factory MessageModel.empty() {
    return MessageModel(
      senderName: '',
      id: '', 
      text: '', 
      type: MessageType.text, 
      sentAt: DateTime.now(),
      sentBy: '', // Default or placeholder values
    );
  }
}

MessageType _getMessageType(String map) {
  if (map == MessageType.text.name) return MessageType.text;
  return MessageType.image;
}
