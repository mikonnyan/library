package core.po;

public class AddBook {
    private String title   ;
    private String subtitle;
    private String pic;
    private String author;
    private String summary;
    private String publisher;
    private String pubplace;
    private String pubdate;
    private String page;
    private String price;
    private String binding;
    private String isbn;
    private String isbn10;
    private String keyword;
    private String edition;
    private String impression;
    private String language;
    private String format;
    //    private String class;
    private String cip;
    private Integer number;         //图书数量
    @Override
    public String toString() {
        return "AddBook{" +
                "title='" + title + '\'' +
                ", subtitle='" + subtitle + '\'' +
                ", pic='" + pic + '\'' +
                ", author='" + author + '\'' +
                ", summary='" + summary + '\'' +
                ", publisher='" + publisher + '\'' +
                ", pubplace='" + pubplace + '\'' +
                ", pubdate='" + pubdate + '\'' +
                ", page=" + page +
                ", price=" + price +
                ", binding='" + binding + '\'' +
                ", isbn=" + isbn +
                ", isbn10=" + isbn10 +
                ", keyword='" + keyword + '\'' +
                ", edition='" + edition + '\'' +
                ", impression='" + impression + '\'' +
                ", language='" + language + '\'' +
                ", format='" + format + '\'' +
                '}';
    }

    public AddBook(String title, String subtitle, String pic, String author, String summary, String publisher, String pubplace, String pubdate, String page, String price, String binding, String isbn, String isbn10, String keyword, String edition, String impression, String language, String format, String cip) {
        this.title = title;
        this.subtitle = subtitle;
        this.pic = pic;
        this.author = author;
        this.summary = summary;
        this.publisher = publisher;
        this.pubplace = pubplace;
        this.pubdate = pubdate;
        this.page = page;
        this.price = price;
        this.binding = binding;
        this.isbn = isbn;
        this.isbn10 = isbn10;
        this.keyword = keyword;
        this.edition = edition;
        this.impression = impression;
        this.language = language;
        this.format = format;
        this.cip = cip;
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

    public AddBook() {
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}
