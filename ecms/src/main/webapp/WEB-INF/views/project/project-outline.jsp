<%@page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>项目基本情况</title>
    <link rel="stylesheet" type="text/css" href="../Scripts/EasyUI/jquery-easyui-1.5.1/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/EasyUI/jquery-easyui-1.5.1/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../css/Comm1.0.1.css" />
    <link href="../css/Index1.0.0.css" rel="stylesheet" />
    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Scripts/Common/json2.js"></script>
    <script src="../Scripts/HighCharts/radialIndicator.js"></script>
    <script src="../Scripts/HighCharts/progressBar.js"></script>
    <script src="../Scripts/HighCharts/highcharts.js" type="text/javascript"></script>

    <script type="text/javascript" src="../Scripts/Common/Com.LS.Common.1.0.js"></script>
    <style type="text/css">
        body {
            background-color: #ededed;
            overflow: auto;
        }

        .content {
            text-align: center;
            margin: 15px;
            height: 95%;
        }

        .contentOne {
            margin: 0 auto;
            width: 98%;
            height: 100%;
            padding-bottom: 10px;
        }

        .contentOne td {
            background-color: white;
        }

        .ConTd {
            background-color: #8fd9ff;
        }

        .progress {
            width: 32%;
            height: 50%;
            vertical-align: top;
        }

        .progress1 {
            width: 65%;
            height: 50%;
            vertical-align: top;
        }

        .TitleSty {
            font-size: 16px;
            font-weight: bolder;
            padding-left: 10px;
            font-family: 'Microsoft YaHei UI';
        }

        .tb1 {
            color: #1f80bd;
            font-size: 14px;
        }

        .tb2 {
            position: relative;
            vertical-align: bottom;
            width: 120px;
            top: 4px;
        }

        .tb3 {
            border-bottom: 1px solid #1f80bd;
            text-align: center;
            vertical-align: bottom;
        }

        .miniTable {
            width: 90%;
            margin: 10px 15px;
            text-align: left;
            height: 370px;
        }

        .LeftTitle {
            position: absolute;
            z-index: 2;
            left: 35px;
            top: 18px;
            font-size: 14px;
            color: white;
        }

        .SecTable {
            width: 98%;
            margin: 10px 15px;
            text-align: left;
            height: 300px;
        }

        .ConTable {
            background-color: #8fd9ff;
            padding: 0 10px;
            height: 110px;
            width: 88%;
        }

        .SecTable tr {
            vertical-align: middle;
        }

        .tbTel {
            color: #1f80bd;
            vertical-align: bottom;
        }

        .SecTable2 {
            width: 90%;
            margin: 10px 15px;
            text-align: left;
            height: 290px;
        }

        .SecTable2 td {
            font-size: 14px;
        }

        .TrSty {
            border-bottom: 1px solid #c1c1c1;
        }
        .MoreSty{
            color:#c1c1c1;
            cursor:pointer;
        }
        .MoreSty:hover{
            color:#0965a0;
        }
    </style>

    <script>

        //项目对象
        var ProjectJson = {"ProjectID":"1000000005","Abbreviation":"研发楼一期","Code":"1","Name":"研发楼一期","Constructor":"福州市大数据产业基地开发有限责任公司","Location":"福州长乐","Scale":"一期规模概况","PlanStart":"2017-10-12","PlanComplete":"2017-10-31","Consist":"研发测试","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-12 11:05:56Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-31 10:39:43Z","Remark":"标识","DelTag":"1","CompleRate":"12","CoversArea":"30","BuildArea":"40","AboveArea":"50","UnderArea":"60","TotalFloor":"70","ConstructorPerson":"林亭","ConstructorTel":"13489010555","Supervision":"福建升恒建设集团有限公司","SupervisionPerson":"陈慧华","SupervisionTel":"15985798699","Contract":"中建海峡建设有限公司","ContractPerson":"蔡海云","ContractTel":"18250345890","Design":"福州市规划设计研究院","DesignPerson":"费玉麟","DesignTel":"15789098765","TotalDay":"19","PlanStartNew":"2017年10月12日","PlanCompleteNew":"2017年10月31日","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""};
        var lsStageData = [{"StageProjectID":"1000000115","Name":"地下室施工阶段","Sort":"3","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-14 13:35:39Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-20 08:46:30Z","Remark":"地下室","DelTag":"1","CompleRate":"95","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"StageProjectID":"1000000113","Name":"勘察施工阶段","Sort":"1","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-14 13:30:19Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-15 19:02:02Z","Remark":"勘探","DelTag":"1","BeginRecordNumber":0,"EndRecordNumber":0,"Search":"","OrderByExpr":"","CompleRate":"100","limit":0,"start":0,"page":0,"SearchString":"","q":null},{"StageProjectID":"1000000114","Name":"基础施工阶段","Sort":"2","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-14 13:35:30Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-20 08:46:19Z","Remark":"基础","DelTag":"1","BeginRecordNumber":0,"EndRecordNumber":0,"Search":"","OrderByExpr":"","CompleRate":"100","limit":0,"start":0,"page":0,"SearchString":"","q":null},{"StageProjectID":"1000000116","Name":"上部结构施工阶段","Sort":"4","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-14 13:36:24Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-20 08:46:52Z","Remark":"上部结构","DelTag":"1","BeginRecordNumber":0,"EndRecordNumber":0,"Search":"","OrderByExpr":"","CompleRate":"0","limit":0,"start":0,"page":0,"SearchString":"","q":null},{"StageProjectID":"1000000117","Name":"装饰装修阶段","Sort":"5","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-14 13:36:37Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-20 08:47:09Z","Remark":"装饰装修","DelTag":"1","BeginRecordNumber":0,"EndRecordNumber":0,"Search":"","OrderByExpr":"","CompleRate":"0","limit":0,"start":0,"page":0,"SearchString":"","q":null},{"StageProjectID":"1000000201","Name":"室外工程阶段","Sort":"6","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-20 08:47:25Z","ModifierID":"","ModifierOfOrgID":"","ModifierName":"","ModifyDate":"","Remark":"室外工程","DelTag":"1","BeginRecordNumber":0,"EndRecordNumber":0,"Search":"","OrderByExpr":"","CompleRate":"0","limit":0,"start":0,"page":0,"SearchString":"","q":null}];
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "/fund/fund-outline",

                dataType: "json",
                async: false,
                cache: false,
                success: function (data) {
                    if (data.IsSucess) {
                        var xType = data.RtnValue1.split(',');
                        var Data = JSON.parse(data.RtnValue2);
                        FeeTotalPercent(xType,Data);
                    }
                }
            });
            //项目名称
            $("#name").html(ProjectJson.Name+':基本信息');
            //建设单位
            $("#Constructor").html(ProjectJson.Constructor);
            //建设地点
            $("#Location").html(ProjectJson.Location);
            //规模及概况
            $("#Scale").html(ProjectJson.Scale);
            //计划开工时间
            $("#PlanStart").html(ProjectJson.PlanStartNew);
            //计划竣工时间
            $("#PlanComplete").html(ProjectJson.PlanCompleteNew);
            //项目组成
            $("#consist").html(ProjectJson.Consist);

            $("#totalDay").html(ProjectJson.TotalDay+'天('+ProjectJson.PlanStart+'-'+ProjectJson.PlanComplete+')');

            $("#circle1").radialIndicator({

                barBgColor:'lightgray',
                barColor:'aqua',
                radius:45,
                initValue:ProjectJson.CompleRate,
                percentage: true
            });

        });
        //设备投入情况柱状图
        function FeeTotalPercent(arrType,arrNum) {
            $('#FeeTotal').highcharts({
                chart: {
                    type: 'line'
                },
                colors:['#4c70e8','#fa5e5f'],
                title: {
                    text: '投资信息',
                    align: 'left',
                    style:{
                        fontWeight:'bold',
                        fontSize:'16px'
                    }
                },
                yAxis: {
                    title: {
                        //text: '金额(万元)'
                        text: ''
                    },

                    lineWidth:1.5,//线宽度
                    lineColor: '#919191',//设置纵向标尺颜色
                    gridLineWidth:0 //网格线宽度
                },
                xAxis: {
                    categories:arrType,
                    minorTickInterval: 'auto',//设置是否出现纵向小标尺
                    tickColor:'white',//刻度颜色
                    lineWidth:1.5,//线宽度
                    lineColor: '#919191'//设置纵向标尺颜色
                    //title: {
                    //    text: '百分比'
                    //}
                },
                legend: {
                    layout: 'fixed',
                    align: 'right',
                    verticalAlign: 'top'
                },
                //legend: { enabled: false }, //不显示图标
                series: arrNum,
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 500
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                }
            });
        }
        function LinkMan(){

            top.Close = function () {
                top.window.$("#divWin").window('close');
            }
            var strHref = '<iframe id="fmProjectInfoAdd" name="fmProjectInfoAdd" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/Function/Basic/LinkMan?frmName="></iframe>';

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
                title: "项目通讯录"
            });
            top.window.$("#divWin").window('center');
        }
    </script>

