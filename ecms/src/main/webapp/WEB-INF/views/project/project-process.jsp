<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html >

<html>
<head id="Head1">
    <meta charset="utf-8">
    <title>项目进度</title>
    <link rel="stylesheet" type="text/css" href="../Scripts/EasyUI/jquery-easyui-1.5.1/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/EasyUI/jquery-easyui-1.5.1/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../css/jquery.bxslider.css" />
    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.8.3/jquery.bxslider.min.js"></script>
    <script src="../Scripts/HighCharts/radialIndicator.js"></script>
    <script src="../Scripts/HighCharts/progressBar.js"></script>

    <style type="text/css">
        body {
            background-color: #ededed;
        }

        .content {
            text-align: center;
            margin: 20px;
        }

        .contentOne {
            margin: 0 auto;
            width: 98%;
            padding-bottom: 20px;
        }

        .contentOne td {
            background-color: white;
        }

        table.gridtable {
            margin: 0 auto;
            color: #333333;
            border-width: 1px;
            border-color: #919191;
            border-collapse: collapse;
            width: 95%;
            margin-top: 10px;
            margin-bottom: 15px;
        }

        table.gridtable th {
            border-width: 1px;
            border-style: solid;
            border: 1px solid #919191;
        }

        table.gridtable td {
            border-width: 1px;
            padding: 3px;
            border-style: solid;
            font-size: 14px;
            border: 1px solid #919191;
        }

        .sketch {
            padding: 15px;
            vertical-align: top;
        }

        .detail {
            text-align: left;
            margin: 7px;
            font-size: 14px;
        }

        .clear {
            clear: both;
        }

        .contentTwo {
            margin-top: 20px;
            padding-top: 12px;
            background-color: white;
            height: 230px;
            width: 98%;
            margin: 0 auto;
            text-align: center;
        }

        .imgTitle {
            font-weight: bolder;
            text-align: left;
            padding-left: 10px;
        }



        .slider2 {
            height: 300px;
        }
        /*.bx-wrapper{

        height:200px !important;
    }
    .bx-viewport{
        height:230px !important;
    }*/
        .slider2 li {
            list-style: none;
            float: left;
            margin-right: 30px;
        }

        .img {
            width: 180px;
            height: 123px;
        }

        .a {
            /*background-color: #49DC19;
            color: white;*/
            border: 1px solid #0aa2e4;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            height: 22px;
            padding-top: 3px;
            width: 100px;
            margin: 0 auto;
            font-size: 13px;
            line-height: 20px;
            margin-top: 5px;
            text-align: center;
        }

        .liDiv {
            float: left;
            padding-left: 3%;
            /*text-align: -webkit-right;*/
            width: 21%;
        }

        .liDiv1 {
            float: left;
            padding-left: 5%;
            /*text-align: -webkit-right;*/
            width: 20%;
        }

        .ProgressDiv {
            float: left;
            padding-left: 1%;
            /*text-align: -webkit-right;*/
            width: 17%;
        }

        .ProgressDiv1 {
            float: left;
            padding-left: 6%;
            /*text-align: -webkit-right;*/
            width: 17%;
        }

        .LiSty {
            width: 900px;
        }

        .tbtitle {
            color: white;
            background-color: #0aa2e4;
            text-align: center;
            border-radius: 5px 5px 0px 0px;
            font-size: 12px;
            height: 22px;
            font-weight: bold;
            padding-top: 6px;
        }

        .tbtime {
            background-color: #e7e7e7;
            font-size: 12px;
            text-align: left;
            padding: 5px;
        }

        .Finish {
            background-color: #e7e7e7;
            font-size: 12px;
            border-radius: 0px 0px 4px 4px;
            padding: 7px 0px;
            text-align: center;
            font-weight: bold;
            color: #51ae26;
            height: 18px;
        }

        .UnFinish {
            background-color: #e7e7e7;
            font-size: 12px;
            border-radius: 0px 0px 4px 4px;
            padding: 7px 0px;
            text-align: center;
            font-weight: bold;
            height: 18px;
        }

        .tbtime1 {
            background-color: #e7e7e7;
            color: #0aa2e4;
            padding: 5px;
            text-align: left;
        }

        .progressleft {
            float: left;
            width: 40%;
            vertical-align: central;
        }

        .progressright {
            text-align: center;
        }

        .TbProgress {
            background-color: #e7e7e7;
            border-radius: 5px;
            border-spacing: 0;
        }

    </style>
    <script type="text/javascript">

        //项目对象
        var ProjectJson = {"ProjectID":"1000000005","Abbreviation":"研发楼一期","Code":"1","Name":"研发楼一期","Constructor":"福州市大数据产业基地开发有限责任公司","Location":"福州长乐","Scale":"一期规模概况","PlanStart":"2017-10-12","PlanComplete":"2017-10-31","Consist":"研发测试","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-12 11:05:56Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-31 10:39:43Z","Remark":"标识","DelTag":"1","CompleRate":"12","CoversArea":"30","BuildArea":"40","AboveArea":"50","UnderArea":"60","TotalFloor":"70","ConstructorPerson":"林亭","ConstructorTel":"13489010555","Supervision":"福建升恒建设集团有限公司","SupervisionPerson":"陈慧华","SupervisionTel":"15985798699","Contract":"中建海峡建设有限公司","ContractPerson":"蔡海云","ContractTel":"18250345890","Design":"福州市规划设计研究院","DesignPerson":"费玉麟","DesignTel":"15789098765","TotalDay":null,"PlanStartNew":null,"PlanCompleteNew":null,"limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""};
        var lsStageData = [{"ProjectProgressID":"1000000110","ProjectCode":"1","StageProjectID":"1000000115","ChildStructure":"","PlanStart":"2017-07-01","PlanComplete":"2017-10-30","ActualStart":"2017-07-01","ActualComplete":"","Completion":"施工中","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-20 08:51:43Z","ModifierID":"","ModifierOfOrgID":"","ModifierName":"","ModifyDate":"","Remark":"","DelTag":"1","CompleRate":"95","ProjectName":"","StageProjectName":"地下室施工阶段","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"ProjectProgressID":"1000000104","ProjectCode":"1","StageProjectID":"1000000113","ChildStructure":"","PlanStart":"2017-02-20","PlanComplete":"2017-03-30","ActualStart":"2017-02-16","ActualComplete":"2017-03-28","Completion":"提前2天完成","InputterID":"0000000017","InputterOfOrgID":"0000000007","InputterName":"lh","InputDate":"2017-10-18 22:21:09Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-20 08:57:38Z","Remark":"","DelTag":"1","CompleRate":"100","ProjectName":"","StageProjectName":"勘察施工阶段","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"ProjectProgressID":"1000000109","ProjectCode":"1","StageProjectID":"1000000114","ChildStructure":"","PlanStart":"2017-04-10","PlanComplete":"2017-07-10","ActualStart":"2017-04-10","ActualComplete":"2017-07-10","Completion":"按时完成","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-20 08:50:57Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-20 08:57:29Z","Remark":"","DelTag":"1","CompleRate":"100","ProjectName":"","StageProjectName":"基础施工阶段","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"ProjectProgressID":"1000000111","ProjectCode":"1","StageProjectID":"1000000116","ChildStructure":"1#，2#","PlanStart":"2017-11-10","PlanComplete":"2018-02-20","ActualStart":"","ActualComplete":"","Completion":"未开始","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-20 08:52:33Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-24 08:47:48Z","Remark":"","DelTag":"1","CompleRate":"0","ProjectName":"","StageProjectName":"上部结构施工阶段","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"ProjectProgressID":"1000000112","ProjectCode":"1","StageProjectID":"1000000117","ChildStructure":"","PlanStart":"2018-02-01","PlanComplete":"2018-05-01","ActualStart":"","ActualComplete":"","Completion":"未开始","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-20 08:55:32Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-20 08:58:01Z","Remark":"","DelTag":"1","CompleRate":"0","ProjectName":"","StageProjectName":"装饰装修阶段","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"ProjectProgressID":"1000000113","ProjectCode":"1","StageProjectID":"1000000201","ChildStructure":"","PlanStart":"2018-03-20","PlanComplete":"2018-06-01","ActualStart":"","ActualComplete":"","Completion":"未开始","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-20 08:55:55Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-11-06 11:12:08Z","Remark":"","DelTag":"1","CompleRate":"0","ProjectName":"","StageProjectName":"室外工程阶段","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""}];
        $(document).ready(function () {
            $('#slider1').bxSlider();
            $('#slider2').bxSlider();

            $("#slider2").closest(".bx-wrapper").height(180);
            $("#slider2").closest(".bx-viewport").height(200);
            var a=document.getElementById("bx-viewport");
            a.style.height="250px";
            //项目概况
            $("#Scale").html(ProjectJson.Scale);
            $("#ProjectName").html(ProjectJson.Name);

            //项目完成率
            $("#circle1").radialIndicator({
                barBgColor:'lightgray',
                barColor:{
                    0:"#77e3f6",
                    33:'#2f9de0',
                    66:'#86e23e',
                    100:'#328f17'

                },
                radius:45,
                initValue:ProjectJson.CompleRate,
                percentage: true
            });
        });
        function StageDetail(StageId,titleName){
            top.Close = function () {
                top.window.$("#divWin").window('close');
            }
            var strHref = '<iframe id="fmProjectInfoAdd" name="fmProjectInfoAdd" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/Function/Schedule/StageDetail?StageID='+StageId+'&frmName="></iframe>';

            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                closable: true,
                resizable: false,
                width: 680,
                height: 500,
                modal: true,
                title: titleName
            });
            top.window.$("#divWin").window('center');
        }

    </script>
</head>
<body>
<div class="content">
    <table class="contentOne">
        <tr>
            <td style="width: 23%">
                <table>
                    <tr>
                        <td class="imgTitle" style="height: 45px">项目完成率</td>
                        <td rowspan="2" style="padding-left: 25px">
                            <p class="circleChart" id="circle1"></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top; font-size: 14px">
                            <label id="ProjectName"></label>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="midline" style="background-color: #ededed; width: 1%;"></td>
            <td class="sketch">
                <div class="imgTitle">项目进度概述</div>

                <div class="detail">
                    <label id="Scale"></label>
                </div>
            </td>
        </tr>
    </table>
    <div class="contentTwo" style="height: 300px">
        <div class="imgTitle">
            项目进度统计
        </div>
        <ul class="slider1" id="slider1">

            <li class="LiSty">
                <div class="ProgressDiv1">


                    <div class="tbtitle">地下室施工阶段 </div>
                    <div class="tbtime">
                        计划开竣工时间
                    </div>
                    <div class="tbtime1">
                        2017-07-01~2017-10-30
                    </div>
                    <div style="background-color: #e7e7e7">
                        <div style="border-bottom: 1px solid #c1c1c1; margin: 0px 5px">
                        </div>
                    </div>
                    <div class="tbtime">实际开竣工时间</div>
                    <div class="tbtime1">
                        2017-07-01~
                    </div>
                    <div style="background-color: #e7e7e7">
                        <div style="border-bottom: 1px solid #c1c1c1; margin: 0px 5px">
                        </div>
                    </div>
                    <div class="tbtime" style="text-align: center; height: 18px">

                    </div>
                    <div class="tbtime" style="padding: 1px; text-align: center">
                        <div class="ratediv">
                            <div class="progressright">
                                <div class="divbar" id="1000000115">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="UnFinish">施工中</div>

                </div>

                <div class="ProgressDiv">


                    <div class="tbtitle">勘察施工阶段 </div>
                    <div class="tbtime">
                        计划开竣工时间
                    </div>
                    <div class="tbtime1">
                        2017-02-20~2017-03-30
                    </div>
                    <div style="background-color: #e7e7e7">
                        <div style="border-bottom: 1px solid #c1c1c1; margin: 0px 5px">
                        </div>
                    </div>
                    <div class="tbtime">实际开竣工时间</div>
                    <div class="tbtime1">
                        2017-02-16~2017-03-28
                    </div>
                    <div style="background-color: #e7e7e7">
                        <div style="border-bottom: 1px solid #c1c1c1; margin: 0px 5px">
                        </div>
                    </div>
                    <div class="tbtime" style="text-align: center; height: 18px">

                    </div>
                    <div class="tbtime" style="padding: 1px; text-align: center">
                        <div class="ratediv">
                            <div class="progressright">
                                <div class="divbar" id="1000000113">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="Finish">提前2天完成</div>

                </div>

                <div class="ProgressDiv">


                    <div class="tbtitle">基础施工阶段 </div>
                    <div class="tbtime">
                        计划开竣工时间
                    </div>
                    <div class="tbtime1">
                        2017-04-10~2017-07-10
                    </div>
                    <div style="background-color: #e7e7e7">
                        <div style="border-bottom: 1px solid #c1c1c1; margin: 0px 5px">
                        </div>
                    </div>
                    <div class="tbtime">实际开竣工时间</div>
                    <div class="tbtime1">
                        2017-04-10~2017-07-10
                    </div>
                    <div style="background-color: #e7e7e7">
                        <div style="border-bottom: 1px solid #c1c1c1; margin: 0px 5px">
                        </div>
                    </div>
                    <div class="tbtime" style="text-align: center; height: 18px">

                    </div>
                    <div class="tbtime" style="padding: 1px; text-align: center">
                        <div class="ratediv">
                            <div class="progressright">
                                <div class="divbar" id="1000000114">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="Finish">按时完成</div>

                </div>

                <div class="ProgressDiv">


                    <div class="tbtitle">上部结构施工阶段 </div>
                    <div class="tbtime">
                        计划开竣工时间
                    </div>
                    <div class="tbtime1">
                        2017-11-10~2018-02-20
                    </div>
                    <div style="background-color: #e7e7e7">
                        <div style="border-bottom: 1px solid #c1c1c1; margin: 0px 5px">
                        </div>
                    </div>
                    <div class="tbtime">实际开竣工时间</div>
                    <div class="tbtime1">
                        ~
                    </div>
                    <div style="background-color: #e7e7e7">
                        <div style="border-bottom: 1px solid #c1c1c1; margin: 0px 5px">
                        </div>
                    </div>
                    <div class="tbtime" style="text-align: center; height: 18px">

                        <a style="cursor: pointer;" onclick="StageDetail('1000000116','上部结构施工阶段')">查看详情>></a>

                    </div>
                    <div class="tbtime" style="padding: 1px; text-align: center">
                        <div class="ratediv">
                            <div class="progressright">
                                <div class="divbar" id="1000000116">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="UnFinish">未开始</div>

                </div>

                <div class="ProgressDiv">


                    <div class="tbtitle">装饰装修阶段 </div>
                    <div class="tbtime">
                        计划开竣工时间
                    </div>
                    <div class="tbtime1">
                        2018-02-01~2018-05-01
                    </div>
                    <div style="background-color: #e7e7e7">
                        <div style="border-bottom: 1px solid #c1c1c1; margin: 0px 5px">
                        </div>
                    </div>
                    <div class="tbtime">实际开竣工时间</div>
                    <div class="tbtime1">
                        ~
                    </div>
                    <div style="background-color: #e7e7e7">
                        <div style="border-bottom: 1px solid #c1c1c1; margin: 0px 5px">
                        </div>
                    </div>
                    <div class="tbtime" style="text-align: center; height: 18px">

                    </div>
                    <div class="tbtime" style="padding: 1px; text-align: center">
                        <div class="ratediv">
                            <div class="progressright">
                                <div class="divbar" id="1000000117">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="UnFinish">未开始</div>

                </div>

            </li>

            <li class="LiSty">
                <div class="ProgressDiv1">


                    <div class="tbtitle">室外工程阶段 </div>
                    <div class="tbtime">
                        计划开竣工时间
                    </div>
                    <div class="tbtime1">
                        2018-03-20~2018-06-01
                    </div>
                    <div style="background-color: #e7e7e7">
                        <div style="border-bottom: 1px solid #c1c1c1; margin: 0px 5px">
                        </div>
                    </div>
                    <div class="tbtime">实际开竣工时间</div>
                    <div class="tbtime1">
                        ~
                    </div>
                    <div style="background-color: #e7e7e7">
                        <div style="border-bottom: 1px solid #c1c1c1; margin: 0px 5px">
                        </div>
                    </div>
                    <div class="tbtime" style="text-align: center; height: 18px">

                    </div>
                    <div class="tbtime" style="padding: 1px; text-align: center">
                        <div class="ratediv">
                            <div class="progressright">
                                <div class="divbar" id="1000000201">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="UnFinish">未开始</div>

                </div>

        </ul>
    </div>
    <div class="contentTwo" style="margin-top: 20px;">
        <div class="imgTitle">
            项目形象进度
        </div>
        <ul class="slider2"
            id="slider2">

            <li class="LiSty">
                <div class="liDiv1">


                    <img src="/Uploads/GraphicProgress/1000000005/bg.jpg" class="img" />
                    <div style="width: 191px">
                        <p
                                class="a">
                            形象进度0
                        </p>
                    </div>
                </div>

                <div class="liDiv">


                    <img src="/Uploads/GraphicProgress/1000000005/Progress1.png" class="img" />
                    <div style="width: 191px">
                        <p
                                class="a">
                            形象进度1
                        </p>
                    </div>
                </div>

                <div class="liDiv">


                    <img src="/Uploads/GraphicProgress/1000000005/Progress2.png" class="img" />
                    <div style="width: 191px">
                        <p
                                class="a">
                            形象进度2
                        </p>
                    </div>
                </div>

                <div class="liDiv">


                    <img src="/Uploads/GraphicProgress/1000000005/Progress3.png" class="img" />
                    <div style="width: 191px">
                        <p
                                class="a">
                            形象进度3
                        </p>
                    </div>
                </div>

            </li>

            <li class="LiSty">
                <div class="liDiv1">


                    <img src="/Uploads/GraphicProgress/1000000005/Progress4.png" class="img" />
                    <div style="width: 191px">
                        <p
                                class="a">
                            形象进度4
                        </p>
                    </div>
                </div>

        </ul>
    </div>
</div>
<script type="text/javascript">
    //body加载完再执行
    for(var i=0;i<lsStageData.length;i++){
        var div5=document.getElementById(lsStageData[i].StageProjectID);

        div5.dataset.w=lsStageData[i].CompleRate;

    }
</script>
</body>
</html>
