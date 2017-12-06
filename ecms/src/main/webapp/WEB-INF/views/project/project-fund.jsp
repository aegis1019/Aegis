<%@page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <meta charset="utf-8">
    <title>现场管理</title>
    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Scripts/Common/json2.js"></script>
    <script type="text/javascript" src="../Scripts/Common/Com.LS.Common.1.0.js"></script>
    <script src="../Scripts/HighCharts/highcharts.js" type="text/javascript"></script>
    <style type="text/css">
        #mytable {
            border-top: 1px solid #b9b9b9;
            border-left: 1px solid #b9b9b9;
            border-spacing: 0;
            font-family:'Microsoft YaHei';
            width:100%;
            margin-top:10px;
            float:left;
        }

        #mytable td {
            border-bottom: 1px solid #b9b9b9;
            border-right: 1px solid #b9b9b9;
            padding: 5px;
            text-align: center;
        }
        .MyTitle{
            font-weight:bold;
            font-size:14px;
            height:35px;
        }
        .MyTd{color:#0965a0;font-size:14px;height:24px;}
        .FootTd{font-size:14px;height:24px;font-weight:bold;}

        body {
            background-color: #ededed;
        }

        .content {
            text-align: center;
            margin: 15px 7px;
            height: 95%;
        }

        .contentOne {
            margin: 0 auto;
            width: 100%;
            height: 100%;
            border-spacing: 0;
        }

        .contentOne td {
            background-color: white;
        }

        .progress {
            width: 50%;
            height: 50%;
            vertical-align:top;
            padding:15px;
        }


        .TitleSty{
            font-size: 14px;
            font-weight: bolder;
            padding-left: 10px;
            font-family:'Microsoft YaHei UI';
        }
    </style>
    <script type="Text/javascript">
        $(function () {
            $.ajax({
                type: "POST",
                url: "/fund/fee-total-data",
                dataType: "json",
                async: false,
                cache: false,
                success: function (data) {
                    if (data.IsSuccess) {
                        var feeType = data.RtnValue1.split(',');
                        var feeData = JSON.parse(data.RtnValue2);
                        DrawTotalFee(feeType, feeData);
                    }
                }
            });
        });

        //总投资费用情况柱状图
        function DrawTotalFee(arrName, arrNum) {
            $('#TotalFee').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '<bold>总投资费用情况</bold>',
                    align: "left",
                    style: { fontWeight: "bold" }
                },
                xAxis: {
                    categories: arrName,
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '金额(万元)'
                    },
                    labels: {
                        formatter: function () {
                            return this.value ;
                        }
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
                legend: { enabled: true }, //显示图标
                series: arrNum
            });
        }

        function Detail(feeType, feeTypeName, percent) {
            ////加载子项表格
            //$.ajax({
            //    url: '/CapitalManages/FeeTotal/LoadTable?FeeType=' + feeType + '&FeeTypeName=' + encodeURI(feeTypeName),
            //    async: false,
            //    type: 'POST',
            //    success: function (data) {
            //        document.getElementById("SecTable").innerHTML = data;
            //    }
            //});
            DrawDepart(feeTypeName, percent);
        }
        //饼状图
        function DrawDepart(feeTypeName, percent) {
            $('#BuildFee').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: feeTypeName
                },
                tooltip: {
                    headerFormat: '{series.name}<br>',
                    pointFormat: '{point.name}: <b>{point.percentage:.2f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.2f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: feeTypeName,
                    data: [
                        {
                            name: "已支付",
                            y: percent,
                            sliced: true,
                            selected: true
                        },
                        ['未支付', 100-percent]
                    ]
                }]
            });
        }
    </script>
