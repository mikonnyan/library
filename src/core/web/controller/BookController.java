package core.web.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import core.po.*;
import core.service.BookService;
import core.service.UserService;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.HttpUtils;
import utils.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private UserService userService;
    /**
     * 用户查询图书列表
     */
    @RequestMapping("/book.action")
    public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
                       String name, String isbn, Model model){
        //条件查询所有图书
        Page<Book> books = bookService.findBookList(page, rows, name, isbn);
        model.addAttribute("page",books);
        return "book";
    }
//    @RequestMapping("/borrowBook")
//    public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
//                       String reader ,Model model){
//        //条件查询所有客户
//        System.out.println("开始查询登录用户借阅书籍"+"reader:"+reader);
//        Page<Book> books = bookService.findBorrowBookList(page, rows,reader);
//        model.addAttribute("page",books);
//        return "book";
//    }
    //用户借阅书籍
    @ResponseBody
    @RequestMapping("/borrowBook.action")
    public String borrowBook(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,String isbn, Model model, HttpSession session){
        Integer usercode = (Integer) session.getAttribute("usercode");

        //判断用户是否已借阅这本书籍
        Borrow borrow1=new Borrow();
        borrow1.setIsbn(isbn);
        borrow1.setUsercode(usercode);
        if (bookService.UserBorrowedBook(borrow1)){
            return "HAVE";
        }
        //获得当前时间
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String time = formatter.format(currentTime);
        //计算书籍到期时间
        Borrow borrow = new Borrow(time,usercode,isbn,bookService.strToDate(time));
        BookNumber bookNumber = bookService.getBookNowNumber(isbn);     //通过isbn获取现有图书数量与历史借阅数量
        bookService.borrowlogset(borrow);   //创建借阅记录
        bookService.setBorrowBook(borrow);  //创建借阅图书
        bookService.addborrownumber(bookNumber);        //更改现有图书数量与历史借阅数量
//        session.setAttribute("msg","借阅成功");
        return "OK";
    }

    /**
     * 返回借阅书籍页面
     */
    @RequestMapping("/myBorrowBook.action")
    public String myBorrowBook( @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,HttpSession session,Model model){
        Integer usercode = (Integer) session.getAttribute("usercode");
        Page<BookLog> books = bookService.findReaderBookList(page,rows,usercode);
        model.addAttribute("page",books);
        System.out.println("查询完成，返回页面");
        model.addAttribute("msg",session.getAttribute("msg"));
        session.removeAttribute("msg");
        return "borrowbook";
    }
    @ResponseBody
    @RequestMapping("/returnBook.action")
    public String returnBook(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,String isbn,HttpSession session,Model model){
        Integer usercode = (Integer) session.getAttribute("usercode");
//        Integer userId = (Integer) session.getAttribute("usercode");
        //获得当前时间
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String time = formatter.format(currentTime);
        Borrow borrow = new Borrow(time,usercode,isbn);
//        borrow.setReturntime(returntime);
        bookService.returnlogset(borrow);
        Boolean flag;
        flag=bookService.returnBook(borrow);
        if (flag){
            return "OK";
        }else {
            return "FALL";
        }
    }
    /**
     * 创建图书
     */
    @RequestMapping("/createbook.action")
    @ResponseBody
    public String creatBook( BookRoom bookRoom,AddBook addBook,HttpSession session){
        System.out.println("准备创建图书");
        //获取Session中当前用户信息
        User user = (User) session.getAttribute("USER_SESSION");
        //将当前用户id储存在对象中
        Integer number = addBook.getNumber();
        System.out.println("添加图书数量:"+addBook.getNumber());
        addBook=isbnAdd(addBook.getIsbn());
        if (addBook==null){
            return "FALL";
        }
        BookNumber bookNumber = bookService.selectBookNumberByISBN(addBook.getIsbn());  //通过isbn码查询图书数量
        //书籍为第一次添加
        if (bookNumber==null){
            addBook.setNumber(number);
            int rows = bookService.creatBook(addBook);
            bookService.creatBookNumber(addBook);
            System.out.println("添加完成");
            if (rows>0){
                bookService.creatBookRoomAndGenre(bookRoom);
                return "OK";
            }else{
                return "FALL";
            }
        }else {
            return "HAVE";
        }
    }
    public AddBook isbnAdd(String isbn){
        String host = "https://jisuisbn.market.alicloudapi.com";
        String path = "/isbn/query";
        String method = "ANY";
        String appcode = "bdf61801cd2b49fca11e7bf605a2aaf3";//更改此处appcode为你自己购买的appcode
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        //根据API的要求，定义相对应的Content-Type
        headers.put("Content-Type", "application/json; charset=UTF-8");
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("isbn", isbn);
        System.out.println("isbn:"+isbn);
        try {
            HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
//            System.out.println(response.toString());
            //获取response的body
//            System.out.println(EntityUtils.toString(response.getEntity(),"utf-8"));
//            InputStream is = null;
            String objectStr = EntityUtils.toString(response.getEntity(),"utf-8");
            System.out.println(objectStr);
//            System.out.println(objectStr);


            JSONObject shop_user = JSON.parseObject(objectStr);
//            System.out.println(shop_user.get("status"));
            AddBook addBook = new AddBook();
//            System.out.println(shop_user.getString("status").toString());
            System.out.println(shop_user.get("status"));
            if (shop_user.get("status").equals(0)){
                addBook.setTitle(JSON.parseObject(shop_user .getString("result")).getString("title"));
                addBook.setSubtitle(JSON.parseObject(shop_user .getString("result")).getString("subtitle"));
                addBook.setPic(JSON.parseObject(shop_user .getString("result")).getString("pic"));
                addBook.setAuthor(JSON.parseObject(shop_user .getString("result")).getString("author"));
                addBook.setSummary(JSON.parseObject(shop_user .getString("result")).getString("summary"));
                addBook.setPublisher(JSON.parseObject(shop_user .getString("result")).getString("publisher"));
                addBook.setPubplace(JSON.parseObject(shop_user .getString("result")).getString("pubplace"));
                addBook.setPubdate(JSON.parseObject(shop_user .getString("result")).getString("pubdate"));
                addBook.setPage(JSON.parseObject(shop_user .getString("result")).getString("page"));
                addBook.setPrice(JSON.parseObject(shop_user .getString("result")).getString("price"));
                addBook.setBinding(JSON.parseObject(shop_user .getString("result")).getString("binding"));
                addBook.setIsbn(JSON.parseObject(shop_user .getString("result")).getString("isbn"));
                addBook.setIsbn10(JSON.parseObject(shop_user .getString("result")).getString("isbn10"));
                addBook.setKeyword(JSON.parseObject(shop_user .getString("result")).getString("keyword"));
                addBook.setEdition(JSON.parseObject(shop_user .getString("result")).getString("edition"));
                addBook.setImpression(JSON.parseObject(shop_user .getString("result")).getString("impression"));
                addBook.setLanguage(JSON.parseObject(shop_user .getString("result")).getString("language"));
                addBook.setFormat(JSON.parseObject(shop_user .getString("result")).getString("format"));
                addBook.setCip(JSON.parseObject(shop_user .getString("result")).getString("cip"));
//            AddBook addBook = (AddBook) JSONObject.toBean(JSONObject.fromObject(objectStr), AddBook.class);
                System.out.println(addBook.toString());
                System.out.println("图书添加成功");
            }else {
                System.out.println("isbn码错误");
                return null;
            }
            return  addBook;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    /**
     * 通过图书isbn获得信息
     */
    @RequestMapping("/getBookByIsbn.action")
    @ResponseBody
    public Book getBookByIsbn(String isbn){
        System.out.println("查询修改图书数据");
        Book book = bookService.getBookByIsbn(isbn);
        System.out.println("查询出的图书信息:"+book.toString());
        System.out.println(book.getNumber());
        return book;
    }
    /**
     * 管理员查询图书列表
     */
    @RequestMapping("/bookadmin.action")
    public String bookadminlist(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
                       String title, String isbn, Model model,HttpSession session){
        //条件查询所有图书
        Page<Book> books = bookService.findBookList(page, rows, title,isbn);
        model.addAttribute("page",books);
        model.addAttribute("isbn",isbn);
        //通过用户等级设定返回页面
        String backURL;
        Integer userLevel;
        userLevel= (Integer) session.getAttribute("userLevel");
        if (userLevel.equals(1)){
            backURL="bookadministrator";
        }else {
            backURL="book";
        }
        return backURL;
    }
    /**
     * 更新图书信息
     */
    @RequestMapping("/bookupdate.action")
    @ResponseBody
    public String bookupdate(Book book){
        int rows = bookService.bookUpDate(book);
        if (rows>0){
            return "OK";        //更改成功返回提示
        }else{
            return "FALL";      //更改失败返回提示
        }
    }
    /**
     * 删除图书
     */
    @RequestMapping("/bookdelete.action")
    @ResponseBody
    public String bookdelete(String isbn){
        int rows = bookService.deleteBook(isbn);
        System.out.println("删除操作执行完毕");
        if (rows>0){
            return "OK";        //删除成功返回提示
        }else{
            return "FALL";      //删除失败返回提示
        }
    }

    /**
     * 测试类
     */
    @RequestMapping("/testdate.action")
    public String testdate(Model model){
        Testdate test = bookService.testdate();
        model.addAttribute("testa1",test.getA1());
        model.addAttribute("testa2",test.getA2());
        System.out.println("返回页面");
        return "test2";
    }
    @RequestMapping("/gettopbooks.action")
    public String gettopbooks(Model model){
        BookBorrowNumber bookBorrowNumber = new BookBorrowNumber();
        bookBorrowNumber.setRows(1);
        bookBorrowNumber.setStart(0);
        bookBorrowNumber = bookService.selectTopBook(bookBorrowNumber);
        System.out.println(bookBorrowNumber);
        model.addAttribute("number1",bookBorrowNumber.getTotal_borrow());
        model.addAttribute("book1",bookBorrowNumber.getTitle());
        bookBorrowNumber.setStart(1);
        bookBorrowNumber.setRows(1);
        bookBorrowNumber = bookService.selectTopBook(bookBorrowNumber);
        model.addAttribute("number2",bookBorrowNumber.getTotal_borrow());
        model.addAttribute("book2",bookBorrowNumber.getTitle());
        bookBorrowNumber.setStart(2);
        bookBorrowNumber.setRows(1);
        bookBorrowNumber = bookService.selectTopBook(bookBorrowNumber);
        model.addAttribute("number3",bookBorrowNumber.getTotal_borrow());
        model.addAttribute("book3",bookBorrowNumber.getTitle());
        bookBorrowNumber.setStart(3);
        bookBorrowNumber.setRows(1);
        bookBorrowNumber = bookService.selectTopBook(bookBorrowNumber);
        model.addAttribute("number4",bookBorrowNumber.getTotal_borrow());
        model.addAttribute("book4",bookBorrowNumber.getTitle());
        bookBorrowNumber.setStart(4);
        bookBorrowNumber.setRows(1);
        bookBorrowNumber = bookService.selectTopBook(bookBorrowNumber);
;        model.addAttribute("number5",bookBorrowNumber.getTotal_borrow());
        model.addAttribute("book5",bookBorrowNumber.getTitle());

        model.addAttribute("testa1","123");
        model.addAttribute("testa2","asd");
        return "bookadministrator_TopFive";
    }

    /**
     * 图书管理员图书借阅办理
     */
    @RequestMapping("/adminBorrowBook.action")
    public String adminBorrowBook(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
                                String title, String isbn, Model model,HttpSession session){
        //条件查询所有图书
        Page<Book> books = bookService.findBookList(page, rows, title,isbn);
        model.addAttribute("page",books);
        model.addAttribute("isbn",isbn);
        return "bookadministrator_BorrowBook";
    }
    /**
     * 管理员图书归还
     */
    @RequestMapping("/adminReturnBook.action")
    public String adminReturnBook(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
                                  Integer usercode, String isbn, Model model,HttpSession session){
        //条件查询所有图书
        Page<Book> books = bookService.findBorrowBookList(page, rows, usercode);
        session.setAttribute("usercode",usercode);
        model.addAttribute("page",books);
        model.addAttribute("isbn",isbn);
        return "bookadministrator_ReturnBook";
    }
}
