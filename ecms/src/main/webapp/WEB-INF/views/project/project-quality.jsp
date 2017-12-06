<%@page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <meta charset="utf-8">
    <title>日志管理</title>
    <link rel="stylesheet" type="text/css" href="../Scripts/EasyUI/jquery-easyui-1.5.1/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/EasyUI/jquery-easyui-1.5.1/themes/icon.css" />
    <script type="text/javascript" src="../Scripts/FW/Verify.js"></script>
    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Scripts/Common/json2.js"></script>
    <script type="text/javascript" src="../Scripts/Common/Com.LS.Common.1.0.js"></script>
    <style type="text/css">
        .mytable {
            border-spacing: 0;
            font-family: 'Microsoft YaHei';
        }

        .mytable td {
            padding: 5px;
            /*text-align: center;*/
        }

        .menudate {
            text-align: left;
            color: #08669f;
            font-weight: bold;
        }

        .TitleSe {
            text-align: left;
            color: #08669f;
            font-weight: bold;
            border-bottom: 1px solid #919191;
        }

        .TitleSty {
            text-align: center;
            border-left: 1px solid #919191;
            border-bottom: 1px solid #919191;
            background: #d4eeff;
            color: #08669f;
            font-weight: bold;
        }

        .TitleSty1 {
            text-align: center;
            border-left: 1px solid #919191;
            border-bottom: 1px solid #919191;
            border-right: 1px solid #919191;
            background: #d4eeff;
            color: #08669f;
            font-weight: bold;
        }

        .mytd {
            cursor: pointer;
            text-align: center;
            border-left: 1px solid #919191;
            border-bottom: 1px solid #919191;
            color: #919191;
        }

        .mytd1 {
            cursor: pointer;
            text-align: center;
            border-left: 1px solid #919191;
            border-bottom: 1px solid #919191;
            border-right: 1px solid #919191;
            color: #919191;
        }

        .mytitleTr {
        }

        .menuBtn {
            margin-left: 2px;
            font-size: 12px;
            color: black;
            text-decoration: none;
            margin-left: 10px;
        }

        .menuBtn:hover {
            background: #eaf2ff;
            color: #000000;
            border: 1px solid #b7d2ff;
            -moz-border-radius: 5px 5px 5px 5px;
            -webkit-border-radius: 5px 5px 5px 5px;
            border-radius: 5px 5px 5px 5px;
        }

        .mytitle {
            font-size: 12px;
            font-weight: bold;
            padding: 5px;
            margin-bottom: 2px;
            margin-top: 5px;
            text-align: left;
            /*color: #08669f;*/
            font-size: 14px;
        }

    </style>
    <script type="Text/javascript">
        var strfrmName = 'fm0000000090';
        var dataYear = jQuery.parseJSON('[{"Code":"2007","DisplayName":"2007年"},{"Code":"2008","DisplayName":"2008年"},{"Code":"2009","DisplayName":"2009年"},{"Code":"2010","DisplayName":"2010年"},{"Code":"2011","DisplayName":"2011年"},{"Code":"2012","DisplayName":"2012年"},{"Code":"2013","DisplayName":"2013年"},{"Code":"2014","DisplayName":"2014年"},{"Code":"2015","DisplayName":"2015年"},{"Code":"2016","DisplayName":"2016年"},{"Code":"2017","DisplayName":"2017年"},{"Code":"2018","DisplayName":"2018年"},{"Code":"2019","DisplayName":"2019年"},{"Code":"2020","DisplayName":"2020年"},{"Code":"2021","DisplayName":"2021年"},{"Code":"2022","DisplayName":"2022年"},{"Code":"2023","DisplayName":"2023年"},{"Code":"2024","DisplayName":"2024年"},{"Code":"2025","DisplayName":"2025年"},{"Code":"2026","DisplayName":"2026年"}]');
        var dataMonth = jQuery.parseJSON('[{"Code":"1","DisplayName":"1月"},{"Code":"2","DisplayName":"2月"},{"Code":"3","DisplayName":"3月"},{"Code":"4","DisplayName":"4月"},{"Code":"5","DisplayName":"5月"},{"Code":"6","DisplayName":"6月"},{"Code":"7","DisplayName":"7月"},{"Code":"8","DisplayName":"8月"},{"Code":"9","DisplayName":"9月"},{"Code":"10","DisplayName":"10月"},{"Code":"11","DisplayName":"11月"},{"Code":"12","DisplayName":"12月"}]');
        var mydate = new Date();
        var strYear = mydate.getFullYear();
        var strMonth = mydate.getMonth() + 1;
        var strDate = mydate.getDate();
        var strdate = strYear.toString() + "-" + strMonth.toString();

        //整改通知单
        function LoadNotice(date) {
            $.ajax({
                url: '/quality/notice',
                async: false,
                type: 'POST',
                data: { strdate: date, type: 'PROJECT' },
                success: function (data) {
                    $("#divNotice").html('' + data + '');
                }
            });
        }
        //例会纪要
        function LoadSummary(date) {
            $.ajax({
                url: '/quality/meeting-summary',
                async: false,
                type: 'POST',
                data: { strdate: date, type: 'PROJECT' },
                success: function (data) {
                    $("#divSummary").html('' + data + '');

                }
            });
        }
        //施工日志
        function LoadConstruction(date) {
            $.ajax({
                url: '/quality/construction-diary',
                async: false,
                type: 'POST',
                data: { strdate: date, type: 'PROJECT' },
                success: function (data) {
                    $("#divConstruction").html('' + data + '');

                }
            });
        }
        //监理日志
        function LoadSupervisor(date) {
            $.ajax({
                url: '/quality/supervisor-diary',
                async: false,
                type: 'POST',
                data: { strdate: date, type: 'PROJECT' },
                success: function (data) {
                    $("#divSupervisor").html('' + data + '');

                }
            });
        }

        function Loadcombobox() {

            $("#cbbNoticeYear").combobox({
                width: 70,
                data: dataYear,
                valueField: 'Code',
                textField: 'DisplayName',
                //icons: [{
                //    iconCls: 'icon-btn-down'
                //    }],
                onSelect: function (record) {
                    if (CheckNull($('#cbbNoticeMonth').combobox('getValue'))) {
                        var value = record.Code + "-" + $('#cbbNoticeMonth').combobox('getValue');
                        LoadNotice(value);
                    }
                }
            });
            $("#cbbNoticeMonth").combobox({
                width: 60,
                data: dataMonth,
                valueField: 'Code',
                textField: 'DisplayName',
                onSelect: function (record) {
                    if (CheckNull($('#cbbNoticeYear').combobox('getValue'))) {
                        var value = $('#cbbNoticeYear').combobox('getValue') + "-" + record.Code;
                        LoadNotice(value);
                    }
                }
            });
            $("#cbbNoticeYear").combobox('setValue', strYear );
            $("#cbbNoticeMonth").combobox('setValue', strMonth);

            $("#cbbSummaryYear").combobox({
                width: 70,
                data: dataYear,
                valueField: 'Code',
                textField: 'DisplayName',
                onSelect: function (record) {
                    if (CheckNull($('#cbbSummaryMonth').combobox('getValue'))) {
                        var value = record.Code + "-" + $('#cbbSummaryMonth').combobox('getValue');
                        LoadSummary(value);
                    }
                }
            });
            $("#cbbSummaryMonth").combobox({
                width: 60,
                data: dataMonth,
                valueField: 'Code',
                textField: 'DisplayName',
                onSelect: function (record) {
                    if (CheckNull($('#cbbSummaryYear').combobox('getValue'))) {
                        var value = $('#cbbSummaryYear').combobox('getValue') + "-" + record.Code;
                        LoadSummary(value);
                    }
                }
            });
            $("#cbbSummaryYear").combobox('setValue', strYear );
            $("#cbbSummaryMonth").combobox('setValue', strMonth);

            $("#cbbConstructionYear").combobox({
                width: 70,
                data: dataYear,
                valueField: 'Code',
                textField: 'DisplayName',
                onSelect: function (record) {
                    if (CheckNull($('#cbbConstructionMonth').combobox('getValue'))) {
                        var value = record.Code + "-" + $('#cbbConstructionMonth').combobox('getValue');
                        LoadConstruction(value);
                    }
                }
            });

            $("#cbbConstructionMonth").combobox({
                width: 60,
                data: dataMonth,
                valueField: 'Code',
                textField: 'DisplayName',
                onSelect: function (record) {
                    if (CheckNull($('#cbbConstructionYear').combobox('getValue'))) {
                        var value = $('#cbbConstructionYear').combobox('getValue') + "-" + record.Code;
                        LoadConstruction(value);
                    }
                }
            });
            $("#cbbConstructionYear").combobox('setValue', strYear );
            $("#cbbConstructionMonth").combobox('setValue', strMonth);


            $("#cbbSupervisorYear").combobox({
                width: 70,
                data: dataYear,
                valueField: 'Code',
                textField: 'DisplayName',
                onSelect: function (record) {
                    if (CheckNull($('#cbbSupervisorMonth').combobox('getValue'))) {
                        var value = record.Code + "-" + $('#cbbSupervisorMonth').combobox('getValue');
                        LoadSupervisor(value);
                    }
                }
            });

            $("#cbbSupervisorMonth").combobox({
                width: 60,
                data: dataMonth,
                valueField: 'Code',
                textField: 'DisplayName',
                onSelect: function (record) {
                    if (CheckNull($('#cbbSupervisorYear').combobox('getValue'))) {
                        var value = $('#cbbSupervisorYear').combobox('getValue') + "-" + record.Code;
                        LoadSupervisor(value);
                    }
                }
            });
            $("#cbbSupervisorYear").combobox('setValue', strYear );
            $("#cbbSupervisorMonth").combobox('setValue', strMonth);
        }

        function UpLoad(date, status) {
            top.Close = function () {
                top.window.$("#divWin").window('close');
            }
            var strHref = '<iframe id="fmJournalAdd" name="fmJournalAdd" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/BasicData/Journal/Detail?id=' + date + '&status=' + status + '"></iframe>';
            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                closable: true,
                resizable: false,
                width: 850,
                height: 450,
                modal: true,
                title: "附件"
            });
            top.window.$("#divWin").window('center');
        }

        jQuery(function ($) {
            var height = $(window).height();
            $('#divTop').height(height * 0.5-20);
            $('#divBottom').height(height * 0.5-20);
            LoadNotice(strdate);
            LoadSummary(strdate);
            LoadConstruction(strdate);
            LoadSupervisor(strdate);
            Loadcombobox(strdate);
        });
    </script>
