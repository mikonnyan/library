package core.po;

public class Book {
    private Integer id;         //编号
    private String flname;      //分类
    private String name;        //图书名称
    private Integer money;      //价格
    private String press;       //出版社
    private String state;       //是否借出
    private Integer reader;      //借出人
    private String time;        //借出时间
    private String returntime;  //到期时间
    private Integer start;      // 起始行
    private Integer rows;       // 所取行数

    private String title   ;    //书名
    private String subtitle;    //副书名
    private String pic;         //图片
    private String author;      //作者
    private String summary;     //摘要
    private String publisher;   //出版社
    private String pubplace;    //出版地
    private String pubdate;     //出版时间
    private String page;        //页数
    private String price;       //价格
    private String binding;     //装帧方式
    private String isbn;        //ISBN
    private String isbn10;      //ISBN 10位
    private String keyword;     //主题词
    private String edition;     //版次
    private String impression;  //印次
    private String language;    //正文语种
    private String format;      //开本
    //    private String class;
    private String cip;         //CIP核准号

    private String room;            //图书室
    private String bookrack;        //书架号
    private String categories;     //大类
    private String genre;           //小类
    private Integer number;         //图书数量
    private Integer nownumber;      //在馆数量

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", flname='" + flname + '\'' +
                ", name='" + name + '\'' +
                ", money=" + money +
                ", press='" + press + '\'' +
                ", state='" + state + '\'' +
                ", reader=" + reader +
                ", time='" + time + '\'' +
                ", returntime='" + returntime + '\'' +
                ", start=" + start +
                ", rows=" + rows +
                ", title='" + title + '\'' +
                ", subtitle='" + subtitle + '\'' +
                ", pic='" + pic + '\'' +
                ", author='" + author + '\'' +
                ", summary='" + summary + '\'' +
                ", publisher='" + publisher + '\'' +
                ", pubplace='" + pubplace + '\'' +
                ", pubdate='" + pubdate + '\'' +
                ", page='" + page + '\'' +
                ", price='" + price + '\'' +
                ", binding='" + binding + '\'' +
                ", isbn='" + isbn + '\'' +
                ", isbn10='" + isbn10 + '\'' +
                ", keyword='" + keyword + '\'' +
                ", edition='" + edition + '\'' +
                ", impression='" + impression + '\'' +
                ", language='" + language + '\'' +
                ", format='" + format + '\'' +
                ", cip='" + cip + '\'' +
                ", room='" + room + '\'' +
                ", bookrack='" + bookrack + '\'' +
                ", categories='" + categories + '\'' +
                ", genre='" + genre + '\'' +
                ", number=" + number +
                '}';
    }

    /***
     *      添加参数，完成查询中
     */



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFlname() {
        return flname;
    }

    public void setFlname(String flname) {
        this.flname = flname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getReader() {
        return reader;
    }

    public void setReader(Integer reader) {
        this.reader = reader;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getReturntime() {
        return returntime;
    }

    public void setReturntime(String returntime) {
        this.returntime = returntime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getPubplace() {
        return pubplace;
    }

    public void setPubplace(String pubplace) {
        this.pubplace = pubplace;
    }

    public String getPubdate() {
        return pubdate;
    }

    public void setPubdate(String pubdate) {
        this.pubdate = pubdate;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBinding() {
        return binding;
    }

    public void setBinding(String binding) {
        this.binding = binding;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getIsbn10() {
        return isbn10;
    }

    public void setIsbn10(String isbn10) {
        this.isbn10 = isbn10;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public String getImpression() {
        return impression;
    }

    public void setImpression(String impression) {
        this.impression = impression;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getCip() {
        return cip;
    }

    public void setCip(String cip) {
        this.cip = cip;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getBookrack() {
        return bookrack;
    }

    public void setBookrack(String bookrack) {
        this.bookrack = bookrack;
    }

    public String getCategories() {
        return categories;
    }

    public void setCategories(String categories) {
        this.categories = categories;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getNownumber() {
        return nownumber;
    }

    public void setNownumber(Integer nownumber) {
        this.nownumber = nownumber;
    }
}
