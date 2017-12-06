<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
	<title>详细 整改通知单</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="../../Scripts/EasyUI/jquery-easyui-1.5.1/themes/bootstrap/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../Scripts/EasyUI/jquery-easyui-1.5.1/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="../../css/Comm1.0.1.css" />
	<link rel="stylesheet" type="text/css" href="../../css/grid.css" />
	<link rel="stylesheet" type="text/css" href="../../css/InsidePage.css" />
    <script type="text/javascript" src="../../Scripts/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../../ViewsJS/comm/Const.js"></script>
    <script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Scripts/FW/Verify.js"></script>
    <script type="text/javascript" src="../../Scripts/Common/json2.js"></script>
    <script type="text/javascript" src="../../Scripts/Common/Com.LS.Common.1.0.js"></script>
    <style type="Text/css">
        .e-row .e-col1d5, .e-row .e-col2d5 {
            margin-top: 0px;
        }

        .e-row {
            height: 40px;
        }

        .flag {
            color: red;
            font-size: 14px;
            vertical-align: middle;
        }
    </style>
    <script type="Text/javascript">
        
        var RectificationJson = ${RectificationJson};
        // 退出
        function Exit() {
            top.window.$("#divWin").window('close');
        }

        // 初始化
        jQuery(function ($) {
            $("#cbbProjectID").combobox({
                url: '/project/project-list/get-all-for-list',
                valueField: 'Code',
                textField: 'Name'
            });

            $("#btnClose").bind("click", function () { Exit(); });
            GNAMESPACE.Common.SetFormData(RectificationJson);
        });
    </script>
</head>
<body class="FormBody2">
    <div class="BtnArea">
        <div id="divBtns" style="text-align: right;">
            <a id="btnClose" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-inside-exit',iconAlign:'left'">关闭</a>
        </div>
    </div>
    <div id="divInputArea">
        <div class="e-row">
            <div class="e-col3 FieldTitle"><span class="flag">*</span>项目名称：</div>
            <div class="e-col4 Field">
                <input id="cbbProjectID" disabled="disabled" class="Field1" type="text" />
            </div>
        </div>
         <div class="e-row">
            <div class="e-col3 FieldTitle"><span class="flag">*</span>单号：</div>
            <div class="e-col4 Field">
                <input id="tbRectificationNo" disabled="disabled"  class="Field1" type="text" />
            </div>
        </div>
        <div class="e-row">
            <div class="e-col3 FieldTitle"><span class="flag">*</span>概述：</div>
            <div class="e-col4 Field">
                <textarea class="Field1" disabled="disabled"  id="tbSummary" style="width:185px;"></textarea>
            </div>
        </div>
        <div class="e-row">
            <div class="e-col3 FieldTitle"><span class="flag">*</span>反馈时间：</div>
            <div class="e-col4 Field">
                <span class="WdatePicker">
                    <input id="tbFeedbackTime" disabled="disabled"  class="Field1" type="text" />
                    <img alt="" onclick="WdatePicker({el:'tbFeedbackTime',dateFmt:'yyyyMMdd',startDate:'%y%M%d'})" align="absmiddle" src="../../images/Button/datePicker.gif" style="cursor: pointer" />
                </span>
            </div>
        </div>
        <div class="e-row">
            <div class="e-col3 FieldTitle"><span class="flag">*</span>处理情况：</div>
            <div class="e-col4 Field">
                <textarea class="Field1" disabled="disabled"  id="tbSituation" style="width:185px;"></textarea>
            </div>
        </div>
    </div>
</body>
</html>
