package core.service.impl;

import core.dao.BookDao;
import core.po.*;
import core.service.BookService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import utils.Page;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("BookService")
@Transactional
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;

    /**
     * 查询图书信息
     */
    @Override
    public Page<Book> findBookList(Integer page, Integer rows, String title, String isbn) {
//        AddBook addBook = new AddBook();
        Book book = new Book();
        //判断图书名称
        if(StringUtils.isNotBlank(title)){
         book.setTitle(title);
        }
        if(isbn!=null){
            book.setIsbn(isbn);
        }
        //设置当前页
        book.setStart((page-1)*rows);
        //每页数
        book.setRows(rows);
        //查询图书列表
        List<Book> books = bookDao.selectBookList(book);
        //查询图书的总记录数
        Integer count = bookDao.selectBookListCount(book);
        //创建Page返回对象
        Page<Book> result = new Page<Book>();
        result.setPage(page);
        result.setRows(books);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }


    @Override
    public Page<Book> findBorrowBookList(Integer page, Integer rows, Integer usercode) {
        User user = new User();
        //设置当前页
        user.setStart((page-1)*rows);
        //每页数
        user.setRows(rows);
        user.setUser_code(usercode);
        //查询图书列表
        List<Book> books = bookDao.selectBorrowBookList(user);
        //查询个人借阅图书的记录数
        Integer count = bookDao.selectBorrowBookListCount(usercode);
        System.out.println("个人借阅图书的记录数:"+count);
        //创建Page返回对象
        Page<Book> result = new Page<Book>();
        result.setPage(page);
        result.setRows(books);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }
//    findReaderBookList
@Override
public Page<BookLog> findReaderBookList(Integer page, Integer rows, Integer usercode) {
    User user = new User();
    //设置当前页
    user.setStart((page-1)*rows);
    //每页数
    user.setRows(rows);
    user.setUser_code(usercode);

    //查询借阅图书列表
    List<BookLog> books = bookDao.selectReaderBookList(user);
    //查询个人借阅图书的记录数
    Integer count = bookDao.selectBorrowBookListCount(usercode);
    System.out.println("个人借阅图书的记录数:"+count);
    //创建Page返回对象
    Page<BookLog> result = new Page<BookLog>();
    result.setPage(page);
    result.setRows(books);
    result.setSize(rows);
    result.setTotal(count);
    return result;
}

    @Override
    public Boolean setBorrowBook(Borrow borrow) {
        bookDao.setBorrowBook(borrow);
        return true;
    }

    @Override
    public Boolean returnBook(Borrow borrow) {
        Borrow borrow1=bookDao.selectTotalBorrow(borrow);
        borrow.setNownumber(borrow1.getNownumber());
        borrow.setTotal_borrow(borrow1.getTotal_borrow());
        borrow.setNownumber(borrow.getNownumber()+1);           //在馆图书+1
        borrow.setTotal_borrow(borrow.getTotal_borrow());
        bookDao.returnBook(borrow);
        int flag=bookDao.deleteUserBorrow(borrow);
        if (flag>0){
            return true;
        }else {
            return false;
        }
    }


    //    /**
