<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>资金费用类别维护</title> 
	<script type="text/javascript" src="../../Scripts/FW/Verify.js"></script>
    <link rel="stylesheet" type="text/css" href="../../Scripts/EasyUI/jquery-easyui-1.5.1/themes/bootstrap/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="../../Scripts/EasyUI/jquery-easyui-1.5.1/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/Comm1.0.1.css"/>
    <script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Scripts/Common/json2.js"></script>
	<script type="text/javascript" src="../../Scripts/Common/Com.LS.Common.1.0.js"></script> 
    <style type="Text/css">
		
		.x-panel-header
		{
			height:20px;
			background-color:White;
			background-image:none;
	    }
	    	    	    
	    .my-toolbar
		{
			background-color:#F0F7FD;
			background-image:none;
		}
				 
		 * { margin:0; padding:0; list-style:none;}
		html { height:100%; overflow:hidden; background:#fff;}
		body { height:100%; overflow:hidden; background:#fff;}
		div { line-height:1.6;}

		.ButtonBar { position:absolute; left:0px; top:0px; right:0px; height:20px; }
		.GridArea { position:absolute; left:0px; top:30px; bottom:0px; right:0px;}
        .GridBarArea { position:absolute; left:0px; top:0px;height:30px;background-color:#e0ecff;border:none;}
        tr {
            height: auto;
        }

	</style>
	<script type='text/javascript'>

	    var treeLoader;	
	    function GetSelectedItem()
	    {
	        var selectedItem = $("#divTree").treegrid("getSelected");
	        
	        if(selectedItem!=null) {
	            return selectedItem;
	        }
	        else
	        {
	            return null;
	        }

	    }
	    
	    function GetSelectedItemID()
	    {
	        var selectedItem = GetSelectedItem(); 
	        
	        if(selectedItem!=null)
	        {	        	        
	            return selectedItem.id;
	        }
	        else
	        {
	            return "";
	        }
	    }
	    
	     function GetSelectedFeeTypeID()
	    {
	        var selectedItem = GetSelectedItem();
	        
	        if(selectedItem!=null && selectedItem.id!="0")
	        {	        	        
	            return selectedItem.FeeTypeID;
	        }
	        else
	        {
	            return "";
	        }
	    }

	     function GetSelectedItemParentID() {
	         var selectedItem = GetSelectedItem(); 
	         if (selectedItem != null && selectedItem.id!="0") {
	             return selectedItem.parentId;
	         }
	         else {
	             return "0";
	         }
	     }
        // 新增
	    function Add() {
	    
	        var ParentID = GetSelectedItemID();
	        
	        if(ParentID == "")
	        {
	            $.messager.alert("消息", "请选择要添加数据的节点！", "info");
	            return;
	        }
	        top.Close = function () {
	            $("#divTree").treegrid("reload");
	              top.window.$("#divWin").window('close');
	        }
	        var strHref = '<iframe id="fmMenuEdit" name="fmMenuEdit" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/fee/fee-type-new?ParentID=' + ParentID + '"></iframe>';

            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                width: 500,
                height: 240,
                modal: true,
                title: "新增"
            });
            top.window.$("#divWin").window('center');

	    }

        // 删除
	    function Del() {
	    
	        var SelectedItemID = GetSelectedItemID();

	        if (SelectedItemID == "" || SelectedItemID == "0")
	        {
	            $.messager.alert("消息", "请选择要删除的包含有数据的节点！", "info");
	            return;
	        }
	        else
	        {
	            //$.messager.defaults = { ok: "确定", cancel: "退出" };
	            $.messager.confirm("提示", '将要删除该节点，是否继续？', function (e) {
	                if (e) {
	                    DelSubmit(SelectedItemID);
	                }
	            });
	        }
	    }
	    
	    // 删除
	    function DelSubmit(SelectedItemID) {
	        var parID = GetSelectedItemParentID(); 
	        $.messager.progress({ title: GNAMESPACE.Common.ProgressMsgTitle, msg: '正在删除数据。' });
	        $.ajax({
	            type: "POST",
	            url: '/fee/delete',
				contentType: "application/json",
	            data: JSON.stringify({ FeeTypeID: SelectedItemID }),
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
	                    $("#divTree").treegrid("remove", SelectedItemID);
	                    top.Refresh(parID);
	                });
	            }
	        });
	       
	    }
	    

	    // 修改
	    function Edit() {
	    
            var FeeTypeID = GetSelectedFeeTypeID();
            var ParentID = GetSelectedItemParentID();
            top.Close = function () {
                $("#divTree").treegrid("reload");
                top.window.$("#divWin").window('close');
            }
            if (FeeTypeID == "") {
                $.messager.alert("消息", "请选择要修改且包含数据的节点！", "info");
                return;
            }

            var strHref = '<iframe id="fmMenuEdit" name="fmMenuEdit" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/fee/fee-type-edit?FeeTypeID=' + FeeTypeID + '&ParentID=' + ParentID +'"></iframe>';

            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                width: 500,
                height: 240,
                modal: true,
                title: "修改"
            });

            top.window.$("#divWin").window('center');
        }

        // 详细
        function Detail() {         
            var FeeTypeID = GetSelectedFeeTypeID();
            if (FeeTypeID == "") {
                $.messager.alert("消息", "请选择包含数据的节点！", "info");
                return;
            }

            var strHref = '<iframe id="fmMenuEdit" name="fmMenuEdit" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow-x:hidden;" src="/fee/fee-type-detail?FeeTypeID=' + FeeTypeID + '"></iframe>';

            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                width: 500,
                height: 240,
                modal: true,
                title: "详细"
            });
            top.window.$("#divWin").window('center');
        }

        //GNAMESPACE.View.BasicData.FeeType.Index.CloseWin = function (ParentID) {
        //    Refresh(ParentID);
        //    top.window.$("#divWin").window('close');
        //}
        	    
        // 展开所有
        function ExpandAll() {
            $("#divTree").treegrid("expandAll");
        }

        // 收起所有
        function CollapseAll() {
            $("#divTree").treegrid("collapseAll");
        }
	    
	    // 刷新
        top.Refresh = function (ParentID) {
            $("#divTree").treegrid("reload");
	    }	 
	    function initgrid() {
	        $('#divTree').treegrid({
	            width: 1225,
	            height: 575,
	            fit: true,	          
	            url: '/fee/GetAllTreeData?ParID=0',
	            idField: 'FeeTypeID',
	            treeField: 'Name',
	            rownumbers: false,
	            fitcolumns: true,
	            singleSelect: true,
	            columns: [
                    [
                        { field: 'Name', title: "费用名称", width: 200 },
                        { field: 'Sort', title: "排序", width: 75 },
                        { field: 'Remark', title: "备注", width: 200 }
                    ]
	            ]
	        });
	    }
	    function DefEvent() {

	        $("#btnExpandAll").bind("click", function () { ExpandAll(); });
	        $("#btnCollapseAll").bind("click", function () { CollapseAll(); });
	        $("#btnDel").bind("click", function () { Del(); });
	        $("#btnDetail").bind("click", function () { Detail(); });
	        $("#btnAdd").bind("click", function () { Add(); });
	        $("#btnEdit").bind("click", function () { Edit(); });
	    }
	    jQuery(function ($) {
	        initgrid();
	        DefEvent();
	    });
	    
	</script>
	
</head>
	<body >
	    
	     <div id="divGridBarArea" class="easyui-panel GridBarArea">
            <a id="btnAdd" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-add'">新增</a>
            <a id="btnEdit" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-edit'">修改</a>
            <a id="btnDel" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-delete'">删除</a>
            <a id="btnDetail" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-detail'">详细</a>
            <a id="btnExpandAll" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-detail'">展开所有</a>
            <a id="btnCollapseAll" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-btn-detail'">收起所有</a>
        </div>
	    
	     <div id="content" class="GridArea"> 
	        <div id="divTree"></div>
	    </div>
	    
    </body>
</html>
