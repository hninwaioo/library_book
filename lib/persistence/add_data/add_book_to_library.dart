import '../../data/vos/book_vo.dart';

class AddBookToLibrary{
  List<BookVO?>? bookListInLibrary = [];

  void addBook (BookVO? book){
    bookListInLibrary?.add(book);
  }

  @override
  String toString() {
    return 'AddBookToLibrary{bookListInLibrary: $bookListInLibrary}';
  }
}