</head>
<body>
<div class="content">

    <table class="contentOne">
        <tr>
            <td class="progress">
                <table id="Survey" class="miniTable">
                    <tr>
                        <td class="TitleSty">项目概况</td>
                    </tr>
                    <tr>
                        <td style="padding-top: 15px; height:280px; vertical-align: baseline">一期规模概况</td>
                    </tr>
                </table>
            </td>
            <td class="midline" style="background-color: #ededed; width: 10px;"></td>
            <td class="progress">
                <table id="Engineer" class="miniTable">
                    <tr>
                        <td class="TitleSty">工程信息</td>
                    </tr>
                    <tr>
                        <td class="tb2">
                            <img src="../images/img/TitleBg.png" />
                            <div class="LeftTitle">占地面积</div>
                        </td>
                        <td class="tb3">30</td>
                    </tr>
                    <tr>
                        <td class="tb2">
                            <img src="../images/img/TitleBg.png" />
                            <div class="LeftTitle">建筑面积</div>
                        </td>
                        <td class="tb3">40</td>
                    </tr>
                    <tr>
                        <td class="tb2">
                            <img src="../images/img/TitleBg.png" />
                            <div class="LeftTitle">地上面积</div>
                        </td>
                        <td class="tb3">50</td>
                    </tr>
                    <tr>
                        <td class="tb2">
                            <img src="../images/img/TitleBg.png" />
                            <div class="LeftTitle">地下面积</div>
                        </td>
                        <td class="tb3">60</td>
                    </tr>
                    <tr>
                        <td class="tb2">
                            <img src="../images/img/TitleBg.png" />
                            <div class="LeftTitle">总层高</div>
                        </td>
                        <td class="tb3">70</td>
                    </tr>
                    <tr>
                        <td class="tb2">
                            <img src="../images/img/TitleBg.png" />
                            <div class="LeftTitle">开工日期</div>
                        </td>
                        <td class="tb3">2017年10月12日</td>
                    </tr>
                    <tr>
                        <td class="tb2">
                            <img src="../images/img/TitleBg.png" />
                            <div class="LeftTitle">竣工日期</div>
                        </td>
                        <td class="tb3">2017年10月31日</td>
                    </tr>
                </table>
            </td>
            <td class="midline" style="background-color: #ededed; width: 10px;"></td>
            <td class="progress" style="width:34%">
                <div id="FeeTotal"style="width:100%;height:380px;margin-top:10px"></div>
            </td>
        </tr>
        <tr style="height: 15px">
            <td colspan="5" style="background-color: #ededed; width: 10px;"></td>
        </tr>
        <tr>
            <td class="progress1" colspan="3">

                <table id="Contruction" class="SecTable">
                    <tr>
                        <td class="TitleSty">参建单位</td>
                    </tr>
                    <tr>
                        <td style="width: 353px;">
                            <table class="ConTable">
                                <colgroup>
                                    <col width="50px" />
                                    <col width="65px" />
                                    <col width="60px" />
                                    <col width="100px" />
                                </colgroup>
                                <tr>
                                    <td class="ConTd" style="background-color: #8fd9ff; border-bottom: 1px solid #fe6e00; font-weight: bold">建设单位</td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="ConTd" style="background-color: #8fd9ff">福州市大数据产业基地开发有限责任公司</td>
                                </tr>
                                <tr>
                                    <td class="ConTd" style="background-color: #8fd9ff">总指挥:</td>
                                    <td class="ConTd" style="background-color: #8fd9ff">林亭</td>
                                    <td class="ConTd" style="background-color: #8fd9ff">联系电话:</td>
                                    <td class="ConTd" style="background-color: #8fd9ff">13489010555</td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 353px;">
                            <table class="ConTable">
                                <colgroup>
                                    <col width="50px" />
                                    <col width="65px" />
                                    <col width="60px" />
                                    <col width="100px" />
                                </colgroup>
                                <tr>
                                    <td class="ConTd" style="background-color: #8fd9ff; border-bottom: 1px solid #fe6e00; font-weight: bold">监理单位</td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="ConTd" style="background-color: #8fd9ff">福建升恒建设集团有限公司</td>
                                </tr>
                                <tr>
                                    <td class="ConTd" style="background-color: #8fd9ff">总指挥:</td>
                                    <td class="ConTd" style="background-color: #8fd9ff">陈慧华</td>
                                    <td class="ConTd" style="background-color: #8fd9ff">联系电话:</td>
                                    <td class="ConTd" style="background-color: #8fd9ff">15985798699</td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td style="width: 353px;">
                            <table class="ConTable">
                                <colgroup>
                                    <col width="50px" />
                                    <col width="65px" />
                                    <col width="60px" />
                                    <col width="100px" />
                                </colgroup>
                                <colgroup>
                                    <col width="50px" />
                                    <col width="65px" />
                                    <col width="60px" />
                                    <col width="100px" />
                                </colgroup>
                                <tr>
                                    <td class="ConTd" style="background-color: #8fd9ff; border-bottom: 1px solid #fe6e00; font-weight: bold">总包单位</td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="ConTd" style="background-color: #8fd9ff">中建海峡建设有限公司</td>
                                </tr>
                                <tr>
                                    <td class="ConTd" style="background-color: #8fd9ff">总指挥:</td>
                                    <td class="ConTd" style="background-color: #8fd9ff">蔡海云</td>
                                    <td class="ConTd" style="background-color: #8fd9ff">联系电话:</td>
                                    <td class="ConTd" style="background-color: #8fd9ff">18250345890</td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 353px;">
                            <table class="ConTable">
                                <colgroup>
                                    <col width="50px" />
                                    <col width="65px" />
                                    <col width="60px" />
                                    <col width="100px" />
                                </colgroup>
                                <tr>
                                    <td class="ConTd" style="background-color: #8fd9ff; border-bottom: 1px solid #fe6e00; font-weight: bold">设计院</td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="ConTd" style="background-color: #8fd9ff">福州市规划设计研究院</td>
                                </tr>
                                <tr>
                                    <td class="ConTd" style="background-color: #8fd9ff">总指挥:</td>
                                    <td class="ConTd" style="background-color: #8fd9ff">费玉麟</td>
                                    <td class="ConTd" style="background-color: #8fd9ff">联系电话:</td>
                                    <td class="ConTd" style="background-color: #8fd9ff">15789098765</td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                </table>
            </td>

            <td class="midline" style="background-color: #ededed; width: 10px;"></td>
            <td class="progress">
                <table id="Content" class="SecTable2">
                    <colgroup>
                        <col width="27%" />
                        <col width="28%" />
                        <col width="45%" />
                    </colgroup>
                    <tr>
                        <td class="TitleSty" style="font-size:16px" colspan="2">项目通讯录</td>
                        <td style="text-align:right"><a class="MoreSty" onclick="LinkMan()">查看全部>></a></td>
                    </tr>

                    <tr style="vertical-align: middle">
                        <td rowspan="2">项目经理</td>
                        <td rowspan="2">林夕</td>
                        <td class="tbTel">13489798789</td>
                    </tr>
                    <tr>
                        <td style="color: #1f80bd">linxi@124.com</td>
                    </tr>
                    <tr style="height: 1px">
                        <td class="TrSty" colspan="3"></td>
                    </tr>

                    <tr style="vertical-align: middle">
                        <td rowspan="2">现场值班</td>
                        <td rowspan="2">保安室</td>
                        <td class="tbTel">0591-5678990</td>
                    </tr>
                    <tr>
                        <td style="color: #1f80bd">789@126.xom</td>
                    </tr>
                    <tr style="height: 1px">
                        <td class="TrSty" colspan="3"></td>
                    </tr>

                    <tr style="vertical-align: middle">
                        <td rowspan="2">应急管理</td>
                        <td rowspan="2">周明</td>
                        <td class="tbTel">12341234325</td>
                    </tr>
                    <tr>
                        <td style="color: #1f80bd">zhouming@126.com</td>
                    </tr>
                    <tr style="height: 1px">
                        <td class="TrSty" colspan="3"></td>
                    </tr>

                    <tr style="vertical-align: middle">
                        <td rowspan="2">主管单位</td>
                        <td rowspan="2">项目主管单位</td>
                        <td class="tbTel">00808</td>
                    </tr>
                    <tr>
                        <td style="color: #1f80bd">0808@163.com</td>
                    </tr>
                    <tr style="height: 1px">
                        <td class="TrSty" colspan="3"></td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
</div>
</body>

</html>
