package com.project.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

import java.util.*;
import com.project.shop.dao.*;
@Controller
public class ProductController {
    @Autowired
    ProductDao productDao;
    @GetMapping("/product")
    public String productList(Model model,HttpSession session){
        if(session.getAttribute("userId")==null){
            return "redirect:/login";
        }
        if(!session.getAttribute("userGrade").equals("1")){
            return "redirect:/login/failuer";
        }
        String userId=session.getAttribute("userId").toString();
        List<Map<String,Object>> productSet= productDao.selectProductList(userId);
        model.addAttribute("productSet", productSet);
        model.addAttribute("userId", session.getAttribute("userId"));

        return "product/index";
    }
}
