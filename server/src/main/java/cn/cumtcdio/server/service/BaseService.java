package cn.cumtcdio.server.service;

import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.common.Mapper;

/**
 * @author SpringBoot Jun
 * @date 2018/12/19 22:05
 * @描述 父类服务
 */
public class BaseService<Mapp extends Mapper< M >, M> {
    @Autowired
    public Mapp mapper;
}
