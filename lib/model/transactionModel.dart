class TransactionModel {
  final String? idUser;
  final String? id;
  final String? title;
  final String? description;
  final String? amount;
  final bool? isIncome;
  final String? category;
  final String? dateTime;

  TransactionModel({
    required this.idUser,
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.isIncome,
    required this.category,
    required this.dateTime,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> json) =>
      TransactionModel(
        idUser: json["idUser"],
        id: json["id"],
        title: json["title"],
        description: json["description"],
        amount: json["amount"],
        isIncome: json["isIncome"],
        category: json["category"],
        dateTime: json["dateTime"],
      );

  Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "id": id,
        "title": title,
        "description": description,
        "amount": amount,
        "isIncome": isIncome,
        "category": category,
        "dateTime": dateTime,
      };
}
