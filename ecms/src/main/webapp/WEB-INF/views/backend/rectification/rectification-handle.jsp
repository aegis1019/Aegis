<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
	<title>整改通知单</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="../../Scripts/EasyUI/jquery-easyui-1.5.1/themes/bootstrap/easyui.css" /><link rel="stylesheet" type="text/css" href="/Scripts/EasyUI/jquery-easyui-1.5.1/themes/icon.css" /><link rel="stylesheet" type="text/css" href="/css/Comm1.0.1.css" />
    <script type="text/javascript" src="../../Scripts/FW/Verify.js"></script>
    <script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Scripts/Common/json2.js"></script>
    <script type="text/javascript" src="../../Scripts/Common/Com.LS.Common.1.0.js"></script>
    <script type="Text/javascript">

        GNAMESPACE.Register('View.BasicData.Rectification.List');
        var objGrid;
        var objGridPageBar;
       
        var ProjectData = jQuery.parseJSON('${prjMap}');

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
            var strID = objSelectedRow.rectificationID;
            var strHref = '<iframe id="fmRectificationInfoEdit" name="fmRectificationInfoEdit" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/rectification/handle-edit?RectificationID=' + strID + '"></iframe>';

            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                closable: true,
                resizable: false,
                width: 400,
                height: 450,
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

            var strID = objSelectedRow.rectificationID;
            var strHref = '<iframe id="fmRectificationInfoDetail" name="fmRectificationInfoDetail" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/rectification/handle-detail?RectificationID=' + strID +  '"></iframe>';

            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                closable: true,
                resizable: false,
                width: 400,
                height: 450,
                modal: true,
                title: "详细信息"
            });
            top.window.$("#divWin").window('center');
        }

        function Attach() {
            var objSelectedRow = objGrid.datagrid("getSelected");
            if (objSelectedRow == null) {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "没有选择数据！", 'info');
                return;
            }

            top.Close = function () {
                top.window.$("#divWin").window('close');
            }

            var strID = objSelectedRow.rectificationID;
            var projectID = objSelectedRow.projectID;
            var strHref = '<iframe id="fmRectificationInfoDetail" name="fmRectificationInfoDetail" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/rectification/handle-attachment?id=' + strID + '&type=Rectification&ProjectID='+ projectID + '"></iframe>';

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
                title: "附件"
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
                url: "/rectification/get-all-by-role",
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

        function renderProject(value) {
            if (CheckNull(ProjectData[value])) {
                value = ProjectData[value];
            }
            return value;
        }

        ////Define Grid Columns
        var arrGridColumns = [[
            {
                title: '选择',
                field: 'rectificationID',
                checkbox: true,
                halign: 'center',
                width: 60,
                sortable: false
            },
            {
                field: 'projectID',
                title: "项目名称",
                halign: 'center',
                dataIndex: 'projectID',
                sortable: false,
                width: 180,
                formatter: renderProject
            },
            {
                field: 'rectificationNo',
                title: "单号",
                halign: 'center',
                dataIndex: 'rectificationNo',
                sortable: false,
                width: 180
            },
             {
                 field: 'summary',
                 title: "概述",
                 halign: 'center',
                 dataIndex: 'summary',
                 sortable: false,
                 width: 180
             },
             {
                 field: 'inputDate',
                 title: "下发时间",
                 halign: 'center',
                 dataIndex: 'inputDate',
                 sortable: false,
                 width: 180,
                 formatter: DateTimeFormatter
             },
            {
                field: 'feedbackTime',
                title: "反馈时间",
                halign: 'center',
                dataIndex: 'feedbackTime',
                sortable: false,
                width: 180,
                formatter: DateTimeFormatter
            },
             {
                 field: 'situation',
                 title: "处理情况",
                 halign: 'center',
                 dataIndex: 'situation',
                 sortable: false,
                 width: 180
             }
        ]];

        //日期格式化
        function DateTimeFormatter(value) {
            if (value == undefined) {
                return "";
            }
            /*json格式时间转js时间格式*/
            //value = value.substr(0, 19);
            return value;
        }

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
            $("#btnDetail").bind("click", function () { Detail(); });
            $("#btnEdit").bind("click", function () { Edit(); });
            $("#btnAttach").bind("click", function () { Attach(); });
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
                <col width="350" />

                <col width="350" />

            </colgroup>
            <tr>
                <td class="FieldTitle">单号：</td>
                <td class="Field">
                    <input id="tbRectificationNo" class="Field1" type="text" />
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
            <a id="btnEdit" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-edit'">修改</a>
            <span class="SplitLine"></span>
            <a id="btnDetail" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-detail'">详细</a>
            <span class="SplitLine"></span>
            <a id="btnAttach" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-atta'">附件</a>
            <span class="SplitLine"></span>
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
