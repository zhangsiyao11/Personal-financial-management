package com.zsy.finance.dao;

import com.zsy.finance.bean.Income;
import com.zsy.finance.bean.IncomeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface IncomeMapper {
    long countByExample(IncomeExample example);

    int deleteByExample(IncomeExample example);

    int deleteByPrimaryKey(Integer incomeid);

    int insert(Income record);

    int insertSelective(Income record);

    List<Income> selectByExample(IncomeExample example);
    
    List<Income> selectByUsername(String username);

    Income selectByPrimaryKey(Integer incomeid);

    int updateByExampleSelective(@Param("record") Income record, @Param("example") IncomeExample example);

    int updateByExample(@Param("record") Income record, @Param("example") IncomeExample example);

    int updateByPrimaryKeySelective(Income record);

    int updateByPrimaryKey(Income record);
}