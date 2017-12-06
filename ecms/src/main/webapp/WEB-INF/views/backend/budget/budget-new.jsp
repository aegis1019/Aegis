<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>新增 概算预算</title>
	
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

        .flag {
            color: red;
            font-size: 14px;
            vertical-align: middle;
        }
    </style>
    <script type="Text/javascript">

        // 数据校验
        function CheckData() {
         
            if ($.trim($('#cbbProjectID').combobox('getValue')) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "'项目名称'不能为空！", 'info');
                return false;
            }           
            var FeeType = $.trim($('#tbFeeType').val());
            if (FeeType == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "'费用类别'不能为空！", 'info');
                return false;
            }

            var Estimate = $.trim($('#tbEstimate').val());
            if (Estimate == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "'概算金额'不能为空！", 'info');
                return false;
            }
            else if (isNaN(Estimate)) {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "'概算金额'格式错误,请输入数字！", 'info');
                return false;
            }
            if ($.trim($('#tbBudget').val()) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "'预算金额'不能为空！", 'info');
                return false;
            }
            else if (isNaN($.trim($('#tbBudget').val()))) {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "'预算金额'格式错误,请输入数字！", 'info');
                return false;
            }          
            return true;
        };

        // 构造json对象
        function GetFormData() {
            var objFormData = GNAMESPACE.Common.GetFormData();
            return objFormData;
        };

        // 保存数据
        function Save() {
            //// 数据校验
            if (!CheckData()) {
                return;
            }
            // 构造json对象
            var objFormData = GetFormData();
            $.messager.progress({ title: GNAMESPACE.Common.ProgressMsgTitle, msg: '正在保存数据。' });
            $.ajax({
                type: "POST",
                url: '/budget-mgr/SaveForAdd',
                contentType: "application/json",
                data: JSON.stringify(objFormData),
                error: function (XMLHttpRequest) {
                    $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, XMLHttpRequest.statusText, 'error');
                    $.messager.progress('close');
                },
                success: function (RtnObj) {
                    $.messager.progress('close');
                    $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, RtnObj.Message, 'info', function () {
                        if (!RtnObj.IsSucess) {
                            return;
                        }
                        top.Close();
                    });
                }
            });

        }
        // 退出
        function Exit() {
            top.window.$("#divWin").window('close');
        }

        // 初始化
        jQuery(function ($) {
            $("#btnSave").bind("click", function () { Save(); });
            $("#btnClose").bind("click", function () { Exit(); });
            $("#tbFeeType").combotree({
                url: "/fee/get-all-for-list",
                valueField: 'id',
                textField: 'text',
                cascadeCheck: true,
                panelHeight: '178px',
                panelWidth: '180px'
            });
            $("#cbbProjectID").combobox({
                url: '/project/project-list/get-all-for-list',
                valueField: 'ProjectID',
                textField: 'Name'
            });
        });
    </script>
</head>
<body class="FormBody2">
    <div class="BtnArea">
        <div id="divBtns" style="text-align: right;">
            <a id="btnSave" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-inside-save',iconAlign:'left'">保存</a>
            <a id="btnClose" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-inside-exit',iconAlign:'left'">关闭</a>
        </div>
    </div>
    <div>      
        <div class="e-row">
            <div class="e-col4 FieldTitle"><span class="flag">*</span>项目名称：</div>
            <div class="e-col4 Field">
                <input id="cbbProjectID" class="Field" style="width: 150px;"/>
            </div>
        </div>      
        <div class="e-row">
            <div class="e-col4 FieldTitle"><span class="flag">*</span>费用类别：</div>
            <div class="e-col4 Field">
                <input id="tbFeeType" class="Field" type="text" />
            </div>
        </div>      
        <div class="e-row">
            <div class="e-col4 FieldTitle"><span class="flag">*</span>概算金额：</div>
            <div class="e-col4 Field">
                <input id="tbEstimate" class="Field easyui-validatebox" data-options="validType:'money'" />
            </div>
        </div>
        <div class="e-row">
            <div class="e-col4 FieldTitle"><span class="flag">*</span>预算金额：</div>
            <div class="e-col4 Field">
                <input id="tbBudget" class="Field easyui-validatebox" data-options="validType:'money'" />
            </div>
        </div>      
        <div class="e-row">
            <div class="e-col4 FieldTitle">备注：</div>
            <div class="e-col4 Field">
                <input id="tbRemark" class="Field" type="text" />
            </div>
        </div>
    </div>
</body>
</html>
