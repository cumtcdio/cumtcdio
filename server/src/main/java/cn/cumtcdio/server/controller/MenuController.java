package cn.cumtcdio.server.controller;

import cn.cumtcdio.server.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * @author SpringBoot Jun
 * @date 2019/4/19 11:16
 */
@RestController
@RequestMapping(value = "/api/menu")
@CrossOrigin
public class MenuController {
    @Autowired
    private MenuService menuService;

    @GetMapping(value = "/getMenuByRoleId/{rId}")
    public ResponseEntity getMenuByRoleId(@PathVariable Integer rId){
        return ResponseEntity.ok(menuService.getMenuByRoleId(rId));
    }

    @GetMapping(value = "/getRoutesByRoleId/{rId}")
    public ResponseEntity getRoutesByRoleId(@PathVariable Integer rId){
        return ResponseEntity.ok(menuService.getRoutesByRoleId(rId));
    }
}
