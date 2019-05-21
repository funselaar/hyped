class Trip {
  String image;
  String title;
  DateTime date = DateTime.now();
  DateTime creation = DateTime.now();
  
  Trip({
    this.date,
    this.image,
    this.title
  }) {
    creation = DateTime(2019, 2, 9);
  }

}
