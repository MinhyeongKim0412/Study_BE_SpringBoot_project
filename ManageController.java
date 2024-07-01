package com.project.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;
import com.project.shop.dao.ManageDao;

import jakarta.servlet.http.HttpSession;


@Controller
public class ManageController {
    @Autowired
    ManageDao manageDao;
    @GetMapping("manage")
    public String manage(HttpSession session){
        if(session.getAttribute("userId")==null){
            return "redirect:/login";
        }
        if(!session.getAttribute("userGrade").equals("14")){
            return "redirect:/";
        }
        return "manage/index";
    }
    @GetMapping("manage/code")
    public String manageCode(Model model,HttpSession session){
        if(session.getAttribute("userId")==null){
            return "redirect:/login";
        }
        if(!session.getAttribute("userGrade").equals("14")){
            return "redirect:/";
        }
        List<Map<String,Object>> codeSet = manageDao.selectCode();
        List<Map<String,Object>> codeDetailSet = manageDao.selectCodeDetail();

        model.addAttribute("codeSet", codeSet);
        model.addAttribute("codeDetailSet", codeDetailSet);
        return "manage/code";
    }
    @GetMapping("manage/code/insert")
    public String manageCodeInsert(){
        return "manage/code_insert";
    }
    @GetMapping("manage/code/insert/action")
    public String manageCodeInsertAction(@RequestParam String codeName){
        manageDao.insertCode(codeName);
        return "redirect:/manage/code";
    }
    @GetMapping("manage/code/detail/insert")
    public String manageCodeDetailInsert(@RequestParam String category,Model model){
        model.addAttribute("category",category);
        return "manage/code_detail_insert";
    }
    @GetMapping("/manage/code/detail/insert/action")
    public String manageCodeDetailInsertAction(@RequestParam String category, 
                                               @RequestParam String state,
                                               @RequestParam String codeName,
                                               @RequestParam String codeDesc){
        manageDao.insertCodeDetail(category, state, codeName, codeDesc);
        return "redirect:/manage/code";
    }
    @GetMapping("manage/code/detail/state/change")
    public String mangeCodeDetailStateChange(@RequestParam String seq, @RequestParam String state){
        manageDao.updateCodeDetailState(seq,state);
        return "redirect:/manage/code";
    }

    @GetMapping("manage/user")
    public String manageUser(Model model){
        List<Map<String,Object>> userSet = manageDao.selectUserList();
        model.addAttribute("userSet", userSet);
        return "manage/user";
    }

}
