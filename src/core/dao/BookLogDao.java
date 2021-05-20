package core.dao;

import core.po.Book;
import core.po.BookLog;

import java.util.List;

public interface BookLogDao {
    public List<BookLog> selectBookLogList(BookLog bookLog);
    public Integer selectBookLogListCount(BookLog bookLog);
    public Integer deleteBookLog(Integer id);        //通过记录删除图书记录
}
