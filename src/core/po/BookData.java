package core.po;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BookData {
    private String borrowTime;
    private String returnTime;

    @Override
    public String toString() {
        return "BookData{" +
                "borrowTime='" + borrowTime + '\'' +
                ", returnTime='" + returnTime + '\'' +
                '}';
    }


//    /**
//     * 将短时间格式字符串转换为时间 yyyy-MM-dd
//     */
//    public static Date strToDate(String strDate) {
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//        ParsePosition pos = new ParsePosition(0);
//        Date strtodate = formatter.parse(strDate, pos);
//        return strtodate;
//    }

    public String getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(String borrowTime) {
        this.borrowTime = borrowTime;
    }

    public String getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(String returnTime) {
        this.returnTime = returnTime;
    }
}

