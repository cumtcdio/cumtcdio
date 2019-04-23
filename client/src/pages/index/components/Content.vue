<template>
    <div class="index">
            <div class="row  bg1">
                <div class="col-12 col-md-4 col-sm col0">
                    <div class="category">{{category1}}</div>
                    <div class="more text-right" >
                        <a target="_blank" href="list.html?title=通知">更多&gt;&gt;&nbsp;</a>
                    </div>
                    <div class="summaryBorder" v-for="item in content0" :key="item.id">
                        <div class="title"><a class="aDetail" target="_blank" :href="item.htmlAddress" >{{item.title}}</a></div>
                        <div class="summary">{{item.summary}}</div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-sm col0">
                    <div class="category">{{category2}}</div>
                    <div class="more text-right" >
                        <a target="_blank" href="list.html?title=新闻">更多&gt;&gt;&nbsp;</a>
                    </div>
                    <div class="summaryBorder" v-for="item in content1" :key="item.id">
                        <div class="title"><a class="aDetail" target="_blank" :href="item.htmlAddress" >{{item.title}}</a></div>
                        <div class="summary">{{item.summary}}</div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-sm col0">
                    <div class="category">{{category3}}</div>
                    <div class="more text-right" >
                        <a target="_blank" href="cdio.html">更多&gt;&gt;&nbsp;</a>
                    </div>
                    <div class="summaryBorder" v-for="item in contentCDIO" :key="item.id">
                        <div class="title"><a class="aDetail" target="_blank" :href="item.htmlAddress" >{{item.title}}</a></div>
                        <div class="summary">{{item.summary}}</div>
                    </div>
                    <div class="summaryBorder" v-for="item in content3" :key="item.id + '1'">
                        <div class="title">{{item.title}}</div>
                        <!--<div class="summary">{{item.summary}}</div>-->
                    </div>
                </div>
            </div>
            <div class="row bg2">
                <div class="col-12 col-md-4 col-sm col0">
                    <div class="category">{{category4}}</div>
                    <div class="more text-right" >
                        <a target="_blank" href="list.html?title=师生风采">更多&gt;&gt;&nbsp;</a>
                    </div>
                    <div class="summaryBorder" v-for="item in content2" :key="item.id">
                        <div class="title"><a class="aDetail" target="_blank" :href="item.htmlAddress" >{{item.title}}</a></div>
                        <div class="summary">{{item.summary}}</div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-sm col0">
                    <div class="category">{{category5}}</div>
                    <div class="more text-right" >
                        <a target="_blank" href="list.html?title=专业信息">更多&gt;&gt;&nbsp;</a>
                    </div>
                    <div class="summaryBorder" v-for="item in content3" :key="item.id">
                        <div class="title"><a class="aDetail" target="_blank" :href="item.htmlAddress" >{{item.title}}</a></div>
                        <div class="summary">{{item.summary}}</div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-sm col0">
                    <div class="category">{{category6}}</div>
                    <div class="more text-right" >
                        <a target="_blank" href="list.html?title=专业实习">更多&gt;&gt;&nbsp;</a>
                    </div>
                    <div class="summaryBorder" v-for="item in content4" :key="item.id">
                        <div class="title"><a class="aDetail" target="_blank" :href="item.htmlAddress" >{{item.title}}</a></div>
                        <div class="summary">{{item.summary}}</div>
                    </div>
                </div>
            </div>
    </div>
</template>

<script>
    import axios from 'axios'
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
                content0: {},
                content1: {},
                content2: {},
                content3: {},
                content4: {},
                contentCDIO: [{
                    "id": "1",
                    "title": "EC-CDIO电子商务人才培养模式",
                    "htmlAddress":"https://www.baidu.com/",
                    "summary": "2019年3月20日，电商党支部召开组织生活会，大家集体观看了《孤岛32年》宣传片，受王继才夫妇驻守孤岛32年的精神所感动，大家纷纷表示要立足教师岗位，一辈子扮演好教师这样一个角色。这也是前期谈心谈话环节中，众多老师表达的意愿。同时，老师们更希望支部组织能够凝聚和汇集大家的力量，做大事，做成事。"
                },
                    {
                        "id": "2",
                        "title": "2017级",
                        "htmlAddress":"https://www.baidu.com/",
                    },
                    {
                        "id": "3",
                        "title": "2016级",
                        "htmlAddress":"https://www.baidu.com/",
                       }
                ]
            }
        },
        mounted (){
            this.showData()
        },
        methods:{
            showData: function () {
                axios.get('/api/show/getShowList2Lazied/0').then(response => {
                    this.getDataSucc0(response)
                });
                axios.get('/api/show/getShowList2Lazied/1').then(response => {
                    this.getDataSucc1(response)
                });
                axios.get('/api/show/getShowList2Lazied/2').then(response => {
                    this.getDataSucc2(response)
                });
                axios.get('/api/show/getShowList2Lazied/3').then(response => {
                    this.getDataSucc3(response)
                });
                axios.get('/api/show/getShowList2Lazied/4').then(response => {
                    this.getDataSucc4(response)
                })
            },
            getDataSucc0: function (res) {
                var data = res.data
                if (data.code === 0 && data.data) {
                    this.content0 = data.data
                }
            },
            getDataSucc1: function (res) {
                var data = res.data
                if (data.code === 0 && data.data) {
                    this.content1 = data.data
                }
            },
            getDataSucc2: function (res) {
                var data = res.data
                if (data.code === 0 && data.data) {
                    this.content2 = data.data
                }
            },
            getDataSucc3: function (res) {
                var data = res.data
                if (data.code === 0 && data.data) {
                    this.content3 = data.data
                }
            },
            getDataSucc4: function (res) {
                var data = res.data
                if (data.code === 0 && data.data) {
                    this.content4 = data.data
                }
            }
        },
        created(){}
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
.summaryBorder{
    padding: 0.5rem;
}
.title{
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    padding: 0;
    font-size: 0.9rem;
    line-height: 1.7rem;
}
.summary{
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
a:link    {color:#E67F11;text-decoration:none;}
a:visited {color:#E67F11;}
a:hover   {color:#E67F11;}
.aDetail  {color:black;}
.aDetail:active  {color:black;}
.aDetail:link    {color:black;text-decoration:none;}
.aDetail:visited {color:black;}
.aDetail:hover   {color:#002956;}
</style>
