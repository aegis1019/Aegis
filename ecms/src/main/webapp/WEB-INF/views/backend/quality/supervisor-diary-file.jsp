<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>监理日志</title>
    <link rel="stylesheet" type="text/css" href="../../Scripts/EasyUI/jquery-easyui-1.5.1/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Scripts/EasyUI/jquery-easyui-1.5.1/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../css/Comm1.0.1.css" />
    <script type="text/javascript" src="../../Scripts/FW/Verify.js"></script>
    <script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Scripts/Common/json2.js"></script>
    <script type="text/javascript" src="../../Scripts/Common/Com.LS.Common.1.0.js"></script>
    <script type="text/javascript">

        var id = '';
        var type = '';
        var companyName = '';
        var status = '';

        function UrlChange(rec) {

            rec.FILEPATH = rec.FILEPATH.replace(/\+/g, "%2B");
            rec.FILENAME = rec.FILENAME.replace(/\+/g, "%2B");

            rec.FILEPATH = rec.FILEPATH.replace(/\ /g, "%20");
            rec.FILENAME = rec.FILENAME.replace(/\ /g, "%20");

            rec.FILEPATH = rec.FILEPATH.replace(/\//g, "%2F");
            rec.FILENAME = rec.FILENAME.replace(/\//g, "%2F");

            rec.FILEPATH = rec.FILEPATH.replace(/\?/g, "%3F");
            rec.FILENAME = rec.FILENAME.replace(/\?/g, "%3F");

            rec.FILEPATH = rec.FILEPATH.replace(/\%/g, "%25");
            rec.FILENAME = rec.FILENAME.replace(/\%/g, "%25");

            rec.FILEPATH = rec.FILEPATH.replace(/\#/g, "%23");
            rec.FILENAME = rec.FILENAME.replace(/\#/g, "%23");

            rec.FILEPATH = rec.FILEPATH.replace(/\&/g, "%26");
            rec.FILENAME = rec.FILENAME.replace(/\&/g, "%26");

            rec.FILEPATH = rec.FILEPATH.replace(/\=/g, "%3D");
            rec.FILENAME = rec.FILENAME.replace(/\=/g, "%3D");
        }

        function initGrid() {
            var editRow = undefined;

            $('#dg').datagrid({
                url: '/BasicData/Journal/GetAttachment?id=' + id + '&status=' + status + '',//+ '&type=' + type + ''
                fit: true,
                rownumbers: true,
                pagination: false,
                pageSize: 30,
                fitColumns: true,
                singleSelect: false,
                columns: [[
                    { field: 'ATTACHMENTID', hidden: true },
                    { field: 'FILEPATH', hidden: true },
                    { field: '', checkbox: true },
				    { field: 'FILENAME', title: '文件名', width: '40%', align: 'left', halign: 'center' },
                    { field: 'FILETYPE', title: '文件类型', width: '10%', align: 'left', halign: 'center' },
                    { field: 'INPUTDATE', title: '上传时间', width: '20%', align: 'left', halign: 'center', formatter: ReturnTime },
                    { field: 'INPUTTERNAME', title: '上传人', width: '10%', align: 'left', halign: 'center' },
                {
                    field: 'cz', title: '操作', width: 110, align: 'left', halign: 'center', formatter: function (value, rec) {
                        UrlChange(rec);
                        var a = "<a class=\"editcls\" style=\"color:#0000ff;padding:10px;\" href=\"/BasicData/Journal/Download?path=" + rec.FILEPATH + "&type=" + rec.FILETYPE + "&name=" + rec.FILENAME + "\">查看</a>";
                        var b = '<a class="editcls" style="color:#0000ff;padding:10px;" onclick="deleterow()" >删除</a>';
                        var c = '<a class="editcls" style="color:#0000ff;padding:10px;" onclick="delByID()" >删除</a>';
                        if (rec.AttachmentType == "3") {
                            return a + c;
                        } else {
                            return a + b;
                        }
                    }
                }
                ]],
                toolbar: '#tb'
            });
        }
        function ReturnTime(value) {
            return value.substr(0, 19);
        }
        $(function () {
            var hdid = $("#hdid").val();
            var hdtype = $("#hdtype").val();
            var hdCompanyName = $("#hdCompanyName").val();
            var hdStatus = $("#hdStatus").val();

            if (id.length < 1 && hdid.length > 0 && hdStatus.length > 0) {

                id = hdid;
                type = hdtype;
                $("#id").val(hdid);
                $("#type").val(hdtype);
                $("#companyName").val(hdCompanyName);
                status = hdStatus;
                $("#status").val(hdStatus);
            }

            if (hdStatus.length > 0) {
                status = hdStatus;
                $("#status").val(hdStatus);
            }

            $("#cbbProjectID").combobox({
                url: '/ProjectManages/Project/SearchForList',
                valueField: 'Code',
                textField: 'Name'
            });
            initGrid();
        });

        //删除
        function deleterow(target) {
            $.messager.confirm('提示', '确认删除？', function (r) {
                if (r) {
                    var row = $("#dg").datagrid("getSelected");
                    if (row != null) {
                        $.post("/BasicData/Journal/Del", { id: row.ATTACHMENTID, type: type, status: status }, function (reg) {

                            $("#dg").datagrid("reload");
                        }, "json");
                    }
                }
            });
        }

        //删除
        function delByID(target) {
            $.messager.confirm('提示', '确认删除？', function (r) {
                if (r) {
                    var row = $("#dg").datagrid("getSelected");
                    if (row != null) {
                        $.post("/BasicData/Journal/DelByID", { id: row.ATTACHMENTID, type: type, status: status }, function (reg) {

                            $("#dg").datagrid("reload");
                        }, "json");
                    }
                }
            });
        }

        //验证
        function check() {
            var str = $.trim($('#cbbProjectID').combobox("getValue"));
            if (str == "") {
                $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, "项目名称不能为空！", 'info');
                return false;
            } else {
                $("#type").val($('#cbbProjectID').combobox("getValue"));
            }
            var file = $("#file").filebox("getValue");
            if (file.length < 1) {

                $.messager.alert("提示", "请先选择要上传的附件！", "info");
                return false;
            }
            $("#dialog").dialog({
                //取消关闭按钮
                closable: false
            });
            return true;
        }

    </script>
</head>
<body>
    <table id="dg">
    </table>

    <div id="tb" style="padding: 12px 5px 2px 5px;">
        <form id="myform" action="Upload" enctype="multipart/form-data" method="post" onsubmit="return check();">
            <div>
                项目名称：
                <input id="cbbProjectID" class="Field1" type="text" />
                文件:
                <input class="easyui-filebox" id="file" name="file" data-options="prompt:'请选择文件...'" style="width: 60%" />
                <input type="hidden" id="id" name="id" value="" />
                <input type="hidden" id="type" name="type" value="" />
                <input type="hidden" id="companyName" name="companyName" value="" />
                <input type="hidden" id="status" name="status" value="" />
                <input type="submit" class="l-btn l-btn-small" value="上传" style="width: 80px; height: 24px;" />
            </div>
        </form>
    </div>
    <input type="hidden" id="hdid" value="2017-11-16" />
    <input type="hidden" id="hdtype" value="" />
    <input type="hidden" id="hdCompanyName" value="" />
    <input type="hidden" id="hdStatus" value="2" />
    <div id="dialog" style="display: none; width: 200px; height: 100px; text-align: center; margin: 0 auto;" data-options="title:'提示',modal:true">
        <p style="padding-top: 10px;">附件上传中，请稍等！</p>
    </div>
</body>
</html>
