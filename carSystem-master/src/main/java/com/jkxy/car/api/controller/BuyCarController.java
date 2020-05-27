package com.jkxy.car.api.controller;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.jkxy.car.api.pojo.Car;
import com.jkxy.car.api.service.CarService;
import com.jkxy.car.api.utils.JSONResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("buyCar")
public class BuyCarController {

    @Autowired
    private CarService carService;

    /**
     * 车辆购买
     *
     * @param id
     * @return
     */
    @GetMapping("buyCar/{id}/{quantity}")
    public JSONResult buyCar(@PathVariable int id,@PathVariable int quantity) {
            String result = carService.buyCar(id, quantity);
            return JSONResult.ok(result);
    }
}
