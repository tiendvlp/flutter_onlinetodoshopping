enum QuestionType { WHERE, AVAILABLE_TIME, PRICE, DEADLINE, COUNT }

class QuestionEntity {
  QuestionType _type;

  QuestionEntity(QuestionType type) {
    assert(type != null);
    _type = type;
  }

  get type => _type;
}
