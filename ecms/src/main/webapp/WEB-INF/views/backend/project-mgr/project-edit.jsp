<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>修改 项目信息</title>
	
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
        .flag {
            color: red;
            font-size: 14px;
            vertical-align: middle;
        }
    </style>
    <script type="Text/javascript">

        var ProjectJson = ${ProjectJson};
        // 数据校验
        function CheckData() {

            //中文名称
            var str =$.trim($('#tbName').val());
            if (str == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "项目名称不能为空！", 'info');
                return false;
            }

            if ($.trim($('#tbAbbreviation').val()) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "项目简称不能为空！", 'info');
                return false;
            }
            if ($.trim($('#tbAbbreviation').val()).length>10) {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "项目简称长度不能大于10！", 'info');
                return false;
            }
            if ($.trim($('#tbCode').val()) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "项目代码不能为空！", 'info');
                return false;
            }

            if ($.trim($('#tbConstructor').val()) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "建设单位不能为空！", 'info');
                return false;
            }

            if ($.trim($('#tbLocation').val()) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "建筑地点不能为空！", 'info');
                return false;
            }

            if ($.trim($('#tbScale').val()) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "规模及概况不能为空！", 'info');
                return false;
            }

            if ($.trim($('#tbConsist').val()) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "项目组成不能为空！", 'info');
                return false;
            }

            if ($.trim($('#tbPlanStart').val()) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "计划开工日期不能为空！", 'info');
                return false;
            }

            if ($.trim($('#tbPlanComplete').val()) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "计划竣工日期不能为空！", 'info');
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
            objFormData.ProjectID = ProjectJson.ProjectID;
            $.messager.progress({ title: GNAMESPACE.Common.ProgressMsgTitle, msg: '正在保存数据。' });
            $.ajax({
                type: "POST",
                url: '/project/SaveForEdit',
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
            $("#tbName").change(function (val) {
                if ($.trim($('#tbAbbreviation').val()) == "") {
                    var Name = $("#tbName").val();
                    if (Name.length < 11) {
                        $("#tbAbbreviation").val(Name);
                    }                    
                }               
            });
            GNAMESPACE.Common.SetFormData(ProjectJson);
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
    <div id="divInputArea" >
       <table style="width: 98%">
            <tr>
                <td class="e-col3 FieldTitle"><span class="flag">*</span>项目名称：</td>
                <td class="e-col4 Field">
                    <input id="tbName" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle"><span class="flag">*</span>项目简称：</td>
                <td class="e-col4 Field">
                    <input id="tbAbbreviation" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle"><span class="flag">*</span>项目代码：</td>
                <td class="e-col4 Field">
                    <input id="tbCode" class="Field1" type="text" style="width: 153px;" />
                </td>
            </tr>
            <tr>
                <td class="e-col3 FieldTitle"><span class="flag">*</span>建筑地点：</td>
                <td class="e-col4 Field">
                    <input id="tbLocation" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle"><span class="flag">*</span>项目组成：</td>
                <td class="e-col4 Field">
                    <input id="tbConsist" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">完成率%：</td>
                <td class="e-col4 Field">
                    <input id="tbCompleRate" class="Field1 easyui-validatebox" data-options="validType:'mone'" style="width: 153px;" />
                </td>
            </tr>
             <tr>
                <td class="e-col3 FieldTitle">占地面积：</td>
                <td class="e-col4 Field">
                    <input id="tbCoversArea" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">建筑面积：</td>
                <td class="e-col4 Field">
                    <input id="tbBuildArea" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">地上面积：</td>
                <td class="e-col4 Field">
                    <input id="tbAboveArea" class="Field1" type="text" style="width: 153px;"  />
                </td>
            </tr>
             <tr>
                <td class="e-col3 FieldTitle">地下面积：</td>
                <td class="e-col4 Field">
                    <input id="tbUnderArea" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">总层高：</td>
                <td class="e-col4 Field">
                    <input id="tbTotalFloor" class="Field1" type="text" style="width: 153px;" />
                </td>
              <td class="e-col3 FieldTitle"><span class="flag">*</span>规模及概况：</td>
            <td class="e-col4 Field">
                <input id="tbScale" class="Field1" type="text" style="width: 153px;" />
            </td>
            </tr>
            <tr>
                <td class="e-col3 FieldTitle">建设单位：</td>
                <td class="e-col4 Field">
                    <input id="tbConstructor" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">总指挥：</td>
                <td class="e-col4 Field">
                    <input id="tbConstructorPerson" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">联系电话：</td>
                <td class="e-col4 Field">
                    <input id="tbConstructorTel" class="Field1" type="text" style="width: 153px;" />
                </td>
            </tr>
            <tr>
                <td class="e-col3 FieldTitle">监理单位：</td>
                <td class="e-col4 Field">
                    <input id="tbSupervision" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">总指挥：</td>
                <td class="e-col4 Field">
                    <input id="tbSupervisionPerson" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">联系电话：</td>
                <td class="e-col4 Field">
                    <input id="tbSupervisionTel" class="Field1" type="text" style="width: 153px;" />
                </td>
            </tr>
             <tr>
                <td class="e-col3 FieldTitle">总包单位：</td>
                <td class="e-col4 Field">
                    <input id="tbContract" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">总指挥：</td>
                <td class="e-col4 Field">
                    <input id="tbContractPerson" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">联系电话：</td>
                <td class="e-col4 Field">
                    <input id="tbContractTel" class="Field1" type="text" style="width: 153px;" />
                </td>
            </tr>
             <tr>
                <td class="e-col3 FieldTitle">设计院：</td>
                <td class="e-col4 Field">
                    <input id="tbDesign" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">总指挥：</td>
                <td class="e-col4 Field">
                    <input id="tbDesignPerson" class="Field1" type="text" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">联系电话：</td>
                <td class="e-col4 Field">
                    <input id="tbDesignTel" class="Field1" type="text" style="width: 153px;" />
                </td>
            </tr>
            <tr>
                 <td class="e-col3 FieldTitle"><span class="flag">*</span>计划开工日期：</td>
            <td class="e-col4 Field">
                <span class="WdatePicker">
                    <input id="tbPlanStart" class="Field1" style="width: 153px;" type="text" />
                    <img alt="" onclick="WdatePicker({el:'tbPlanStart',dateFmt:'yyyyMMdd',startDate:'%y%M%d'})" align="absmiddle" src="../../images/Button/datePicker.gif" style="cursor: pointer" />
                </span>
            </td>
                 <td class="e-col3 FieldTitle"><span class="flag">*</span>计划竣工日期：</td>
            <td class="e-col4 Field">
                <span class="WdatePicker">
                    <input id="tbPlanComplete" class="Field1" style="width: 153px;" type="text" />
                    <img alt="" onclick="WdatePicker({el:'tbPlanComplete',dateFmt:'yyyyMMdd',startDate:'%y%M%d'})" align="absmiddle" src="../../images/Button/datePicker.gif" style="cursor: pointer" />
                </span>
            </td>           
              <td class="e-col3 FieldTitle">备注：</td>
            <td class="e-col4 Field">
                <input id="tbRemark" class="Field1" type="text" style="width: 153px;" />
            </td>
            </tr>
           <tr>
                 <td class="e-col3 FieldTitle" style="color:red">提示：</td>
                <td colspan="5" style="color:red">"项目简称"长度不能大于10.</td>
            </tr>
        </table>
    </div>
</body>
</html>
