<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>项目管理</title>

    <link rel="stylesheet" type="text/css" href="../../Scripts/EasyUI/jquery-easyui-1.5.1/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Scripts/EasyUI/jquery-easyui-1.5.1/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Comm1.0.1.css" />
    <script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Scripts/Common/json2.js"></script>
    <script type="text/javascript" src="../../Scripts/Common/Com.LS.Common.1.0.js"></script>

    <script type="Text/javascript">

        //GNAMESPACE.Register('View.ProjectManages.Project.List');
        var objGrid;
        var objGridPageBar;

        ////ADD
        function Add() {
            top.Close = function () {
                onSearch();
                top.window.$("#divWin").window('close');
            }
            var strHref = '<iframe id="fmProjectInfoAdd" name="fmProjectInfoAdd" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/project/project-new"></iframe>';

            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                closable: true,
                resizable: false,
                width: 840,
                height: 400,
                modal: true,
                title: "新增"
            });
            top.window.$("#divWin").window('center');

        }

        ////Delete
        function Delete() {

            var objSelectedRow = objGrid.datagrid("getSelected");
            if (objSelectedRow == null) {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "没有选择数据！", 'info');
                return;
            }

            var strID = objSelectedRow.projectID;

            $.messager.confirm("提示", '是否删除选中的数据？', function (e) {
                if (e) {
                    $.messager.progress({ title: GNAMESPACE.Common.ProgressMsgTitle, msg: '正在删除数据。' });
                    $.ajax({
                        type: "POST",
                        url: "/project/project-delete",
                        contentType: "application/json",
                        data: JSON.stringify({ ProjectID: strID }),
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
                                Search();
                            });
                        }
                    });
                }
            });
        }

        ////Edit
        function Edit() {
            var objSelectedRow = objGrid.datagrid("getSelected");
            if (objSelectedRow == null) {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "没有选择数据！", 'info');
                return;
            }

            top.Close = function () {
                Search();
                top.window.$("#divWin").window('close');
            }
            var strID = objSelectedRow.projectID;
            var strHref = '<iframe id="fmProjectInfoEdit" name="fmProjectInfoEdit" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/project/project-edit?ProjectID=' + strID + '"></iframe>';

            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                closable: true,
                resizable: false,
                width: 840,
                height: 400,
                modal: true,
                title: "修改"
            });
            top.window.$("#divWin").window('center');
        }

        ////Detail
        function Detail() {
            var objSelectedRow = objGrid.datagrid("getSelected");
            if (objSelectedRow == null) {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "没有选择数据！", 'info');
                return;
            }

            top.Close = function () {
                top.window.$("#divWin").window('close');
            }

            var strID = objSelectedRow.projectID;
            var strHref = '<iframe id="fmProjectInfoDetail" name="fmProjectInfoDetail" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/project/project-detail?ProjectID=' + strID + '"></iframe>';

            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                closable: true,
                resizable: false,
                width: 840,
                height: 400,
                modal: true,
                title: "详细信息"
            });
            top.window.$("#divWin").window('center');
        }

        function ImgAtta() {
            var strHref = '<iframe id="fmProjectInfoDetail" name="fmProjectInfoDetail" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/AttachmentInfo/Attachment/Attachment?id=ProjectAll&type=GraphicProgress&&frmName=' + strfrmName + '"></iframe>';

            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                closable: true,
                resizable: false,
                width: 700,
                height: 410,
                modal: true,
                title: "项目总平图管理"
            });
            top.window.$("#divWin").window('center');
        }
        //附件管理
        function Atta() {
            var objSelectedRow = objGrid.datagrid("getSelected");
            if (objSelectedRow == null) {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "没有选择数据！", 'info');
                return;
            }

            var strID = objSelectedRow.ProjectID;
            var strHref = '<iframe id="fmProjectInfoDetail" name="fmProjectInfoDetail" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/AttachmentInfo/Attachment/ProjectAttach?id=' + strID + '&type=GraphicProgress&&frmName=' + strfrmName + '"></iframe>';

            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                closable: true,
                resizable: false,
                width: 700,
                height: 410,
                modal: true,
                title: "附件管理"
            });
            top.window.$("#divWin").window('center');
        }

        ////Empty
        function Empty() {
            GNAMESPACE.Common.EmptyFormData();
        }

        // Get Search Cond
        function GetSearchCond() {

            var SearchCondData = GNAMESPACE.Common.GetFormData();
            SearchCondData.start = objGridPageBar.pagination("options").pageSize * (objGridPageBar.pagination("options").pageNumber - 1);
            SearchCondData.limit = objGridPageBar.pagination("options").pageSize;

            return SearchCondData;

        }

        ////onSearch
        function onSearch() {

            var objSearch = GetSearchCond();
            objSearch.start = 0;
            GetGridData(objSearch);
        };

        ////Search
        function Search() {

            var objSearch = GetSearchCond();
            GetGridData(objSearch);
        };

        ////Get result for search
        function GetGridData(objSearchData) {

            $.messager.progress({ title: GNAMESPACE.Common.ProgressMsgTitle, msg: '正在检索数据。' });
            $.ajax({
                type: "POST",
                url: "/project/project-list/get-all",
                data: JSON.stringify(objSearchData),
                error: function (XMLHttpRequest) {
                    $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, XMLHttpRequest.statusText, 'error');
                    $.messager.progress('close');
                },
                success: function (data) {
                    objGridPageBar.pagination("options").total = data.totalCount;
                    objGrid.datagrid('loadData', data.root);
                    $.messager.progress('close');
                }
            });
        };

        function changeGridHeight() {
            $('#tableGrid').datagrid('resize', {
                height: 200
            });
            var intGridHeight = $(document).height() - $("#divSearchArea").height() - $("#divGridBarArea").height() - $("#divGridPageBar").height();
            $('#tableGrid').datagrid('resize', {
                height: intGridHeight
            });
        }

        ////Define Combox
        function DefCombo() {
            objCustomerCodeCombox = $('#cmbCustomerCode').combogrid(objCustomerCodeHelper.Init);
        }

        ////Define Grid Page bar
        function DefGridPageBar() {

            objGridPageBar = $('#divGridPageBar').pagination({
                total: 0,
                pageSize: 20,
                displayMsg: '共{total}条',
                layout: ['list', 'sep', 'first', 'prev', 'sep', 'manual', 'sep', 'next', 'last', 'sep', 'refresh'],
                beforePageText: '页',
                afterPageText: 'of {pages}',
                pageList: [20, 40, 60, 80],
                onSelectPage: function (pageNumber, pageSize) {
                    Search();
                }
            });
        }

        ////Define Grid Columns
        var arrGridColumns = [[
            {
                field: 'projectID',
                title: '选择',
                checkbox: true,
                halign: 'center',
                width: 60,
                sortable: false
            },
            {
                field: 'name',
                title: "项目名称",
                halign: 'center',
                dataIndex: 'Name',
                sortable: false,
                width: 180
            },
            {
                field: 'abbreviation',
                title: "项目简称",
                halign: 'center',
                dataIndex: 'Abbreviation',
                sortable: false,
                width: 180
            },
            {
                field: 'code',
                title: "项目代码",
                halign: 'center',
                dataIndex: 'Code',
                sortable: false,
                width: 100
            },
            {
                field: 'constructor',
                title: "建设单位",
                halign: 'center',
                dataIndex: 'Constructor',
                sortable: false,
                width: 180
            },
            {
                field: 'location',
                title: "建筑地点",
                halign: 'center',
                dataIndex: 'Location',
                sortable: false,
                width: 180
            },
            {
                field: 'scale',
                title: "规模及概况",
                halign: 'center',
                dataIndex: 'Scale',
                sortable: false,
                width: 180
            },
            {
                field: 'planStart',
                title: "计划开工日期",
                halign: 'center',
                dataIndex: 'PlanStart',
                sortable: false,
                width: 130
            },
            {
                field: 'planComplete',
                title: "计划竣工日期",
                halign: 'center',
                dataIndex: 'PlanComplete',
                sortable: false,
                width: 130
            },
            {
                field: 'consist',
                title: "项目组成",
                halign: 'center',
                dataIndex: 'Consist',
                sortable: false,
                width: 180
            },
            {
                field: 'compleRate',
                title: "完成率%",
                halign: 'center',
                dataIndex: 'CompleRate',
                sortable: false,
                width: 80
            },
            {
                field: 'remark',
                title: "备注",
                halign: 'center',
                dataIndex: 'Remark',
                sortable: false,
                width: 180
            }
        ]];

        ////Define Grid
        function DefGrid() {
            var intGridHeight = $(document).height() - $("#divSearchArea").height() - $("#divGridBarArea").height() - $("#divGridPageBar").height();
            objGrid = $('#tableGrid').datagrid({
                selectOnCheck: true,
                CheckOnSelect: false,
                singleSelect: true,
                rownumbers: true,
                striped: true,
                remoteSort: false,
                multiSort: true,
                height: intGridHeight,
                //fitColumns: true,
                columns: arrGridColumns,
                onLoadSuccess: function (data) {
                    objGridPageBar.pagination('refresh');
                },
                onDblClickRow: function (index, row) {
                    Detail();
                }
            });
        }



        function DefEvent() {

            $("#btnSearch").bind("click", function () { onSearch(); });
            $("#btnEmpty").bind("click", function () { Empty(); });
            $("#btnDelete").bind("click", function () { Delete(); });
            $("#btnDetail").bind("click", function () { Detail(); });
            $("#btnAdd").bind("click", function () { Add(); });
            $("#btnEdit").bind("click", function () { Edit(); });
            $("#btnAtta").bind("click", function () { Atta(); });
            $("#btnImgAtta").bind("click", function () { ImgAtta(); });

            $(window).bind("resize", function () { changeGridHeight(); });
        }

        jQuery(function ($) {
            DefEvent();
            DefGridPageBar();
            DefGrid();
            onSearch();
        });
    </script>
