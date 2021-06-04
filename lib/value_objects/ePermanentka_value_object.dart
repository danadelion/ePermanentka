class EPermanentkaValueObject {
  late String id;
  late String userId;
  late DateTime created;

  EPermanentkaValueObject(Map data, {id = ''}) {
    this.id = id;
    this.userId = data['user'];
    this.created = data.containsKey('created')
        ? DateTime.parse(data['created'])
        : DateTime.now();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'permanentkaId': id,
      'user': userId,
      'created': created.toString(),
    };
    return map;
  }
}
