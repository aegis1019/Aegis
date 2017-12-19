<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>	新增 现场</title>
    <link rel="stylesheet" type="text/css" href="../../Scripts/EasyUI/jquery-easyui-1.5.1/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Scripts/EasyUI/jquery-easyui-1.5.1/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Comm1.0.1.css" />
    <link rel="stylesheet" type="text/css" href="../../css/grid.css" />
    <link rel="stylesheet" type="text/css" href="../../css/InsidePage.css" />
    <script type="text/javascript" src="../../Scripts/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../../ViewsJS/comm/Const.js"></script>
    <script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/locale/easyui-lang-zh_TW.js"></script>
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

            //中文名称
            var str = $.trim($('#cbbProjectID').combobox("getValue"));
            if (str == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "项目名称不能为空！", 'info');
                return false;
            }

            if ($.trim($('#tbCurrentTime').val()) == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "时间不能为空！", 'info');
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
            $('#dgSup').datagrid('acceptChanges');
            $('#dgOwner').datagrid('acceptChanges');
            var rowSup = $('#dgSup').datagrid('getData').rows;
            var rowOwner = $('#dgOwner').datagrid('getData').rows;
            objFormData.Sup = rowSup;
            objFormData.Owner = rowOwner;
            $.messager.progress({ title: GNAMESPACE.Common.ProgressMsgTitle, msg: '正在保存数据。' });
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: '/scene/site/SaveForAdd',
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

        function Attach(strID) {
            var strHref = '<iframe id="fmInspectInfoDetail" name="fmInspectInfoDetail" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/BasicData/Journal/Attachment?id=' + strID + '&type=Inspect&frmName=' + strfrmName + '"></iframe>';
            var topCenter = $("#mywin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                closable: true,
                resizable: false,
                width: 650,
                height: 410,
                modal: true,
                title: "附件"
            });
            $("#mywin").window('center');
        }

        function SupAdd() {
            $.ajax({
                type: "POST",
                url: '/scene/site/GetAttachID',
                error: function (XMLHttpRequest) {
                    $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, XMLHttpRequest.statusText, 'error');

                },
                success: function (RtnObj) {
                    $('#dgSup').datagrid('appendRow', { AttachID: RtnObj.ReturnPKID });
                    var editIndex = $('#dgSup').datagrid('getRows').length - 1;
                    $('#dgSup').datagrid('selectRow', editIndex)
                            .datagrid('beginEdit', editIndex);
                }
            });
        }

        function SupDelete() {
            var row = $('#dgSup').datagrid('getSelected');
            if (row) {
                var editIndex = $('#dgSup').datagrid('getRowIndex', $('#dgSup').datagrid('getSelected'));
                $('#dgSup').datagrid('cancelEdit', editIndex)
                        .datagrid('deleteRow', editIndex);
            }
        }

        function SupAttach() {
            var objSelectedRow = $('#dgSup').datagrid("getSelected");
            if (objSelectedRow == null) {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "没有选择数据！", 'info');
                return;
            }
            Attach(objSelectedRow.AttachID);
        }

        function OwnerAdd() {
            $.ajax({
                type: "POST",
                url: '/scene/site/GetAttachID',
                error: function (XMLHttpRequest) {
                    $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, XMLHttpRequest.statusText, 'error');

                },
                success: function (RtnObj) {
                    $('#dgOwner').datagrid('appendRow', { AttachID: RtnObj.ReturnPKID });
                    var editIndex = $('#dgOwner').datagrid('getRows').length - 1;
                    $('#dgOwner').datagrid('selectRow', editIndex)
                            .datagrid('beginEdit', editIndex);
                }
            });

        }

        function OwnerDelete() {
            var row = $('#dgOwner').datagrid('getSelected');
            if (row) {
                var editIndex = $('#dgOwner').datagrid('getRowIndex', $('#dgOwner').datagrid('getSelected'));
                $('#dgOwner').datagrid('cancelEdit', editIndex)
                        .datagrid('deleteRow', editIndex);
            }
        }

        function OwnerAttach() {
            var objSelectedRow = $('#dgOwner').datagrid("getSelected");
            if (objSelectedRow == null) {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "没有选择数据！", 'info');
                return;
            }
            Attach(objSelectedRow.AttachID);
        }

        function DefGrid() {
            $('#dgSup').datagrid({
                fit: true,
                idField: 'InspectID',
                title: '监理巡检情况',
                rownumbers: true,
                fitColumns: true,
                singleSelect: true,
                columns: [
                    [
                        { field: 'InspectID', checkbox: true },
                        { field: 'PatrolTime', title: '时间', width: 80, align: 'left', halign: 'center', editor: { type: 'timespinner' } },
                        { field: 'Situation', title: '情况', width: 280, align: 'left', halign: 'center', editor: { type: 'textbox' } }
                    ]
                ],
                toolbar: '#tbSup'
            });
            $('#dgOwner').datagrid({
                fit: true,
                idField: 'InspectID',
                title: '业主巡检情况',
                rownumbers: true,
                fitColumns: true,
                singleSelect: true,
                columns: [
                    [
                        { field: 'InspectID', checkbox: true },
                        { field: 'PatrolTime', title: '时间', width: 80, align: 'left', halign: 'center', editor: { type: 'timespinner' } },
                        { field: 'Situation', title: '情况', width: 280, align: 'left', halign: 'center', editor: { type: 'textbox' } }
                    ]
                ],
                toolbar: '#tbOwner'
            });
        }

        // 初始化
        jQuery(function ($) {
            $("#cbbProjectID").combobox({
                url: '/project/project-list/get-all-for-list',
                valueField: 'Code',
                textField: 'Name'
            });

            $("#btnSave").bind("click", function () { Save(); });
            $("#btnClose").bind("click", function () { Exit(); });
            $("#btnSupAdd").bind("click", function () { SupAdd(); });
            $("#btnSupDelete").bind("click", function () { SupDelete(); });
            $("#btnSupAttach").bind("click", function () { SupAttach(); });
            $("#btnOwnerAdd").bind("click", function () { OwnerAdd(); });
            $("#btnOwnerDelete").bind("click", function () { OwnerDelete(); });
            $("#btnOwnerAttach").bind("click", function () { OwnerAttach(); });
            DefGrid();
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
    <div class="easyui-tabs" style="width: 100%; height: 100%;">
        <div title="今日值班">
            <div class="e-row">
                <div class="e-col2 FieldTitle"><span class="flag">*</span>项目名称：</div>
                <div class="e-col4 Field">
                    <input id="cbbProjectID" class="Field1" type="text" />
                </div>
                <div class="e-col2 FieldTitle">时间：</div>
                <div class="e-col4 Field">
                        <span class="WdatePicker">
                            <input id="tbCurrentTime" class="Field1" type="text" />
                            <img alt="" onclick="WdatePicker({el:'tbCurrentTime',dateFmt:'yyyyMMdd',startDate:'%y%M%d'})" align="absmiddle" src="../../images/Button/datePicker.gif" style="cursor: pointer" />
                        </span>
                </div>
            </div>
            <div class="e-row">
                <div class="e-col2 FieldTitle">业主单位：</div>
                <div class="e-col4 Field">
                    <input id="tbOwnerCompany" class="Field1" type="text" />
                </div>
                <div class="e-col2 FieldTitle">业主姓名：</div>
                <div class="e-col4 Field">
                    <input id="tbOwnerName" class="Field1" type="text" />
                </div>
            </div>
            <div class="e-row">
                <div class="e-col2 FieldTitle">业主电话：</div>
                <div class="e-col4 Field">
                    <input id="tbOwnerPhone" class="Field1" type="text" />
                </div>
            </div>
            <div class="e-row">
                <div class="e-col2 FieldTitle">施工单位：</div>
                <div class="e-col4 Field">
                    <input id="tbConCompany" class="Field1" type="text" />
                </div>
                <div class="e-col2 FieldTitle">施工姓名：</div>
                <div class="e-col4 Field">
                    <input id="tbConName" class="Field1" type="text" />
                </div>
            </div>
            <div class="e-row">
                <div class="e-col2 FieldTitle">施工电话：</div>
                <div class="e-col4 Field">
                    <input id="tbConPhone" class="Field1" type="text" />
                </div>
            </div>
            <div class="e-row">
                <div class="e-col2 FieldTitle">监理单位：</div>
                <div class="e-col4 Field">
                    <input id="tbSupCompany" class="Field1" type="text" />
                </div>
                <div class="e-col2 FieldTitle">监理姓名：</div>
                <div class="e-col4 Field">
                    <input id="tbSupName" class="Field1" type="text" />
                </div>
            </div>
            <div class="e-row">
                <div class="e-col2 FieldTitle">监理电话：</div>
                <div class="e-col4 Field">
                    <input id="tbSupPhone" class="Field1" type="text" />
                </div>
            </div>
        </div>
        <div title="今日动态">
            <div class="e-row" style="width: 100%; height: 110px;">
                <div class="e-col2 FieldTitle">今日动态：</div>
                <div class="e-col9 Field">
                    <textarea class="Field1" id="tbToDayDynamic" style="width: 100%; height: 100px;"></textarea>
                </div>
            </div>
            <div class="e-row" style="width: 100%; height: 110px;">
                <div class="e-col2 FieldTitle">施工任务：</div>
                <div class="e-col9 Field">
                    <textarea class="Field1" id="tbConDynamic" style="width: 100%; height: 100px;"></textarea>
                </div>
            </div>
            <div class="e-row" style="width: 100%; height: 110px;">
                <div class="e-col2 FieldTitle">监理任务：</div>
                <div class="e-col9 Field">
                    <textarea class="Field1" id="tbSupDynamic" style="width: 100%; height: 100px;"></textarea>
                </div>
            </div>
        </div>
        <div title="巡检情况">
            <div style="height: 50%;">
                <div id="dgSup"></div>
            </div>
            <div style="height: 50%;">
                <div id="dgOwner"></div>
            </div>
            <div id="tbSup">
                <a id="btnSupAdd" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-add'">新增</a>
                <span class="SplitLine"></span>
                <a id="btnSupDelete" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-delete'">删除</a>
                <span class="SplitLine"></span>
                <a id="btnSupAttach" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-atta'">附件</a>
                <span class="SplitLine"></span>
            </div>
            <div id="tbOwner">
                <a id="btnOwnerAdd" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-add'">新增</a>
                <span class="SplitLine"></span>
                <a id="btnOwnerDelete" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-delete'">删除</a>
                <span class="SplitLine"></span>
                <a id="btnOwnerAttach" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-atta'">附件</a>
                <span class="SplitLine"></span>
            </div>
        </div>
    </div>
</div>
<div id="mywin"></div>
</body>
</html>
