package com.example.banka;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Description TODO
 * @Author shen
 * @Date 2019/2/26 17:51
 **/
@RestController
public class Controller {

    @Autowired
    Service service;

    @GetMapping("/start")
    @ResponseBody
    public String start(@RequestParam("money") int money){
        return service.start(money);
    }
}
