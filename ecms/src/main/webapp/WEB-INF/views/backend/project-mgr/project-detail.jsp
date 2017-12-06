<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>项目信息</title>
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
      .tb{
          width: 98%;margin-left:5px;
          border-top: 1px solid #b9b9b9;
            border-right: 1px solid #b9b9b9;
            border-spacing: 0;
            font-family:'Microsoft YaHei';
      }
      .tb td{
          border-bottom:1px solid #b9b9b9;
          border-left:1px solid #b9b9b9;
          
      }
      .FieldTitle{
          font-weight:bold;
         color:#0965a0;
         text-align:center;
      }
    </style>
    <script type="Text/javascript">

        var ProjectJson = ${ProjectJson};

        // 退出
        function Exit() {
            top.window.$("#divWin").window('close');
        }

        // 初始化
        jQuery(function ($) {           
            $("#btnClose").bind("click", function () { Exit(); });
            GNAMESPACE.Common.SetFormData(ProjectJson);
        });
    </script>
</head>
<body class="FormBody2">
    <div class="BtnArea">
        <div id="divBtns" style="text-align: right;">
            <a id="btnClose" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-inside-exit',iconAlign:'left'">关闭</a>
        </div>
    </div>
    <div id="divInputArea" >
        <table class="tb">
            <tr>
                <td class="e-col3 FieldTitle">项目名称</td>
                <td class="e-col4 Field">
                    <label id="lbName" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">项目简称</td>
                <td class="e-col4 Field">
                    <label id="lbAbbreviation" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">项目代码</td>
                <td class="e-col4 Field">
                    <label id="lbCode" class="Field1" style="width: 153px;" />
                </td>
            </tr>
            <tr>
                <td class="e-col3 FieldTitle">建筑地点</td>
                <td class="e-col4 Field">
                    <label id="lbLocation" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">项目组成</td>
                <td class="e-col4 Field">
                    <label id="lbConsist" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">完成率%</td>
                <td class="e-col4 Field">
                    <label id="lbCompleRate" class="Field1 easyui-validatebox" data-options="validType:'mone'" style="width: 153px;" />
                </td>
            </tr>
             <tr>
                <td class="e-col3 FieldTitle">占地面积</td>
                <td class="e-col4 Field">
                    <label id="lbCoversArea" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">建筑面积</td>
                <td class="e-col4 Field">
                    <label id="lbBuildArea" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">地上面积</td>
                <td class="e-col4 Field">
                    <label id="lbAboveArea" class="Field1" style="width: 153px;"  />
                </td>
            </tr>
             <tr>
                <td class="e-col3 FieldTitle">地下面积</td>
                <td class="e-col4 Field">
                    <label id="lbUnderArea" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">总层高</td>
                <td class="e-col4 Field">
                    <label id="lbTotalFloor" class="Field1" style="width: 153px;" />
                </td>
              <td class="e-col3 FieldTitle">规模及概况</td>
            <td class="e-col4 Field">
                <label id="lbScale" class="Field1" style="width: 153px;" />
            </td>
            </tr>
            <tr>
                <td class="e-col3 FieldTitle">建设单位</td>
                <td class="e-col4 Field">
                    <label id="lbConstructor" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">总指挥</td>
                <td class="e-col4 Field">
                    <label id="lbConstructorPerson" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">联系电话</td>
                <td class="e-col4 Field">
                    <label id="lbConstructorTel" class="Field1" style="width: 153px;" />
                </td>
            </tr>
            <tr>
                <td class="e-col3 FieldTitle">监理单位</td>
                <td class="e-col4 Field">
                    <label id="lbSupervision" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">总指挥</td>
                <td class="e-col4 Field">
                    <label id="lbSupervisionPerson" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">联系电话</td>
                <td class="e-col4 Field">
                    <label id="lbSupervisionTel" class="Field1" style="width: 153px;" />
                </td>
            </tr>
             <tr>
                <td class="e-col3 FieldTitle">总包单位</td>
                <td class="e-col4 Field">
                    <label id="lbContract" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">总指挥</td>
                <td class="e-col4 Field">
                    <label id="lbContractPerson" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">联系电话</td>
                <td class="e-col4 Field">
                    <label id="lbContractTel" class="Field1" style="width: 153px;" />
                </td>
            </tr>
             <tr>
                <td class="e-col3 FieldTitle">设计院</td>
                <td class="e-col4 Field">
                    <label id="lbDesign" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">总指挥</td>
                <td class="e-col4 Field">
                    <label id="lbDesignPerson" class="Field1" style="width: 153px;" />
                </td>
                <td class="e-col3 FieldTitle">联系电话</td>
                <td class="e-col4 Field">
                    <label id="lbDesignTel" class="Field1" style="width: 153px;" />
                </td>
            </tr>          
            <tr>
                 <td class="e-col3 FieldTitle">计划开工日期</td>
            <td class="e-col4 Field">              
                    <label id="lbPlanStart" class="Field1" style="width: 153px;" />                  
            </td>
                 <td class="e-col3 FieldTitle">计划竣工日期</td>
            <td class="e-col4 Field">               
                    <label id="lbPlanComplete" class="Field1" style="width: 153px;" />                   
            </td>           
              <td class="e-col3 FieldTitle">备注</td>
            <td class="e-col4 Field">
                <label id="lbRemark" class="Field1" style="width: 153px;" />
            </td>
            </tr>
        </table>      
    </div>
</body>
</html>
