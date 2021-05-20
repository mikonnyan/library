package core.service.impl;

import core.dao.BaseDictDao;
import core.po.BaseDict;
import core.service.BaseDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 数据字典Service接口实现类
 */
@Service("baseDictService")
public class BaseDictServiceImpl implements BaseDictService {
    @Autowired
    private BaseDictDao baseDictDao;
    @Override
    public List<BaseDict> findBaseDictTypeCode(String typecode) {
        //根据类别代码查询数字字典
        return baseDictDao.selectBaseDictTypeCode(typecode);
    }
}
