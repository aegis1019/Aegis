<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新增 项目信息</title>
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

        // 数据校验
        function CheckData() {

            if ($.trim($('#cbbProjectID').combobox('getValue')) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "项目名称不能为空！", 'info');
                return false;
            }

            if ($.trim($('#cbbStageProjectID').combobox('getValue')) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "阶段工程不能为空！", 'info');
                return false;
            }
            if (isNaN($.trim($('#tbCompleRate').val()))) {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "'完成率'格式错误,请输入数字！", 'info');
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
                url: '/project-progress/SaveForAdd',
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

            $("#cbbProjectID").combobox({
                url: '/project/project-list/get-all-for-list',
                valueField: 'ProjectID',
                textField: 'Name'
            });

            $("#cbbStageProjectID").combobox({
                url: '/project-phase/get-all-for-list',
                valueField: 'StageProjectID',
                textField: 'Name',
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
<div id="divInputArea">
    <div class="e-row">
        <div class="e-col3 FieldTitle"><span class="flag">*</span>项目名称：</div>
        <div class="e-col4 Field">
            <select id="cbbProjectID" class="Field easyui-combobox" style="width: 153px;" >
            </select>
        </div>
    </div>
    <div class="e-row">
        <div class="e-col3 FieldTitle"><span class="flag">*</span>阶段工程：</div>
        <div class="e-col4 Field">
            <select id="cbbStageProjectID" class="Field easyui-combobox" style="width: 153px;" >
            </select>
        </div>
    </div>
    <div class="e-row">
        <div class="e-col3 FieldTitle">子构建：</div>
        <div class="e-col4 Field">
            <input id="tbChildStructure" class="Field1" type="text" style="width: 153px;" />
        </div>
    </div>
    <div class="e-row">
        <div class="e-col3 FieldTitle">计划开工日期：</div>
        <div class="e-col4 Field">
                <span class="WdatePicker">
                    <input id="tbPlanStart" class="Field1" style="width: 153px;" type="text" />
                    <img alt="" onclick="WdatePicker({el:'tbPlanStart',dateFmt:'yyyyMMdd',startDate:'%y%M%d'})" align="absmiddle" src="../../images/Button/datePicker.gif" style="cursor: pointer" />
                </span>
        </div>
    </div>
    <div class="e-row">
        <div class="e-col3 FieldTitle">计划竣工日期：</div>
        <div class="e-col4 Field">
                <span class="WdatePicker">
                    <input id="tbPlanComplete" class="Field1" style="width: 153px;" type="text" />
                    <img alt="" onclick="WdatePicker({el:'tbPlanComplete',dateFmt:'yyyyMMdd',startDate:'%y%M%d'})" align="absmiddle" src="../../images/Button/datePicker.gif" style="cursor: pointer" />
                </span>
        </div>
    </div>
    <div class="e-row">
        <div class="e-col3 FieldTitle">实际开工日期：</div>
        <div class="e-col4 Field">
                <span class="WdatePicker">
                    <input id="tbActualStart" class="Field1" style="width: 153px;" type="text" />
                    <img alt="" onclick="WdatePicker({el:'tbActualStart',dateFmt:'yyyyMMdd',startDate:'%y%M%d'})" align="absmiddle" src="../../images/Button/datePicker.gif" style="cursor: pointer" />
                </span>
        </div>
    </div>
    <div class="e-row">
        <div class="e-col3 FieldTitle">计划竣工日期：</div>
        <div class="e-col4 Field">
                <span class="WdatePicker">
                    <input id="tbActualComplete" class="Field1" style="width: 153px;" type="text" />
                    <img alt="" onclick="WdatePicker({el:'tbActualComplete',dateFmt:'yyyyMMdd',startDate:'%y%M%d'})" align="absmiddle" src="../../images/Button/datePicker.gif" style="cursor: pointer" />
                </span>
        </div>
    </div>
    <div class="e-row">
        <div class="e-col3 FieldTitle">完成情况：</div>
        <div class="e-col4 Field">
            <input id="tbCompletion" class="Field1" type="text" style="width: 153px;" />
        </div>
    </div>
    <div class="e-row">
        <div class="e-col3 FieldTitle">完成率%：</div>
        <div class="e-col4 Field">
            <input id="tbCompleRate" class="Field1 easyui-validatebox" data-options="validType:'mone'" style="width: 153px;" />
        </div>
    </div>
    <div class="e-row">
        <div class="e-col3 FieldTitle">备注：</div>
        <div class="e-col4 Field">
            <input id="tbRemark" class="Field1" type="text" style="width: 153px;" />
        </div>
    </div>
</div>
</body>
</html>
