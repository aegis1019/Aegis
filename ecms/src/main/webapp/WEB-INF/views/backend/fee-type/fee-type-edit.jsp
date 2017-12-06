<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改 费用分类</title>
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
    <script>
        var FeeTypeJson = ${FeeTypeJson};
        // 数据校验
        function CheckData() {          
            if ($.trim($('#tbName').val()) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "费用名称不能为空！", 'info');
                return false;
            }          

            if ($.trim($('#tbSort').val()) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "排序不能为空！", 'info');
                return false;
            }
            if (isNaN($.trim($('#tbSort').val()))) {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "排序值必须为数字！", 'info');
                return false;
            }
            return true;
        };

        // 构造json对象
        function GetFormData() {
            var objFormData = GNAMESPACE.Common.GetFormData();
            objFormData.FeeTypeID = '${FeeTypeID}';
            objFormData.ParentID = '${ParentID}';
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
                url: '/fee/SaveForEdit',
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
            GNAMESPACE.Common.SetFormData(FeeTypeJson);
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
    <div id="divInputArea">

        <div class="e-row">
            <div class="e-col3 FieldTitle"><span class="flag">*</span>费用名称：</div>
            <div class="e-col4 Field">
                <input id="tbName" class="Field1" type="text" />
            </div>
        </div>
        <div class="e-row">
            <div class="e-col3 FieldTitle"><span class="flag">*</span>排序：</div>
            <div class="e-col4 Field">
                <input id="tbSort" class="Field1" type="text" />
            </div>
        </div>
        <div class="e-row">
            <div class="e-col3 FieldTitle">备注：</div>
            <div class="e-col4 Field">
                <input id="tbRemark" class="Field1" type="text" />
            </div>
        </div>
    </div>
</body>
</html>
