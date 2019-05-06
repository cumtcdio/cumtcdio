import {getRequest} from './request'

export const initMenu = (router, store)=> {
    if (store.state.routes.length > 0) {
        return;
    }
    /*
     后台取数据
      */
    var roleId = store.state.user.roles[0].id
    getRequest("/api/menu/getMenuByRoleId/" + roleId ).then(resp=> {
        if (resp) {
            var fmtRoutes = formatRoutes(resp);
            router.addRoutes(fmtRoutes);
            store.commit('initMenu', fmtRoutes);
        }
    })
}
export const formatRoutes = (routes)=> {
    let fmRoutes = [];
    routes.forEach(router=> {
        let {
            children,
            component,
            meta,
            path,
        } = router;
        if (children && children instanceof Array) {
            children = formatRoutes(children);
        }

        let fmRouter = {
            path: path,
            component(resolve){
                if (component.startsWith("Home")) {
                    require(['../components/' + component + '.vue'], resolve)
                } else if (component.startsWith("CumtCDIO")) {
                    require(['../components/cumt/group/' + component + '.vue'], resolve)
                } else if (component.startsWith("groupInfo")) {
                    require(['../components/cumt/group/views/' + component + '.vue'], resolve)
                } else if (component.startsWith("groupInsert")) {
                    require(['../components/cumt/group/views/' + component + '.vue'], resolve)
                } else if (component.startsWith("processManage")) {
                    require(['../components/cumt/group/views/' + component + '.vue'], resolve)
                } else if (component.startsWith("admin")) {
                    require(['../components/cumt/admin/' + component + '.vue'], resolve)
                } else if (component.startsWith("Edit")) {
                    require(['../components/show/components/' + component + '.vue'], resolve)
                } else if (component.startsWith("Show")) {
                    require(['../components/show/' + component + '.vue'], resolve)
                } else if (component.startsWith("Slide")) {
                    require(['../components/slide/' + component + '.vue'], resolve)
                }else if (component.startsWith("CourseManage")) {
                    require(['../components/course/course.vue'], resolve)
                }else if (component.startsWith("admin")) {
                    require(['../components/cumt/admin/admin.vue'], resolve)
                }else if (component.startsWith("StudentInfo")) {
                    require(['../components/info/student/studentInfo.vue'], resolve)
                }else if (component.startsWith("TeacherInfo")) {
                    require(['../components/info/teacher/teacherInfo.vue'], resolve)
                }
            },
            meta: meta,
            children: children
        };
        fmRoutes.push(fmRouter);
    })
    return fmRoutes;
}