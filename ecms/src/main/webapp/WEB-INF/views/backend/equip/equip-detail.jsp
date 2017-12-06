<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>设备</title>
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
        
        var EquipmentJson = {"EquipmentID":"1000000001","ProjectID":"","EquipmentName":"挖掘机","EquipmentNumber":"10","ActualNumber":"7","CurrentTime":"2017-11-25","InputterID":"0000000012","InputterOfOrgID":"0000000007","InputterName":"管理员","InputDate":"2017-10-13 14:09:28Z","ModifierID":"0000000012","ModifierOfOrgID":"0000000007","ModifierName":"管理员","ModifyDate":"2017-10-24 14:03:07Z","Remark":"挖掘机","DelTag":"1","BeginRecordNumber":0,"EndRecordNumber":0,"Search":"","OrderByExpr":"","Status":null,"limit":0,"start":0,"page":0,"SearchString":"","q":null};
      
        // 退出
        function Exit() {
            top.window.$("#divWin").window('close');
        }

        // 初始化
        jQuery(function ($) {           
            $("#btnClose").bind("click", function () { Exit(); });
            GNAMESPACE.Common.SetFormData(EquipmentJson);
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

                <label id="lbProjectID">&nbsp;</label>
            </div>
        </div>
        <div class="e-row">
            <div class="e-col3 FieldTitle"><span class="flag">*</span>设备名称：</div>
            <div class="e-col4 Field">
                <label id="lbEquipmentName">&nbsp;</label>
            </div>
        </div>
        <div class="e-row">
            <div class="e-col3 FieldTitle"><span class="flag">*</span>计划数量：</div>
            <div class="e-col4 Field">

                <label id="lbEquipmentNumber">&nbsp;</label>
            </div>
        </div>
        <div class="e-row">
            <div class="e-col3 FieldTitle"><span class="flag">*</span>时间：</div>
            <div class="e-col4 Field">

                <label id="lbCurrentTime">&nbsp;</label>
            </div>
        </div>
        <div class="e-row">
            <div class="e-col3 FieldTitle">备注：</div>
            <div class="e-col4 Field">

                <label id="lbRemark">&nbsp;</label>
            </div>
        </div>
    </div>
</body>
</html>