</head>
<body class="FormBody2">
<div id="divSearchArea" class="SearchArea">
    <table style="table-layout: fixed; width: 100%" cellpadding="0" cellspacing="0" border="0">
        <colgroup>

            <col width="60" />
            <col width="110" />

            <col width="60" />
            <col width="110" />

            <col width="60" />

        </colgroup>
        <tr>
            <td class="FieldTitle">项目名称：</td>
            <td class="Field">
                <input id="tbName" class="Field1" type="text" />
            </td>
            <td class="FieldTitle">项目代码：</td>
            <td class="Field">
                <input id="tbCode" class="Field1" type="text" />
            </td>
            <td>
                <div class="SearchBtnBar">
                    <a id="btnSearch" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search',iconAlign:'top'">检索</a>
                    <a id="btnEmpty" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-empty',iconAlign:'top'">清空</a>
                </div>
            </td>
        </tr>
    </table>
</div>
<div id="divGridBarArea" class="GridBarArea">
    <div class="GridBar">
        <a id="btnAdd" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-add'">新增</a>
        <span class="SplitLine"></span>
        <a id="btnEdit" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-edit'">修改</a>
        <span class="SplitLine"></span>
        <a id="btnDelete" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-delete'">删除</a>
        <span class="SplitLine"></span>
        <a id="btnDetail" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-detail'">详细</a>
        <span class="SplitLine"></span>
        <a id="btnAtta" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-atta'">形象进度</a>
        <span class="SplitLine"></span>
        <a id="btnImgAtta" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-atta'">项目总平图</a>
    </div>
</div>
<div id="divGridArea" class="GridArea">
    <table id="tableGrid"></table>
</div>

<div id="divPageBarArea" class="PageBarArea">
    <div id="divGridPageBar" class="PageBar"></div>
</div>

</body>
</html>
