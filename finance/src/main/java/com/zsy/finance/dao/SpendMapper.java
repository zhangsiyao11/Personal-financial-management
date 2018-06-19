package com.zsy.finance.dao;

import com.zsy.finance.bean.Res;
import com.zsy.finance.bean.Spend;
import com.zsy.finance.bean.SpendExample;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface SpendMapper {
	
    long countByExample(SpendExample example);

    int deleteByExample(SpendExample example);

    int deleteByPrimaryKey(Integer spendid);

    int insert(Spend record);

    int insertSelective(Spend record);

    List<Spend> selectByExample(SpendExample example);
    
    List<Spend> selectByUsername(String username);
    
    List<Res> countBySpecies(String username);
    
    List<Res> sumMoneyBySpecies(String username);
    
    List<Res> sumMoneyByYear(String username);
    
    List<Res> sumMoneyByMonth(HashMap<String,String> map);
    
    List<Res> sumMoneyBySpeciesWithYear(HashMap<String,String> map);
    
    List<Res> sumMoneyBySpeciesWithMonth(HashMap<String,String> map);
    
    List<String> numOfYear(String username);

    Spend selectByPrimaryKey(Integer spendid);

    int updateByExampleSelective(@Param("record") Spend record, @Param("example") SpendExample example);

    int updateByExample(@Param("record") Spend record, @Param("example") SpendExample example);

    int updateByPrimaryKeySelective(Spend record);

    int updateByPrimaryKey(Spend record);
}