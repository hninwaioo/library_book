import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../persistence/hive_constants.dart';
import 'buy_links_vo.dart';

part 'book_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BOOK_VO, adapterName : "BookVOAdapter")
class BookVO {

  @JsonKey(name: "age_group")
  @HiveField(0)
  String? ageGroup;

  @JsonKey(name: "amazon_product_url")
  @HiveField(1)
  String? amazonProductUrl;

  //article_chapter_link
  @JsonKey(name: "article_chapter_link")
  @HiveField(2)
  String? articleChapterLink;

  // author
  @JsonKey(name: "author")
  @HiveField(3)
  String? author;

  //book_image
  @JsonKey(name: "book_image")
  @HiveField(4)
  String? bookImage;

  //book_image_width
  @JsonKey(name: "book_image_width")
  @HiveField(5)
  int? bookImageWidth;

  //book_image_height
  @JsonKey(name: "book_image_height")
  @HiveField(6)
  int? bookImageHeight;

  //book_review_link
  @JsonKey(name: "book_review_link")
  @HiveField(7)
  String? bookReviewLink;

  //contributor
  @JsonKey(name: "contributor")
  @HiveField(8)
  String? contributor;

  //contributor_note
  @JsonKey(name: "contributor_note")
  @HiveField(9)
  String? contributorNote;

  //created_date
  @JsonKey(name: "created_date")
  @HiveField(10)
  String? createdDate;

  //description
  @JsonKey(name: "description")
  @HiveField(11)
  String? description;

  //first_chapter_link
  @JsonKey(name: "first_chapter_link")
  @HiveField(12)
  String? firstChapterLink;

  //"price": "0.00",
  @JsonKey(name: "price")
  @HiveField(13)
  String? price;

  // "primary_isbn10": "1668001225",
  @JsonKey(name: "primary_isbn10")
  @HiveField(14)
  String? primaryIsbn10;

  // "primary_isbn13": "9781668001226",
  @JsonKey(name: "primary_isbn13")
  @HiveField(15)
  String? primaryIsbn13;

  // "book_uri": "nyt://book/3aa85e47-4df9-53ef-9957-a77753d3502c",
  @JsonKey(name: "book_uri")
  @HiveField(16)
  String? bookUri;

  // "publisher": "Atria",
  @JsonKey(name: "publisher")
  @HiveField(17)
  String? publisher;

  // "rank": 1,
  @JsonKey(name: "rank")
  @HiveField(18)
  int? rank;

  // "rank_last_week": 1,
  @JsonKey(name: "rank_last_week")
  @HiveField(19)
  int? rankLastWeek;

  // "sunday_review_link": "",
  @JsonKey(name: "sunday_review_link")
  @HiveField(20)
  String? sundayReviewLink;

  // "title": "IT STARTS WITH US",
  @JsonKey(name: "title")
  @HiveField(21)
  String? title;

  // "updated_date": "202-11-23 23:07:54",
  @JsonKey(name: "updated_date")
  @HiveField(22)
  String? updatedDate;

  // "weeks_on_list": 5,
  @JsonKey(name: "weeks_on_list")
  @HiveField(23)
  int? weeksOnList;

  // "buy_links": 5,
  @JsonKey(name: "buy_links")
  @HiveField(24)
  List<BuyLinksVO>? buyLinks;

  @JsonKey(name: "opened_date")
  @HiveField(25)
  String? openedDate;

  @JsonKey(name: "list_name")
  @HiveField(26)
  String? listName;

  @JsonKey(name: "is_added_library")
  @HiveField(27)
  bool? isAddedLibrary;

  @JsonKey(name: "is_added_shelf")
  @HiveField(28)
  bool? isAddedShelf;

  BookVO(
      this.ageGroup,
      this.amazonProductUrl,
      this.articleChapterLink,
      this.author,
      this.bookImage,
      this.bookImageWidth,
      this.bookImageHeight,
      this.bookReviewLink,
      this.contributor,
      this.contributorNote,
      this.createdDate,
      this.description,
      this.firstChapterLink,
      this.price,
      this.primaryIsbn10,
      this.primaryIsbn13,
      this.bookUri,
      this.publisher,
      this.rank,
      this.rankLastWeek,
      this.sundayReviewLink,
      this.title,
      this.updatedDate,
      this.weeksOnList,
      this.buyLinks,
      this.openedDate,
      this.listName,
      this.isAddedLibrary,
      this.isAddedShelf);

  factory BookVO.fromJson(Map<String,dynamic> json) => _$BookVOFromJson(json);
  Map<String,dynamic> toJson() => _$BookVOToJson(this);

  @override
  String toString() {
    return 'BookVO{ageGroup: $ageGroup, amazonProductUrl: $amazonProductUrl, articleChapterLink: $articleChapterLink, author: $author, bookImage: $bookImage, bookImageWidth: $bookImageWidth, bookImageHeight: $bookImageHeight, bookReviewLink: $bookReviewLink, contributor: $contributor, contributorNote: $contributorNote, createdDate: $createdDate, description: $description, firstChapterLink: $firstChapterLink, price: $price, primaryIsbn10: $primaryIsbn10, primaryIsbn13: $primaryIsbn13, bookUri: $bookUri, publisher: $publisher, rank: $rank, rankLastWeek: $rankLastWeek, sundayReviewLink: $sundayReviewLink, title: $title, updatedDate: $updatedDate, weeksOnList: $weeksOnList, buyLinks: $buyLinks, openedDate: $openedDate, listName: $listName, isAddedLibrary: $isAddedLibrary, isAddedShelf: $isAddedShelf}';
  }
}