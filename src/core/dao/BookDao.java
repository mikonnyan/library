package core.dao;

import core.po.*;

import java.util.List;

public interface BookDao {
    public List<Book> selectBookList(Book book);
    Integer selectBookListCount(Book book);







    public int updatebook(Book book);             //更新书籍信息

    public Integer addborrownumber(BookBorrowNumber bookBorrowNumber);//增加图书借阅次数记录

    public Integer creatBorrowBook(BookBorrowNumber bookBorrowNumber);    //添加借阅书籍
    public BookBorrowNumber selectTopBook(BookBorrowNumber bookBorrowNumber);

    public  int createBook(AddBook addBook);//创建图书
    public void creatBookRoom(BookRoom bookRoom);       //创建图书位置信息
    public void creatBookgenre(BookRoom bookRoom);       //创建图书分类信息
    public BookNumber selectBookNumberByISBN(String isbn);    //通过isbn码查询图书数量
    public int creatBookNumber(AddBook addBook);     //通过isbn码创建图书数量的数据
    public Book getBookByIsbn(String id);    //通过书籍Isbn查询信息
    public void upDataBookNumber(Book book);     //通过isbn码更新图书数量的数据
    public void upDataBookRoom(Book book);       //更新图书位置信息
    public void upDataBookgenre(Book book);       //更新图书分类信息
    public int deleteBook(String isbn);         //删除图书
    public void borrowlogset(Borrow borrow);    //创建借阅书籍记录
    public BookNumber getBookNowNumber(String isbn);  //通过isbn获取当前图书数量
    public void setBorrowBook(Borrow borrowBook);       //借阅书籍
    public int changeBookBorrowNumber(BookNumber bookNumber);    //更改书籍总借阅量与在馆图书数量
    List<Book> selectBorrowBookList(User user);          //读者借阅列表
    List<BookLog> selectReaderBookList(User user);          //读者查询借阅列表
    Integer selectBorrowBookListCount(Integer usercode);        //查询读者借出书籍总数目
    public Borrow expirationTime(Borrow borrow);           //获取书籍的到期时间
    public void returnlogset(Borrow borrow);    //还书记录设置
    public Borrow selectTotalBorrow(Borrow borrow);  //归还书籍,在馆数量更改
    public void returnBook(Borrow borrow);  //归还书籍,在馆数量更改
    public int deleteUserBorrow(Borrow borrow); //通过isbn与用户卡号删除借书记录
}