//     * 将短时间格式字符串计算还书时间后返回
//     */
    @Override
    public String strToDate(String strDate) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        ParsePosition pos = new ParsePosition(0);
        Date strtodate = formatter.parse(strDate, pos);
        String T_year;
        T_year = strDate.substring(0,4);            //年
        Integer year= Integer.valueOf(T_year);
        String T_month = strDate.substring(5,7);    //月
        Integer month = Integer.valueOf(T_month);
        String T_day = strDate.substring(8,10);     //日
        Integer day = Integer.valueOf(T_day);
        Integer borrowDay = 60;                     //借阅天数
        Integer[] a1 = {31,28,31,30,31,30,31,31,30,31,30,31};
        Integer[] a2 = {31,29,31,30,31,30,31,31,30,31,30,31};
        for(int e=0;e<borrowDay;e++){
            if ((year%4==0&&year%100!=0)||year%400==0){
                    if (day<a2[month]){
                        day++;
                    }else {
                        day = 1;
                        month++;
                        if (month>12){
                            month=1;
                            year++;
                        }
                    }
            }else {
                if (day<a1[month]){
                    day++;
                }else {
                    day = 1;
                    month++;
                    if (month>12){
                        month=1;
                        year++;
                    }
                }
            }
        }
        String s_month;
        if (month<10){
            s_month="0"+month;
        }else {
            s_month= String.valueOf(month);
        }
        String s_day;
        if (day<10){
            s_day="0"+day;
        }else {
            s_day= String.valueOf(day);
        }
        String returnTime = (year+"-"+s_month+"-"+s_day);
        System.out.println(year+"年"+month+"月"+day+"日");
        return returnTime;
    }
    //通过isbn获取当前图书数量与历史借阅数量
    @Override
    public BookNumber getBookNowNumber(String isbn) {
        return bookDao.getBookNowNumber(isbn);
    }

    @Override
    public void borrowlogset(Borrow borrow) {
        borrow.setState("未逾期");
        bookDao.borrowlogset(borrow);
    }
    @Override
    public void returnlogset(Borrow borrow) {
//        beginTime.compareTo(endTime)<0时，开始时间小于结束时间
//        String isbn = borrow.getIsbn();
//        Integer usercode = borrow.getUsercode();
//        Borrow borrow1=new Borrow();
//        borrow1.setIsbn(isbn);
        Borrow a1=bookDao.expirationTime(borrow);
        String returnTime = a1.getReturntime();
        borrow.setReturntime(returnTime);          //获取到期时间
//        borrow.setTime(bookDao.expirationTime(borrow).getReturntime());
        String  returntime= borrow.getReturntime();
        String borrowtime = borrow.getTime();
        System.out.println("到期时间:"+borrowtime+"归还时间:"+returntime);
        if (borrowtime.compareTo(returntime)>=0){
            borrow.setState("逾期");
        }else {
            borrow.setState("未逾期");
        }
        bookDao.returnlogset(borrow);
    }

    /**
     * 判断用户是否已借阅书籍
     */
    @Override
    public Boolean UserBorrowedBook(Borrow borrow) {
        borrow=bookDao.expirationTime(borrow);
        if (borrow==null){
            return false;
        }else {
            return true;
        }
    }

    @Override
    public int creatBook(AddBook addBook) {
         return bookDao.createBook(addBook);
    }

    /**
     * 通过书籍ID查询书籍信息
     */
    @Override
    public Book getBookByIsbn(String isbn) {
        Book book = bookDao.getBookByIsbn(isbn);
        return book;
    }

    /**
     * 修改数据
     */
    @Override
    public int bookUpDate(Book book) {
        bookDao.upDataBookgenre(book);
        bookDao.upDataBookNumber(book);
        bookDao.upDataBookRoom(book);
        return bookDao.updatebook(book);
    }

    @Override
    public int deleteBook(String isbn) {
        return bookDao.deleteBook(isbn);
    }

    /**
     *      测试方法
     */
    @Override
    public Testdate testdate() {
        Testdate test = new Testdate(11,22,33,44);
        return test;
    }

    /**
     * 增加图书借阅次数
     */
    @Override
    public Integer addborrownumber(BookNumber bookNumber) {
        bookNumber.setNownumber(bookNumber.getNownumber()-1);
        bookNumber.setTotal_borrow(bookNumber.getTotal_borrow()+1);
        return bookDao.changeBookBorrowNumber(bookNumber);
    }



    @Override
    public BookBorrowNumber selectTopBook(BookBorrowNumber bookBorrowNumber) {
        System.out.println(bookDao.selectTopBook(bookBorrowNumber));
        bookBorrowNumber = bookDao.selectTopBook(bookBorrowNumber);
        return bookBorrowNumber;
    }

    @Override
    public void creatBookRoomAndGenre(BookRoom bookRoom) {
        System.out.println(bookRoom);
        bookDao.creatBookgenre(bookRoom);
        bookDao.creatBookRoom(bookRoom);
    }

    /**
     * 通过isbn码查询图书数量
     */
    @Override
    public BookNumber selectBookNumberByISBN(String isbn) {
        return bookDao.selectBookNumberByISBN(isbn);
    }

    @Override
    public int creatBookNumber(AddBook addBook) {
        if (addBook.getNumber()==null){
            addBook.setNumber(1);
        }
        return bookDao.creatBookNumber(addBook);
    }

    @Override
    public Page<Book> findLibraryBookList(Integer page, Integer rows, String name, String isbn) {
        AddBook addBook = new AddBook();
        Book book = new Book();
        //判断图书名称
        if(StringUtils.isNotBlank(name)){
            book.setTitle(name);
        }
        if(isbn!=null){
            book.setIsbn(isbn);
        }
//        if(StringUtils.isNotBlank(press)){
//            book.setPress(press);
//        }
//        if(StringUtils.isNotBlank(flname)){
//            book.setFlname(flname);
//        }
        //设置当前页
        book.setStart((page-1)*rows);
        //每页数
        book.setRows(rows);
        //查询图书列表
        List<Book> books = bookDao.selectBookList(book);
        //查询图书的总记录数
        Integer count = bookDao.selectBookListCount(book);
        //创建Page返回对象
        Page<Book> result = new Page<Book>();
        result.setPage(page);
        result.setRows(books);
        result.setSize(rows);
        result.setTotal(count);
        return result;

    }

}
