package cn.cumtcdio.server.mapper;


import cn.cumtcdio.server.model.Menu;
import cn.cumtcdio.server.util.MyMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper extends MyMapper<Menu> {
    List<Menu> getMenuByRoleId(Integer rId);

    List<Menu> getChildByParentId(@Param(value = "id") Integer id,
                                  @Param(value = "rId") Integer rId);

}