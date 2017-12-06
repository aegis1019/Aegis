<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>概算预算</title>
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
            height: 35px;
        }

        .flag {
            color: red;
            font-size: 14px;
            vertical-align: middle;
        }
    </style>
    <script type="Text/javascript">

        var DesignAlterationJson = ${BudgetJson};
        // 退出
        function Exit() {
            top.window.$("#divWin").window('close');
        }

        // 初始化
        jQuery(function ($) {           
            $("#btnClose").bind("click", function () { Exit(); });
            GNAMESPACE.Common.SetFormData(DesignAlterationJson);
        });
    </script>
</head>
<body class="FormBody2">
    <div class="BtnArea">
        <div id="divBtns" style="text-align: right;">
            <a id="btnClose" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-inside-exit',iconAlign:'left'">关闭</a>
        </div>
    </div>
    <div>            
        <div class="e-row">
            <div class="e-col4 FieldTitle">项目名称：</div>
            <div class="e-col4 Field">

                <label id="lbProjectName">&nbsp;</label>
            </div>
        </div>
        <div class="e-row">
            <div class="e-col4 FieldTitle">费用类别：</div>
            <div class="e-col4 Field">

                <label id="lbFeeName">&nbsp;</label>
            </div>
        </div>        
        <div class="e-row">
            <div class="e-col4 FieldTitle">概算金额：</div>
            <div class="e-col4 Field">
                <label id="lbEstimate">&nbsp;</label>
            </div>
        </div>
        <div class="e-row">
            <div class="e-col4 FieldTitle">预算金额：</div>
            <div class="e-col4 Field">
                <label id="lbBudget">&nbsp;</label>
            </div>
        </div>      
        <div class="e-row">
            <div class="e-col4 FieldTitle">备注：</div>
            <div class="e-col4 Field">

                <label id="lbRemark">&nbsp;</label>
            </div>
        </div>
    </div>
</body>
</html>
