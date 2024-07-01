package com.project.shop.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SessionDao {
    @Autowired
    JdbcTemplate jt;
    public int usercheck(String userId, String userPassword){
        String sqlstmt="select count(*) from tb_user_mst where user_id =? and user_password=?";
        return jt.queryForObject(sqlstmt,int.class,userId,userPassword);
    }
    public Map<String,Object> getUserInfo(String userId,String userPassword){
        String sqlstmt="select user_name as userName, user_grade as userGrade from tb_user_mst where user_id=? and user_password=?";
        return  jt.queryForMap(sqlstmt,userId,userPassword);
    }
}
