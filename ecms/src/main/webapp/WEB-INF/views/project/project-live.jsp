<%@page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>现场管理</title>
    <link rel="stylesheet" type="text/css" href="../Scripts/EasyUI/jquery-easyui-1.5.1/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/EasyUI/jquery-easyui-1.5.1/themes/icon.css" />

    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="../Scripts/HighCharts/highcharts.js"></script>

    <style type="text/css">
        .mytable {
            border-top: 1px solid #b9b9b9;
            border-left: 1px solid #b9b9b9;
            border-spacing: 0;
            font-family: 'Microsoft YaHei';
            width: 99%;
            margin-top: 10px;
        }
        .mytable caption {
            text-align: left;
        }

        .mytable td {
            border-bottom: 1px solid #b9b9b9;
            border-right: 1px solid #b9b9b9;
            padding: 5px;
            text-align: center;
        }

        .MyTitle {
            font-weight: bold;
            font-size: 14px;
            height: 35px;
        }

        .MyTd {
            color: #0965a0;
            font-size: 14px;
            height: 24px;
        }

        .divBody {
            margin: 10px;
            padding: 10px;
            background-color: white;
        }
    </style>
    <script type="Text/javascript">
        var lsDepartData = [{"DepartID":"1000000001","ProjectID":"1","DepartName":"工程技术部","DepartNumber":"50","ActualNumber":"","CurrentTime":"2017-10-24","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-13 11:14:11Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-11-06 10:54:34Z","Remark":"","DelTag":"1","Percent":null,"limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"DepartID":"1000000002","ProjectID":"1","DepartName":"质量安全部","DepartNumber":"10","ActualNumber":"15","CurrentTime":"2017-10-24","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-13 11:15:49Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-24 13:46:24Z","Remark":"","DelTag":"1","Percent":null,"limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"DepartID":"1000000004","ProjectID":"1","DepartName":"设备物质部","DepartNumber":"10","ActualNumber":"13","CurrentTime":"2017-10-24","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-13 15:06:36Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-24 13:46:31Z","Remark":"","DelTag":"1","Percent":null,"limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"DepartID":"1000000021","ProjectID":"1","DepartName":"设计部门","DepartNumber":"3","ActualNumber":"7","CurrentTime":"2017-10-24","InputterID":"0000000017","InputterOfOrgID":"0000000007","InputterName":"lh","InputDate":"2017-10-18 22:13:33Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-24 13:46:53Z","Remark":"","DelTag":"1","Percent":null,"limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""}];
        var lsEquipmentData = [{"EquipmentID":"1000000001","ProjectID":"1","EquipmentName":"挖掘机","EquipmentNumber":"10","ActualNumber":"","CurrentTime":"2017-10-24","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-13 14:09:28Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-24 14:03:07Z","Remark":"挖掘机","DelTag":"1","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"EquipmentID":"1000000003","ProjectID":"1","EquipmentName":"水泥车","EquipmentNumber":"5","ActualNumber":"","CurrentTime":"2017-10-24","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-13 15:08:51Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-24 14:03:13Z","Remark":"","DelTag":"1","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"EquipmentID":"1000000004","ProjectID":"1","EquipmentName":"升降机","EquipmentNumber":"3","ActualNumber":"","CurrentTime":"2017-10-24","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-13 15:13:28Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-24 14:03:20Z","Remark":"","DelTag":"1","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"EquipmentID":"1000000007","ProjectID":"1","EquipmentName":"铲车","EquipmentNumber":"19","ActualNumber":"","CurrentTime":"2017-10-24","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-15 00:04:37Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-24 14:03:26Z","Remark":"","DelTag":"1","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"EquipmentID":"1000000005","ProjectID":"1","EquipmentName":"料车","EquipmentNumber":"8","ActualNumber":"","CurrentTime":"2017-10-24","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-13 15:25:05Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-24 14:03:32Z","Remark":"","DelTag":"1","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""},{"EquipmentID":"1000000006","ProjectID":"1","EquipmentName":"其他","EquipmentNumber":"4","ActualNumber":"","CurrentTime":"2017-10-24","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-13 15:25:22Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-24 14:03:38Z","Remark":"","DelTag":"1","limit":0,"start":0,"page":0,"BeginRecordNumber":0,"EndRecordNumber":0,"SearchString":"","Search":"","q":null,"OrderByExpr":""}];
        var departNumber = {"工程技术部":[],"质量安全部":[],"设备物质部":[],"设计部门":[]};
        var departActualNumber = {"工程技术部":[],"质量安全部":[],"设备物质部":[],"设计部门":[]};
        var equipmentNumber = {"挖掘机":[],"水泥车":[],"升降机":[],"铲车":[],"料车":[],"其他":[]};
        var equipmentActualNumber = {"挖掘机":[],"水泥车":[],"升降机":[],"铲车":[],"料车":[],"其他":[]};
        var mydate = new Date();
        mydate.setDate(mydate.getDate()-7);
        var strYear = mydate.getFullYear();
        var strMonth = mydate.getMonth();
        var strDate = mydate.getDate();

        $(function () {

            //var width=$(window).width();
            //height= height-$('#divHead').height()-100;
            //$('#lsDepart').height(height*0.5);
            //$('#lsEquipment').height(height*0.5);
            $('#graphDepart').height($('#lsDepart').height());
            //$('#graphDepart').width(width-$('#lsDepart').width()-100);
            $('#graphEquipment').height($('#lsEquipment').height());
            //$('#graphEquipment').width(width-$('#lsEquipment').width()-100);
            DrawDepart();
            DrawEquipment();
        });

        //现场管控人员
        function DrawDepart() {
            for (var i = 0; i < lsDepartData.length; i++) {
                var number=departNumber[lsDepartData[i].DepartName];
                for (var j = 0; j < number.length; j++) {
                    number[j]=Number(number[j]);
                }
                var actualNumber=departActualNumber[lsDepartData[i].DepartName];
                for (var j = 0; j < actualNumber.length; j++) {
                    actualNumber[j]=Number(actualNumber[j]);
                }
                $('#depart'+i).highcharts({
                    chart:{
                        height: $('#lsDepart').height()-20
                    },
                    title:{
                        text:'历史人员动态'
                    },
                    xAxis: {
                        type: 'datetime',
                        dateTimeLabelFormats: {
                            day: '%Y-%m-%e'
                        }
                    },
                    yAxis: {
                        title: {
                            text:''
                        }
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign:'middle'
                    },
                    plotOptions: {
                        series: {
                            label: {
                                connectorAllowed:false
                            }
                        }
                    },
                    series: [{
                        name: '实际',
                        color:'#4c70e8',
                        //data: actualNumber,
                        data:[10, 12, 15, 20, 17],
                        pointStart: Date.UTC(strYear, strMonth, strDate),
                        pointInterval:24*3600*1000
                    }, {
                        name: '计划',
                        color: '#fa5e5f',
                        //data: number,
                        data:[10, 13, 10, 25, 20],
                        pointStart: Date.UTC(strYear, strMonth, strDate),
                        pointInterval: 24 * 3600 * 1000
                    }],
                    responsive: {
                        rules: [{
                            condition: {
                                maxWidth: 50
                            }
                        }],
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign:'bottom'
                            }
                        }
                    }
                });
            }

        }

        //设备投入情况
        function DrawEquipment() {
            for (var i = 0; i < lsEquipmentData.length; i++) {
                var number=equipmentNumber[lsEquipmentData[i].EquipmentName];
                for (var j = 0; j < number.length; j++) {
                    number[j]=Number(number[j]);
                }
                var actualNumber=equipmentActualNumber[lsEquipmentData[i].EquipmentName];
                for (var j = 0; j < actualNumber.length; j++) {
                    actualNumber[j]=Number(actualNumber[j]);
                }
                $('#equipment'+i).highcharts({
                    chart: {
                        type: 'column',
                        height: $('#lsEquipment').height()-20
                    },
                    title: {
                        text: '历史设备动态'
                    },
                    xAxis: {
                        type: 'datetime',
                        dateTimeLabelFormats: {
                            day: '%Y-%m-%e'
                        }
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: ''
                        }
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.0f} 个</b></td></tr>',
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true
                    },
                    plotOptions: {
                        column: {
                            pointPadding: 0.2,
                            borderWidth: 0
                        }
                    },
                    legend: { enabled: false }, //不显示图标
                    series: [{
                        name: '实际',
                        color:'#4c70e8',
                        //data: actualNumber,
                        data:[10, 12, 15, 20, 17],
                        pointStart: Date.UTC(strYear, strMonth, strDate),
                        pointInterval: 24 * 3600 * 1000
                    }, {
                        name: '计划',
                        color: '#fa5e5f',
                        //data: number,
                        data:[10, 13, 10, 25, 20],
                        pointStart: Date.UTC(strYear, strMonth, strDate),
                        pointInterval: 24 * 3600 * 1000
                    }],
                });
            }
        }
    </script>
