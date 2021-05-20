package core.service.impl;

import core.dao.BookLogDao;
import core.po.BookLog;
import core.service.BookLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import utils.Page;

import java.util.List;

@Service("BookLogService")
@Transactional
public class BookLogServiceImpl implements BookLogService {
    @Autowired
    private BookLogDao bookLogDao;
    @Override
    public Page<BookLog> findBookLogList(Integer page, Integer rows) {
        BookLog bookLog =new BookLog();
        //设置当前页
        bookLog.setStart((page-1)*rows);
        //每页数
        bookLog.setRows(rows);
        //查询图书列表
        List<BookLog> bookLogs = bookLogDao.selectBookLogList(bookLog);
        //查询图书的总记录数
        Integer count = bookLogDao.selectBookLogListCount(bookLog);
        //创建Page返回对象
        Page<BookLog> result = new Page<BookLog>();
        result.setPage(page);
        result.setRows(bookLogs);
        result.setSize(rows);
        result.setTotal(count);
        return result;

    }
    @Override
    public Integer deleteBookLog(Integer id){
        return bookLogDao.deleteBookLog(id);
    }
//    deleteBookLog
}
