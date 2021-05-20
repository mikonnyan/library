package core.po;

public class BookRoom {
    private String room;            //图书室
    private String bookrack;        //书架号
    private String categories;     //大类
    private String genre;           //小类
    private String isbn;            //图书isbn码


    @Override
    public String toString() {
        return "BookRoom{" +
                "room='" + room + '\'' +
                ", bookrack='" + bookrack + '\'' +
                ", categories='" + categories + '\'' +
                ", genre='" + genre + '\'' +
                ", isbn='" + isbn + '\'' +
                '}';
    }

    public BookRoom() {
    }

    public BookRoom(String room, String bookrack, String categories, String genre, String isbn) {
        this.room = room;
        this.bookrack = bookrack;
        this.categories = categories;
        this.genre = genre;
        this.isbn = isbn;
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



    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
}
