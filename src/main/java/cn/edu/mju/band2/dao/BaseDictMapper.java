package cn.edu.mju.band2.dao;

import cn.edu.mju.band2.po.BaseDict;

import java.util.List;

public interface BaseDictMapper {
    public List<BaseDict> selectBaseDictByTypeCode(String typecode);
}
