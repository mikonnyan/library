package core.service;

import core.po.BookLog;
import utils.Page;

public interface BookLogService {
    public Page<BookLog> findBookLogList(Integer page, Integer rows);
    public Integer deleteBookLog(Integer id);       //删除借阅记录
}
