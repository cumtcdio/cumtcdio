<template>
    <div class="index">
            <div class="row  bg1">
                <div class="col-12 col-md-4 col-sm col0">
                    <div class="category">{{category1}}</div>
                    <div class="more text-right" >
                        <a target="_blank" href="list.html">更多&gt;&gt;&nbsp;</a>
                    </div>
                    <div class="synopsisBorder" v-for="item in content" :key="item.id">
                        <div class="synopsisTitle">{{item.synopsisTitle}}</div>
                        <div class="synopsis">{{item.synopsis}}</div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-sm col0">
                    <div class="category">{{category2}}</div>
                    <div class="more text-right" >
                        <a target="" href="">更多&gt;&gt;&nbsp;</a>
                    </div>
                    <div class="synopsisBorder" v-for="item in content" :key="item.id">
                        <div class="synopsisTitle">{{item.synopsisTitle}}</div>
                        <div class="synopsis">{{item.synopsis}}</div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-sm col0">
                    <div class="category">{{category3}}</div>
                    <div class="more text-right" >
                        <a target="_blank" href="cdio.html">更多&gt;&gt;&nbsp;</a>
                    </div>
                    <div class="synopsisBorder" v-for="item in contentCDIO" :key="item.id">
                        <div class="synopsisTitle">{{item.synopsisTitle}}</div>
                        <div class="synopsis">{{item.synopsis}}</div>
                    </div>
                    <div class="synopsisBorder" v-for="item in content3" :key="item.id + '1'">
                        <div class="synopsisTitle">{{item.synopsisTitle}}</div>
                        <!--<div class="synopsis">{{item.synopsis}}</div>-->
                    </div>
                </div>
            </div>
            <div class="row bg2">
                <div class="col-12 col-md-4 col-sm col0">
                    <div class="category">{{category4}}</div>
                    <div class="more text-right" >
                        <a target="" href="">更多&gt;&gt;&nbsp;</a>
                    </div>
                    <div class="synopsisBorder" v-for="item in content" :key="item.id">
                        <div class="synopsisTitle">{{item.synopsisTitle}}</div>
                        <div class="synopsis">{{item.synopsis}}</div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-sm col0">
                    <div class="category">{{category5}}</div>
                    <div class="more text-right" >
                        <a target="" href="">更多&gt;&gt;&nbsp;</a>
                    </div>
                    <div class="synopsisBorder" v-for="item in content" :key="item.id">
                        <div class="synopsisTitle">{{item.synopsisTitle}}</div>
                        <div class="synopsis">{{item.synopsis}}</div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-sm col0">
                    <div class="category">{{category6}}</div>
                    <div class="more text-right" >
                        <a target="" href="">更多&gt;&gt;&nbsp;</a>
                    </div>
                    <div class="synopsisBorder" v-for="item in content" :key="item.id">
                        <div class="synopsisTitle">{{item.synopsisTitle}}</div>
                        <div class="synopsis">{{item.synopsis}}</div>
                    </div>
                </div>
            </div>
    </div>
</template>

<script>
    export default {
        name: "Content",
        data () {
            return {
                category1: "通知",
                category2: "新闻",
                category3: "EC-CDIO项目教学",
                category4: "师生风采",
                category5: "专业信息",
                category6: "专业实习",
                content: [{
                    "id": "1",
                    "synopsisTitle": "聚焦电商EC-CDIO培养模式 夯实党建工作抓手 ——记电商党支部组织生活会",
                    "synopsis": "2019年3月20日，电商党支部召开组织生活会，大家集体观看了《孤岛32年》宣传片，受王继才夫妇驻守孤岛32年的精神所感动，大家纷纷表示要立足教师岗位，一辈子扮演好教师这样一个角色。这也是前期谈心谈话环节中，众多老师表达的意愿。同时，老师们更希望支部组织能够凝聚和汇集大家的力量，做大事，做成事。"
                    },
                    {
                        "id": "2",
                        "synopsisTitle": "2018年暑期电子商务专业认识实习活动纪实",
                        "synopsis": "为对电子商务专业有一个初步全面的认知了解， 2018年暑假期间管理学院电商与数据科学系组织2017级全体电商系的学生踏上长达十天的电子商务认识实习旅程。电商与数据科学系的王辉老师、王贺朝老师、冯文龙老师与胡霞老师四位老师更是随队前行，全程作陪，为同学们的生活与学习提供大力支持。"
                    }
                ],
                content3: [{
                    "id": "1",
                    "synopsisTitle": "2017级",
                    "synopsis": "2019年3月20日，电商党支部召开组织生活会，大家集体观看了《孤岛32年》宣传片，受王继才夫妇驻守孤岛32年的精神所感动，大家纷纷表示要立足教师岗位，一辈子扮演好教师这样一个角色。这也是前期谈心谈话环节中，众多老师表达的意愿。同时，老师们更希望支部组织能够凝聚和汇集大家的力量，做大事，做成事。"
                },
                    {
                        "id": "2",
                        "synopsisTitle": "2016级",
                        "synopsis": "为对电子商务专业有一个初步全面的认知了解， 2018年暑假期间管理学院电商与数据科学系组织2017级全体电商系的学生踏上长达十天的电子商务认识实习旅程。电商与数据科学系的王辉老师、王贺朝老师、冯文龙老师与胡霞老师四位老师更是随队前行，全程作陪，为同学们的生活与学习提供大力支持。"
                    }
                ],
                contentCDIO: [{
                    "id": "1",
                    "synopsisTitle": "EC-CDIO电子商务人才培养模式",
                    "synopsis": "2019年3月20日，电商党支部召开组织生活会，大家集体观看了《孤岛32年》宣传片，受王继才夫妇驻守孤岛32年的精神所感动，大家纷纷表示要立足教师岗位，一辈子扮演好教师这样一个角色。这也是前期谈心谈话环节中，众多老师表达的意愿。同时，老师们更希望支部组织能够凝聚和汇集大家的力量，做大事，做成事。"
                }
                ]
            }
        }
    }
</script>

<style scoped>
*{
   padding: 0;
   margin: 0;
   width: 100%;
}
.more{
    margin-top: -2.2rem;
    padding: 0;
}
.bg1{
    background-color: white;
}
.bg2{
    background-color: #F1F1F1;
}
.category{
    padding: 0.4rem;
    font-size: 1.2rem;
    font-weight: bold;
}
.row{
    margin:0
}
.synopsisBorder{
    padding: 0.5rem;
}
.synopsisTitle{
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    padding: 0;
    font-size: 0.9rem;
    line-height: 1.7rem;
}
.synopsis{
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    color: #737272;
    font-size: 0.7rem;
    line-height: 1.4rem;
}
.col0{
    padding:1.2rem
}
/*.index {*/
    /*margin-bottom: 67px;*/
/*}*/
a {color:#E67F11;}
a:active  {color:#C8700F;}
a:link    {color:#E67F11;}
a:visited {color:#E67F11;}
a:hover   {color:#E67F11;}
</style>