</head>
<body style="background-color: #ededed">
<div style="height: 100%">
    <div id="divHead" class="divBody">
        <span class="MyTitle">现场人员动态</span>
            <span>
                <marquee scrollamount="3" style="color:#df3b2d;width:80%;">张晨光，2017年10月22日-9：00，离开现场。</marquee>
            </span>
        <span class="MyTitle">当前总人数</span>
    </div>
    <div id="lsDepart" class="divBody" style="width: 35%;height: 100%; display: inline-block;">
        <table class="mytable">
            <caption class="MyTitle"> 今日人员动态</caption>
            <tr>
                <td style="width: 15%" class="MyTitle">序号</td>
                <td style="width: 40%" class="MyTitle">部门</td>
                <td style="width: 20%" class="MyTitle">今日计划</td>
                <td style="width: 25%" class="MyTitle">实际到场人员</td>
            </tr>

            <tr>
                <td class="MyTd">1</td>
                <td class="MyTd">工程技术部</td>
                <td class="MyTd">50</td>
                <td class="MyTd"></td>
            </tr>

            <tr>
                <td class="MyTd">2</td>
                <td class="MyTd">质量安全部</td>
                <td class="MyTd">10</td>
                <td class="MyTd">15</td>
            </tr>

            <tr>
                <td class="MyTd">3</td>
                <td class="MyTd">设备物质部</td>
                <td class="MyTd">10</td>
                <td class="MyTd">13</td>
            </tr>

            <tr>
                <td class="MyTd">4</td>
                <td class="MyTd">设计部门</td>
                <td class="MyTd">3</td>
                <td class="MyTd">7</td>
            </tr>

        </table>
    </div>
    <div id="graphDepart" class="divBody" style="width: 57%; height: 100%; display: inline-block;">
        <div class="easyui-tabs">

            <div title="工程技术部">
                <div id="depart0"></div>
            </div>

            <div title="质量安全部">
                <div id="depart1"></div>
            </div>

            <div title="设备物质部">
                <div id="depart2"></div>
            </div>

            <div title="设计部门">
                <div id="depart3"></div>
            </div>

        </div>
    </div>
    <div id="lsEquipment" class="divBody" style="width: 35%;height: 100%; display: inline-block;">
        <table class="mytable">
            <caption class="MyTitle"> 今日设备动态</caption>
            <tr>
                <td style="width: 15%" class="MyTitle">序号</td>
                <td style="width: 40%" class="MyTitle">设备</td>
                <td style="width: 20%" class="MyTitle">今日计划</td>
                <td style="width: 25%" class="MyTitle">实际到场设备</td>
            </tr>

            <tr>
                <td class="MyTd">1</td>
                <td class="MyTd">挖掘机</td>
                <td class="MyTd">10</td>
                <td class="MyTd"></td>
            </tr>

            <tr>
                <td class="MyTd">2</td>
                <td class="MyTd">水泥车</td>
                <td class="MyTd">5</td>
                <td class="MyTd"></td>
            </tr>

            <tr>
                <td class="MyTd">3</td>
                <td class="MyTd">升降机</td>
                <td class="MyTd">3</td>
                <td class="MyTd"></td>
            </tr>

            <tr>
                <td class="MyTd">4</td>
                <td class="MyTd">铲车</td>
                <td class="MyTd">19</td>
                <td class="MyTd"></td>
            </tr>

            <tr>
                <td class="MyTd">5</td>
                <td class="MyTd">料车</td>
                <td class="MyTd">8</td>
                <td class="MyTd"></td>
            </tr>

            <tr>
                <td class="MyTd">6</td>
                <td class="MyTd">其他</td>
                <td class="MyTd">4</td>
                <td class="MyTd"></td>
            </tr>

        </table>
    </div>
    <div id="graphEquipment" class="divBody" style="width: 57%; height: 100%; display: inline-block;">
        <div class="easyui-tabs">

            <div title="挖掘机">
                <div id="equipment0"></div>
            </div>

            <div title="水泥车">
                <div id="equipment1"></div>
            </div>

            <div title="升降机">
                <div id="equipment2"></div>
            </div>

            <div title="铲车">
                <div id="equipment3"></div>
            </div>

            <div title="料车">
                <div id="equipment4"></div>
            </div>

            <div title="其他">
                <div id="equipment5"></div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
