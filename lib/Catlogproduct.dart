class Question {
  String? goods_name;
  int? goods_price;
  Question();
  Map<String, dynamic> toJson() =>
      {'goods_name': goods_name, 'goods_price': goods_price};
  Question.fromSnapshot(snapshot)
      : goods_name = snapshot.data()['goods_name'],
        goods_price = snapshot.data()['goods_price'];
}