</head>
<body>
<div class="content">

    <table class="contentOne">
        <tr>
            <td class="progress">

                <table id="mytable">
                    <tr>
                        <td style="width:8%" class="MyTitle">序号</td>
                        <td style="width:20%" class="MyTitle">费用类别</td>
                        <td style="width:23%" class="MyTitle">合同总金额(万元)</td>
                        <td style="width:23%" class="MyTitle">累计已支付(万元)</td>
                        <td style="width:26%" class="MyTitle">占合同金额百分比(%)</td>
                    </tr>

                    <tr>
                        <td class="MyTd" ondblclick="Detail('1000000103','土地费用',33.330)">1</td>
                        <td class="MyTd" ondblclick="Detail('1000000103','土地费用',33.330)">土地费用</td>
                        <td class="MyTd" ondblclick="Detail('1000000103','土地费用',33.330)">30</td>
                        <td class="MyTd" ondblclick="Detail('1000000103','土地费用',33.330)">10</td>
                        <td class="MyTd" ondblclick="Detail('1000000103','土地费用',33.330)">33.33</td>
                    </tr>

                    <tr>
                        <td class="MyTd" ondblclick="Detail('1000000104','勘察费',75.000)">2</td>
                        <td class="MyTd" ondblclick="Detail('1000000104','勘察费',75.000)">勘察费</td>
                        <td class="MyTd" ondblclick="Detail('1000000104','勘察费',75.000)">24</td>
                        <td class="MyTd" ondblclick="Detail('1000000104','勘察费',75.000)">18</td>
                        <td class="MyTd" ondblclick="Detail('1000000104','勘察费',75.000)">75</td>
                    </tr>

                    <tr>
                        <td class="MyTd" ondblclick="Detail('1000000105','设计费用',66.450)">3</td>
                        <td class="MyTd" ondblclick="Detail('1000000105','设计费用',66.450)">设计费用</td>
                        <td class="MyTd" ondblclick="Detail('1000000105','设计费用',66.450)">456</td>
                        <td class="MyTd" ondblclick="Detail('1000000105','设计费用',66.450)">303</td>
                        <td class="MyTd" ondblclick="Detail('1000000105','设计费用',66.450)">66.45</td>
                    </tr>

                    <tr>
                        <td class="MyTd" ondblclick="Detail('1000000106','施工费用',33.330)">4</td>
                        <td class="MyTd" ondblclick="Detail('1000000106','施工费用',33.330)">施工费用</td>
                        <td class="MyTd" ondblclick="Detail('1000000106','施工费用',33.330)">300</td>
                        <td class="MyTd" ondblclick="Detail('1000000106','施工费用',33.330)">100</td>
                        <td class="MyTd" ondblclick="Detail('1000000106','施工费用',33.330)">33.33</td>
                    </tr>

                    <tr>
                        <td class="MyTd" ondblclick="Detail('1000000107','监理费',20.000)">5</td>
                        <td class="MyTd" ondblclick="Detail('1000000107','监理费',20.000)">监理费</td>
                        <td class="MyTd" ondblclick="Detail('1000000107','监理费',20.000)">50</td>
                        <td class="MyTd" ondblclick="Detail('1000000107','监理费',20.000)">10</td>
                        <td class="MyTd" ondblclick="Detail('1000000107','监理费',20.000)">20</td>
                    </tr>

                    <tr>
                        <td class="MyTd" ondblclick="Detail('1000000109','基坑监测',13.040)">6</td>
                        <td class="MyTd" ondblclick="Detail('1000000109','基坑监测',13.040)">基坑监测</td>
                        <td class="MyTd" ondblclick="Detail('1000000109','基坑监测',13.040)">23</td>
                        <td class="MyTd" ondblclick="Detail('1000000109','基坑监测',13.040)">3</td>
                        <td class="MyTd" ondblclick="Detail('1000000109','基坑监测',13.040)">13.04</td>
                    </tr>

                    <tr>
                        <td class="MyTd" ondblclick="Detail('1000000110','桩基检测',60.000)">7</td>
                        <td class="MyTd" ondblclick="Detail('1000000110','桩基检测',60.000)">桩基检测</td>
                        <td class="MyTd" ondblclick="Detail('1000000110','桩基检测',60.000)">50</td>
                        <td class="MyTd" ondblclick="Detail('1000000110','桩基检测',60.000)">30</td>
                        <td class="MyTd" ondblclick="Detail('1000000110','桩基检测',60.000)">60</td>
                    </tr>

                    <tr>
                        <td class="MyTd" ondblclick="Detail('1000000111','其他',10.000)">8</td>
                        <td class="MyTd" ondblclick="Detail('1000000111','其他',10.000)">其他</td>
                        <td class="MyTd" ondblclick="Detail('1000000111','其他',10.000)">10</td>
                        <td class="MyTd" ondblclick="Detail('1000000111','其他',10.000)">1</td>
                        <td class="MyTd" ondblclick="Detail('1000000111','其他',10.000)">10</td>
                    </tr>

                    <tr>
                        <td colspan="2" class="FootTd">总投资</td>
                        <td class="FootTd">943</td>
                        <td class="FootTd">475</td>
                        <td class="FootTd">50.371</td>
                    </tr>
                </table>
            </td>
            <td style="padding-left:20px">
                <div id="TotalFee" style="width:96%;float:left;height:300px;"></div>
            </td>
        </tr>
        <tr style="height: 15px">
            <td colspan="2" style="background-color: #ededed; width: 10px;"></td>
        </tr>
        <tr>
            <td class="progress" id="SecTable">
            </td>
            <td style="padding-left:20px">
                <div id="BuildFee" style="width:96%;float:left;height:300px;"></div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
