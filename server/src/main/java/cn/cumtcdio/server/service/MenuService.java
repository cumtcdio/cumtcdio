package cn.cumtcdio.server.service;

import cn.cumtcdio.server.mapper.MenuMapper;
import cn.cumtcdio.server.mapper.RoutesMapper;
import cn.cumtcdio.server.model.Menu;
import cn.cumtcdio.server.model.MenuMeta;
import cn.cumtcdio.server.model.Routes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author SpringBoot Jun
 * @date 2019/4/19 11:15
 */
@Service
public class MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private RoutesMapper routesMapper;

    public List<Menu> getMenuByRoleId(Integer rId){
        List<Menu> menuList1 = menuMapper.getMenuByRoleId(rId);
        for (Menu menu : menuList1) {
            MenuMeta menuMeta1 = new MenuMeta();
            menuMeta1.setKeepAlive(menu.isKeepAlive());
            menuMeta1.setRequireAuth(menu.isRequireAuth());
            menu.setMeta(menuMeta1);
            List<Menu> menuList2 = menuMapper.getChildByParentId(menu.getId(),rId);
            menu.setChildren(menuList2);
            for (Menu menu1 :menuList2) {
                MenuMeta menuMeta2 = new MenuMeta();
                menuMeta2.setKeepAlive(menu.isKeepAlive());
                menuMeta2.setRequireAuth(menu.isRequireAuth());
                menu1.setMeta(menuMeta2);
            }
        }
        return menuList1;
    }

    public List<Routes> getRoutesByRoleId(Integer id) {
        List<Routes> routesList1 = routesMapper.getRoutesByRoleId(id);
        for (Routes routes : routesList1) {
            routes.setChild(routesMapper.getChildByParentId(routes.getId(),id));
        }
        return routesList1;
    }
}
