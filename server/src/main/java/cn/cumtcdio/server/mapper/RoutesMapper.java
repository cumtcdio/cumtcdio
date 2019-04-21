package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.Routes;
import cn.cumtcdio.server.util.MyMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface RoutesMapper extends MyMapper<Routes> {

    List<Routes> getRoutesByRoleId(Integer rId);

    List<Routes> getChildByParentId(@Param(value = "id") Integer id,
                                    @Param(value = "rId") Integer rId);
}