</head>
<body style="background-color:#ededed">
<div style=" width: 100%;height:100%;">
    <div id="divTop" style=" width: 100%;">
        <div style="display: inline-block;width: 47%;background-color:white;padding:10px;">
            <div class='mytitle'>整改通知单
                <span style="margin:0 3px;"></span>
                <input id='cbbNoticeYear' type='text' />
                <span style="margin:0 3px;"></span>
                <input id='cbbNoticeMonth' type='text' /></div>
            <div style="font-size: 12px; font-weight: bold; margin-bottom: 10px;  border-bottom: 1px solid #ccc;"></div>
            <div id="divNotice"></div>
        </div>
        <div style="display: inline-block;margin:0 10px;"></div>
        <div style="display: inline-block;width: 47%;background-color:white;padding:10px;"">
        <div class='mytitle'>例会纪要
            <span style="margin:0 3px;"></span>
            <input id='cbbSummaryYear' type='text' />
            <span style="margin:0 3px;"></span>
            <input id='cbbSummaryMonth' type='text' /></div>
        <div style="font-size: 12px; font-weight: bold; margin-bottom: 10px;  border-bottom: 1px solid #ccc;"></div>
        <div id="divSummary"></div>
    </div>
</div>
<div style=" width: 100%; margin: 20px 0;"></div>
<div id="divBottom" style=" width: 100%;">
    <div style="display: inline-block;width: 47%;background-color:white;padding:10px;"">
    <div class='mytitle'>施工日志
        <span style="margin:0 3px;"></span>
        <input id='cbbConstructionYear' type='text' />
        <span style="margin:0 3px;"></span>
        <input id='cbbConstructionMonth' type='text' /></div>
    <div style="font-size: 12px; font-weight: bold; margin-bottom: 10px;  border-bottom: 1px solid #ccc;"></div>
    <div id="divConstruction"></div>
</div>
<div style="display: inline-block;margin:0 10px;"></div>
<div style="display: inline-block;width: 47%;background-color:white;padding:10px;"">
<div class='mytitle'>监理日志<span style="margin:0 3px;"></span>
    <input id='cbbSupervisorYear' type='text' />
    <span style="margin:0 3px;"></span>
    <input id='cbbSupervisorMonth' type='text' /></div>
<div style="font-size: 12px; font-weight: bold; margin-bottom: 10px;  border-bottom: 1px solid #ccc;"></div>
<div id="divSupervisor"></div>
</div>
</div>
</div>
</body>
</html>
