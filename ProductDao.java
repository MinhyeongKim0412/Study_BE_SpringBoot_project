package com.project.shop.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class ProductDao {
    @Autowired
    JdbcTemplate jt;
    public List<Map<String, Object>> selectProductCategory(){
        String sqlStmt = "select seq, ";
               sqlStmt += "code_name as codeName ";
               sqlStmt += "from tb_code_detail ";
               sqlStmt += "where code_code = 2 and state=1";
        return jt.queryForList(sqlStmt);

    }
    public List<Map<String,Object>> selectProductList(String userId){
        String sqlstmt="";
                sqlstmt+="select a.seq,a.product_id as productId,a.product_category as productCategory, ";
                sqlstmt+="b.code_name as codeName,a.product_name as productName, ";
                sqlstmt+="a.product_image as productImage,a.product_keyword as productKeyword,a.reg_dt as regDt ";
                sqlstmt+="from tb_product_mst a, tb_code_detail b ";
                sqlstmt+="where seller_id = ? and a.product_category = b.seq and b.code_code =2";
        return jt.queryForList(sqlstmt,userId);

    }
}
