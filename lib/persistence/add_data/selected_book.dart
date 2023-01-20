import '../../data/vos/book_vo.dart';

SelectedBook(BookVO bookVO){
  var openDate = DateTime.now();

  bookVO.openedDate = openDate.toString();
  bookVO.isAddedLibrary = true;
  return bookVO;
}