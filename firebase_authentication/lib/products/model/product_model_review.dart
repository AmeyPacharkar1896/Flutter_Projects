class ProductModelReviews {
  ProductModelReviews({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ProductModelReviews.fromMap(Map<String, dynamic> map) {
    return ProductModelReviews(
      rating: map['rating'] as int,
      comment: map['comment'] as String,
      date: map['date'] as String,
      reviewerName: map['reviewerName'] as String,
      reviewerEmail: map['reviewerEmail'] as String,
    );
  }
  
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;
}
