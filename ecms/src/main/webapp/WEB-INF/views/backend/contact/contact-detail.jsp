<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>项目联系人</title>
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
        var LinkManJson = ${LinkManJson};
         
        // 退出
        function Exit() {
            top.window.$("#divWin").window('close');
        }

        // 初始化
        jQuery(function ($) {
                    
            $("#btnClose").bind("click", function () { Exit(); });
            GNAMESPACE.Common.SetFormData(LinkManJson);
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
            <div class="e-col4 FieldTitle"><span class="flag">*</span>项目名称：</div>
            <div class="e-col6 Field">
                <label id="lbProjectCode" class="Field1" />
            </div>
        </div>
        <div class="e-row">
            <div class="e-col4 FieldTitle"><span class="flag">*</span>姓名：</div>
            <div class="e-col6 Field">
                <label id="lbName" class="Field1" />
            </div>
        </div>
        <div class="e-row">
            <div class="e-col4 FieldTitle"><span class="flag">*</span>职位：</div>
            <div class="e-col6 Field">
                <label id="lbPosition" class="Field1" />
            </div>
        </div>
       <div class="e-row">
            <div class="e-col4 FieldTitle"><span class="flag">*</span>职级：</div>
            <div class="e-col6 Field">
                <label id="lbRank">
                   
                </label>
            </div>
        </div>
        <div class="e-row">
            <div class="e-col4 FieldTitle"><span class="flag">*</span>电话：</div>
            <div class="e-col6 Field">
                <label id="lbTel" class="Field1" />
            </div>
        </div>
         <div class="e-row">
            <div class="e-col4 FieldTitle"><span class="flag">*</span>邮箱：</div>
            <div class="e-col6 Field">
                <label id="lbEmail" class="Field1" />
            </div>
        </div>
        <div class="e-row">
            <div class="e-col4 FieldTitle">备注：</div>
            <div class="e-col6 Field">
                <label id="lbRemark" class="Field1" />
            </div>
        </div>
    </div>
</body>
</html>
