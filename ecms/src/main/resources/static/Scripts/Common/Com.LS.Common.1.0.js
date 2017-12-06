//region 命名空间
if (typeof (Com) == "undefined") {
    Com = {};
}

if (typeof (Com.LS) == "undefined") {
    Com.LS = {};
}

var GNAMESPACE = Com.LS;
GNAMESPACE.Register = function (str) {
    var arr = str.split("."), o = Com.LS;
    for (i = (arr[0] == "GNAMESPACE") ? 1 : 0; i < arr.length; i++) {
        o[arr[i]] = o[arr[i]] || {};
        o = o[arr[i]];
    }
};

//endregion

//region

GNAMESPACE.Register("Common");
GNAMESPACE.Common.AlertMsgTitle = "系统消息";
GNAMESPACE.Common.ProgressMsgTitle = "请等待";

//endregion


//region Strin trim

String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

//endregion

//region Valid func

$.extend($.fn.validatebox.defaults.rules, {
    CHS: {
        validator: function (value, param) {
            return /^[\u0391-\uFFE5]+$/.test(value);
        },
        message: '请输入汉字'
    },
    english: {// 验证英语
        validator: function (value) {
            return /^[A-Za-z]+$/i.test(value);
        },
        message: '请输入英文'
    },
    ip: {// 验证IP地址
        validator: function (value) {
            return /\d+\.\d+\.\d+\.\d+/.test(value);
        },
        message: 'IP地址格式不正确'
    },
    ZIP: {
        validator: function (value, param) {
            return /^[0-9]\d{5}$/.test(value);
        },
        message: '邮政编码不存在'
    },
    QQ: {
        validator: function (value, param) {
            return /^[1-9]\d{4,10}$/.test(value);
        },
        message: 'QQ号码不正确'
    },
    mobile: {
        validator: function (value, param) {
            return /^(?:13\d|15\d|18\d)-?\d{5}(\d{3}|\*{3})$/.test(value);
        },
        message: '手机号码不正确'
    },
    tel: {
        validator: function (value, param) {
            return /^(\d{3}-|\d{4}-)?(\d{8}|\d{7})?(-\d{1,6})?$/.test(value);
        },
        message: '电话号码不正确'
    },
    mobileAndTel: {
        validator: function (value, param) {
            return /(^([0\+]\d{2,3})\d{3,4}\-\d{3,8}$)|(^([0\+]\d{2,3})\d{3,4}\d{3,8}$)|(^([0\+]\d{2,3}){0,1}13\d{9}$)|(^\d{3,4}\d{3,8}$)|(^\d{3,4}\-\d{3,8}$)/.test(value);
        },
        message: '请正确输入电话号码'
    },
    number: {
        validator: function (value, param) {
            return /^[0-9]+.?[0-9]*$/.test(value);
        },
        message: '请输入数字'
    },
    money: {
        validator: function (value, param) {
            return (/^(([1-9]\d*)|\d)(\.\d{1,2})?$/).test(value);
        },
        message: '请输入正确的金额'

    },
    mone: {
        validator: function (value, param) {
            return (/^(([1-9]\d*)|\d)(\.\d{1,2})?$/).test(value);
        },
        message: '请输入整数或小数'

    },
    integer: {
        validator: function (value, param) {
            return /^[+]?[1-9]\d*$/.test(value);
        },
        message: '请输入最小为1的整数'
    },
    integ: {
        validator: function (value, param) {
            return /^[+]?[0-9]\d*$/.test(value);
        },
        message: '请输入整数'
    },
    range: {
        validator: function (value, param) {
            if (/^[1-9]\d*$/.test(value)) {
                return value >= param[0] && value <= param[1]
            } else {
                return false;
            }
        },
        message: '输入的数字在{0}到{1}之间'
    },
    minLength: {
        validator: function (value, param) {
            return value.length >= param[0]
        },
        message: '至少输入{0}个字'
    },
    maxLength: {
        validator: function (value, param) {
            return value.length <= param[0]
        },
        message: '最多{0}个字'
    },
    //select即选择框的验证
    selectValid: {
        validator: function (value, param) {
            if (value == param[0]) {
                return false;
            } else {
                return true;
            }
        },
        message: '请选择'
    },
    idCode: {
        validator: function (value, param) {
            return /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(value);
        },
        message: '请输入正确的身份证号'
    },
    loginName: {
        validator: function (value, param) {
            return /^[\u0391-\uFFE5\w]+$/.test(value);
        },
        message: '登录名称只允许汉字、英文字母、数字及下划线。'
    },
    equalTo: {
        validator: function (value, param) {
            return value == $(param[0]).val();
        },
        message: '两次输入的字符不一至'
    },
    englishOrNum: {// 只能输入英文和数字
        validator: function (value) {
            return /^[a-zA-Z0-9_ ]{1,}$/.test(value);
        },
        message: '请输入英文、数字、下划线或者空格'
    },
    xiaoshu: {
        validator: function (value) {
            return /^(([1-9]+)|([0-9]+\.[0-9]{1,2}))$/.test(value);
        },
        message: '最多保留两位小数！'
    },
    ddPrice: {
        validator: function (value, param) {
            if (/^[1-9]\d*$/.test(value)) {
                return value >= param[0] && value <= param[1];
            } else {
                return false;
            }
        },
        message: '请输入1到100之间正整数'
    },
    jretailUpperLimit: {
        validator: function (value, param) {
            if (/^[0-9]+([.]{1}[0-9]{1,2})?$/.test(value)) {
                return parseFloat(value) > parseFloat(param[0]) && parseFloat(value) <= parseFloat(param[1]);
            } else {
                return false;
            }
        },
        message: '请输入0到100之间的最多俩位小数的数字'
    },
    rateCheck: {
        validator: function (value, param) {
            if (/^[0-9]+([.]{1}[0-9]{1,2})?$/.test(value)) {
                return parseFloat(value) > parseFloat(param[0]) && parseFloat(value) <= parseFloat(param[1]);
            } else {
                return false;
            }
        },
        message: '请输入0到1000之间的最多俩位小数的数字'
    }
});

//endregion

//region Extend validation property

$.extend($.fn.validatebox.defaults, {
    title: ""
});

//endregion

//region Get form Data

GNAMESPACE.Common.GetFormData = function () {
    var objFormData = {};
    $("body").find("*").each(function () {
        if ($(this).attr('id')) {
            if ($(this).attr('id').indexOf("tb") == 0) {
                objFormData[$(this).attr('id').substr(2)] = $(this).val();
            }
            else if ($(this).attr('id').indexOf("cmb") == 0) {
                objFormData[$(this).attr('id').substr(3)] = $(this).combogrid('getValue');
            }
            else if ($(this).attr('id').indexOf("ldt") == 0 || $(this).attr('id').indexOf("sdt") == 0) {
                objFormData[$(this).attr('id').substr(3)] = $(this).val();
            }
            else if ($(this).attr('id').indexOf("sel") == 0) {
                objFormData[$(this).attr('id').substr(3)] = $(this).val();
            }
            else if ($(this).attr('id').indexOf("ta") == 0) {
                objFormData[$(this).attr('id').substr(2)] = $(this).val();
            }
            else if ($(this).attr('id').indexOf("cbb") == 0) {
                objFormData[$(this).attr('id').substr(3)] = $(this).combobox('getValue');
            }
            else if ($(this).attr('id').indexOf("cbt") == 0) {
                objFormData[$(this).attr('id').substr(3)] = $(this).combotree('getValue');
            }
        }
    });
    return objFormData;
}

GNAMESPACE.Common.GetFormData1 = function () {
    var objFormData = {};
    $("divMsg").find("*").each(function () {
        if ($(this).attr('id')) {
            if ($(this).attr('id').indexOf("tb") == 0) {
                objFormData[$(this).attr('id').substr(2)] = $(this).val();
            }
            else if ($(this).attr('id').indexOf("cmb") == 0) {
                objFormData[$(this).attr('id').substr(3)] = $(this).combogrid('getValue');
            }
            else if ($(this).attr('id').indexOf("ldt") == 0 || $(this).attr('id').indexOf("sdt") == 0) {
                objFormData[$(this).attr('id').substr(3)] = $(this).val();
            }
            else if ($(this).attr('id').indexOf("sel") == 0) {
                objFormData[$(this).attr('id').substr(3)] = $(this).val();
            }
            else if ($(this).attr('id').indexOf("ta") == 0) {
                objFormData[$(this).attr('id').substr(2)] = $(this).val();
            }
            else if ($(this).attr('id').indexOf("cbb") == 0) {
                objFormData[$(this).attr('id').substr(3)] = $(this).combobox('getValue');

            }
        }
    });
    return objFormData;
}
//endregion

//region Form Validateion

GNAMESPACE.Common.FormValidation = function () {
    var strValidateMsg = "";
    $("body").find("*").each(function () {
        if ($(this).attr('id') && $(this).attr('class')) {
            if ($(this).attr('class').indexOf("validatebox") >= 0) {

                if ($(this).attr('id').indexOf("cmb") == 0) {
                    if ($(this).combogrid('getValue') == "") {
                        strValidateMsg += $(this).combogrid('options').missingMessage + "<br\>";
                    }
                }
                else {
                    if (!$(this).validatebox('isValid')) {
                        strValidateMsg += $(this).validatebox('options').title + $(this).validatebox('options').missingMessage + "<br\>";
                    }
                }
            }
        }
    });

    if (strValidateMsg != "") {
        $.messager.alert(GNAMESPACE.Common.AlertMsgTitle, strValidateMsg);
        return false;
    }

    return true;
}

//endregion

//region Form Validateion event

GNAMESPACE.Common.FormValidationEvent = function () {
    $("body").find("*").each(function () {
        if ($(this).attr('id') && $(this).attr('class')) {
            if ($(this).attr('id').indexOf("sel") == 0 || $(this).attr('class').indexOf("validatebox") >= 0) {
                if ($(this).attr('class').indexOf("validatebox") >= 0) {
                    $(this).validatebox('validate');
                }
            }
        }
    });
}

//endregion

//region Set form Data 3

GNAMESPACE.Common.SetFormData3 = function (objData) {

    if (objData != null) {
        var strID = "";
        $("body").find("*").each(function () {
            if ($(this).attr('id')) {
                strID = $(this).attr('id');
                if ($(this).attr('id').indexOf("tb") == 0) {

                    var objValue = $(this).val();
                    if (objValue == "") {

                        strID = strID.substr(2);
                        if (objData[strID]) {
                            $(this).val(objData[strID]);

                            if ($(this).attr('class').indexOf("validatebox") >= 0) {
                                $(this).validatebox('validate');
                            }
                        }
                    }
                }
                else if ($(this).attr('id').indexOf("ta") == 0) {
                    var objValue = $(this).val();
                    if (objValue == "") {
                        strID = strID.substr(2);
                        if (objData[strID]) {
                            $(this).val(objData[strID]);

                            if ($(this).attr('class').indexOf("validatebox") >= 0) {
                                $(this).validatebox('validate');
                            }
                        }
                    }
                }
                else if ($(this).attr('id').indexOf("sel") == 0) {
                    var objValue = $(this).val();
                    if (objValue == "") {
                        strID = strID.substr(3);
                        if (objData[strID]) {
                            $(this).val(objData[strID]);
                        }
                    }
                }
                else if ($(this).attr('id').indexOf("cmb") == 0) {
                    var objValue = $(this).combogrid('getValue');;
                    if (objValue == "") {
                        strID = strID.substr(3);
                        if (objData[strID]) {
                            $(this).combogrid('setValue', objData[strID]);
                        }
                    }
                }
                else if ($(this).attr('id').indexOf("lb") == 0) {
                    strID = strID.substr(2);
                    if (objData[strID]) {
                        $(this).html(objData[strID]);
                    }
                }
                else if ($(this).attr('id').indexOf("ldt") == 0) {
                    strID = strID.substr(3);
                    if (objData[strID]) {
                        if ($(this).is('input')) {
                            $(this).val(objData[strID].replace("Z", ""));
                        }
                        else {
                            $(this).html(objData[strID].replace("Z", ""));
                        }
                    }
                }
                else if ($(this).attr('id').indexOf("sdt") == 0) {
                    strID = strID.substr(3);
                    if (objData[strID]) {
                        if ($(this).is('input')) {
                            $(this).val(objData[strID].replace("Z", ""));
                        }
                        else {
                            $(this).html(objData[strID].replace("Z", ""));
                        }
                    }
                }
            }
        });
    }
}

//endregion


//region Set form Data

GNAMESPACE.Common.SetFormData = function (objData) {

    if (objData != null) {
        var strID = "";
        $("body").find("*").each(function () {
            if ($(this).attr('id')) {
                strID = $(this).attr('id');
                if ($(this).attr('id').indexOf("tb") == 0) {
                    strID = strID.substr(2);
                    if (objData[strID]) {
                        $(this).val(objData[strID]);

                        if ($(this).attr('class').indexOf("validatebox") >= 0) {
                            $(this).validatebox('validate');
                        }
                    }
                }
                else if ($(this).attr('id').indexOf("ta") == 0) {
                    strID = strID.substr(2);
                    if (objData[strID]) {
                        $(this).val(objData[strID]);

                        if ($(this).attr('class').indexOf("validatebox") >= 0) {
                            $(this).validatebox('validate');
                        }
                    }
                }
                else if ($(this).attr('id').indexOf("sel") == 0) {
                    strID = strID.substr(3);
                    if (objData[strID]) {
                        $(this).val(objData[strID]);
                    }
                }
                else if ($(this).attr('id').indexOf("cmb") == 0) {
                    strID = strID.substr(3);
                    if (objData[strID]) {
                        $(this).combogrid('setValue', objData[strID]);
                    }
                }
                else if ($(this).attr('id').indexOf("cbb") == 0) {
                    strID = strID.substr(3);
                    if (objData[strID]) {
                        $(this).combobox('setValue', objData[strID]);
                    }
                }
                else if ($(this).attr('id').indexOf("cbt") == 0) {
                    strID = strID.substr(3);
                    if (objData[strID]) {
                        $(this).combotree('setValue', objData[strID]);
                    }
                }
                else if ($(this).attr('id').indexOf("lb") == 0) {
                    strID = strID.substr(2);
                    if (objData[strID]) {
                        $(this).html(objData[strID]);
                    }
                }
                else if ($(this).attr('id').indexOf("ldt") == 0) {
                    strID = strID.substr(3);
                    if (objData[strID]) {
                        if ($(this).is('input')) {
                            $(this).val(objData[strID].replace("Z", ""));
                        }
                        else {
                            $(this).html(objData[strID].replace("Z", ""));
                        }
                    }
                }
                else if ($(this).attr('id').indexOf("sdt") == 0) {
                    strID = strID.substr(3);
                    if (objData[strID]) {
                        if ($(this).is('input')) {
                            $(this).val(objData[strID].replace("Z", ""));
                        }
                        else {
                            $(this).html(objData[strID].replace("Z", ""));
                        }
                    }
                }
            }
        });
    }
}

//endregion

//region Set form Data for confirm

GNAMESPACE.Common.SetFormData2 = function (objData) {

    if (objData != null) {
        var strID = "";
        $("body").find("*").each(function () {
            if ($(this).attr('id')) {
                strID = $(this).attr('id');
                if ($(this).attr('id').indexOf("tb") == 0) {
                    strID = strID.substr(5);
                    if (objData[strID]) {
                        $(this).val(objData[strID]);

                        if ($(this).attr('class').indexOf("validatebox") >= 0) {
                            $(this).validatebox('validate');
                        }
                    }
                }
                else if ($(this).attr('id').indexOf("ta") == 0) {
                    strID = strID.substr(5);
                    if (objData[strID]) {
                        $(this).val(objData[strID]);

                        if ($(this).attr('class').indexOf("validatebox") >= 0) {
                            $(this).validatebox('validate');
                        }
                    }
                }
                else if ($(this).attr('id').indexOf("sel") == 0) {
                    strID = strID.substr(5);
                    if (objData[strID]) {
                        $(this).val(objData[strID]);
                    }
                }
                else if ($(this).attr('id').indexOf("cmb") == 0) {
                    strID = strID.substr(5);
                    if (objData[strID]) {
                        $(this).combogrid('setValue', objData[strID]);
                    }
                }
                else if ($(this).attr('id').indexOf("lb") == 0) {
                    strID = strID.substr(5);
                    if (objData[strID]) {
                        $(this).html(objData[strID]);
                    }
                }
                else if ($(this).attr('id').indexOf("ldt") == 0) {
                    strID = strID.substr(5);
                    if (objData[strID]) {
                        if ($(this).is('input')) {
                            $(this).val(objData[strID].replace("Z", ""));
                        }
                        else {
                            $(this).html(objData[strID].replace("Z", ""));
                        }
                    }
                }
                else if ($(this).attr('id').indexOf("sdt") == 0) {
                    strID = strID.substr(5);
                    if (objData[strID]) {
                        if ($(this).is('input')) {
                            $(this).val(objData[strID].replace("Z", ""));
                        }
                        else {
                            $(this).html(objData[strID].replace("Z", ""));
                        }
                    }
                }
            }
        });
    }
}

//endregion


//region Empty form Data

GNAMESPACE.Common.EmptyFormData = function () {
    $("body").find("*").each(function () {
        if ($(this).attr('id')) {
            if ($(this).attr('id').indexOf("tb") == 0) {
                $(this).val('');

                if ($(this).attr('class').indexOf("validatebox") >= 0) {
                    $(this).validatebox('validate');
                }
            }
            else if ($(this).attr('id').indexOf("sel") == 0 || $(this).attr('id').indexOf("ldt") == 0) {
                $(this).val('');
            }
            else if ($(this).attr('id').indexOf("cmb") == 0) {
                $(this).combogrid('setValue', '');
            }
            else if ($(this).attr('id').indexOf("cbb") == 0) {
                $(this).combobox('setValue', '');
            }
            else if ($(this).attr('id').indexOf("cbt") == 0) {
                $(this).combotree('setValue', '');
            }
            else if ($(this).attr('id').indexOf("num") == 0) {
                $(this).numberbox('setValue', null);
            }
        }
    });
}

//endregion



//region Get form Data and compare

GNAMESPACE.Common.CompareFieldData = function () {
    var objFormData = {};
    $("body").find("*").each(function () {
        if ($(this).attr('id')) {
            if ($(this).attr('id').indexOf("lbOld") == 0) {
                var strField = $(this).attr('id').substr(5);
                var strFieldNewID = "#lb" + strField;
                if ($(strFieldNewID)) {
                    if ($(this).html() != $(strFieldNewID).html()) {
                        $(strFieldNewID).css("color", "red");
                    }
                }
            }
        }
    });
}

//endregion

//region 构造日期检索条件for ora
GNAMESPACE.Common.GetDateTimeSearchString = function (dateTimeSearchStr, strDate1, strDate2, dateFieldName, strDateFormat) {

    var strDateTimeSearchStr1 = "";
    var strDateTimeSearchStr2 = "";

    if (strDateFormat == "") {
        strDateFormat = "YYYY-MM-DD HH24:MI:SS";
    }

    if (strDate1 != "") {
        strDateTimeSearchStr1 = "to_Date('" + strDate1 + "','" + strDateFormat + "')";
        strDateTimeSearchStr1 = dateFieldName + " >= " + strDateTimeSearchStr1 + "";
    }

    if (strDate2 != "") {
        strDateTimeSearchStr2 = "to_Date('" + strDate2 + "','" + strDateFormat + "')";
        strDateTimeSearchStr2 = dateFieldName + " <= " + strDateTimeSearchStr2 + "";
    }

    if (strDateTimeSearchStr1 != "" || strDateTimeSearchStr2 != "") {
        if (dateTimeSearchStr != "") {
            dateTimeSearchStr += " And ";
        }
    }

    if (strDateTimeSearchStr1 != "" && strDateTimeSearchStr2 != "") {
        dateTimeSearchStr += strDateTimeSearchStr1 + " And " + strDateTimeSearchStr2;
    }
    else if (strDateTimeSearchStr1 != "") {
        dateTimeSearchStr += strDateTimeSearchStr1;
    }
    else if (strDateTimeSearchStr2 != "") {
        dateTimeSearchStr += strDateTimeSearchStr2;
    }

    return dateTimeSearchStr;

}

//endregion



//region Date time option

////region format date to 周

GNAMESPACE.Common.FormatDateToWeekDay = function (dt) {

    var strDate = "";
    var strTime = "";
    if (dt) {
        strDate = dt;
        strTime = strDate.substr(11, 5);
        strDate = strDate.substr(0, 10);
        strDate = strDate + " " + GNAMESPACE.Common.GetWeekDay(strDate) + " " + strTime;
    }

    return strDate;

}

GNAMESPACE.Common.FormatDateToWeekDay2 = function (dt) {

    var strDate = "";
    var strTime = "";
    if (dt) {
        strDate = dt;
        strTime = strDate.substr(11, 5);
        strDate = strDate.substr(0, 10);
        strDate = strDate + " " + GNAMESPACE.Common.GetWeekDay(strDate);
    }

    return strDate;

}

////endregion

////region get week

GNAMESPACE.Common.GetWeekDay = function (dt) {

    if (dt) {
        dt = dt.replace(/-/g, "/").replace("Z", "");
        var intDay = new Date(dt).getDay();
        var strWeekDay = "周";
        if (intDay == 1) {
            return strWeekDay + "一";
        }
        else if (intDay == 2) {
            return strWeekDay + "二";
        }
        else if (intDay == 3) {
            return strWeekDay + "三";
        }
        else if (intDay == 4) {
            return strWeekDay + "四";
        }
        else if (intDay == 5) {
            return strWeekDay + "五";
        }
        else if (intDay == 6) {
            return strWeekDay + "六";
        }
        else if (intDay == 0) {
            return strWeekDay + "日";
        }

    }

    return "";
}


////endregion


////region  FormatterDateTimeYMDHM

GNAMESPACE.Common.FormatterDateTimeYMDHM = function (value, row) {
    if (value) {
        var strDateStr = value.replace(/-/g, "/").replace("Z", "");
        return new Date(strDateStr).format("yyyy-MM-dd hh:mm");
    }
}

////endregion

////region add day

GNAMESPACE.Common.AddDay = function (dt, day) {

    var dt = dt.toString();
    var dt = new Date(Date.parse(dt.replace(/-/g, "/")));

    var allseconds = dt.getTime(); //参数时间的毫秒数
    var ds = 24 * 60 * 60 * 1000; //一天的毫秒数
    var nds = ds * day; //N天的毫秒数
    var t = new Date(Math.abs(allseconds) + nds);

    //return t; //返回时间对象

    var yyyy = t.getFullYear();
    var M = t.getMonth() + 1; //值范围0-11
    var dd = t.getDate();  //值范围1-31
    var h = t.getHours();
    var m = t.getMinutes();
    var s = t.getSeconds();

    return yyyy + "/" + M + "/" + dd;

    //return yyyy + "-" + M + "-" + dd + " " + h + ":" + m + ":" + s;
}

////endregion

////format date

// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
Date.prototype.format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
//调用：

//var time1 = new Date().Format("yyyy-MM-dd");
//var time2 = new Date().Format("yyyy-MM-dd HH:mm:ss");

////endregion

////region format long date time yyyy-MM-dd HH:mm:ss

GNAMESPACE.Common.FormatDateTime = function (date) {
    var month = date.getMonth() + 1;
    if ("" != date) {
        if (date.getMonth() + 1 < 10) {
            month = '0' + (date.getMonth() + 1);
        }
        var day = date.getDate();
        if (date.getDate() < 10) {
            day = '0' + date.getDate();
        }

        return date.getFullYear() + '-' + month + '-' + day + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
    } else {
        return "";
    }
}

////endregion

////region format long date time yyyy-MM-dd HH:mm


GNAMESPACE.Common.FormatYMDHMDateTime = function (date) {
    var month = date.getMonth() + 1;
    if ("" != date) {
        if (date.getMonth() + 1 < 10) {
            month = '0' + (date.getMonth() + 1);
        }
        var day = date.getDate();
        if (date.getDate() < 10) {
            day = '0' + date.getDate();
        }

        return date.getFullYear() + '-' + month + '-' + day + " " + date.getHours() + ":" + date.getMinutes();
    } else {
        return "";
    }
}

////endregion


////region format short date yyyy-MM-dd

GNAMESPACE.Common.FormatDate = function (date) {
    var month = date.getMonth() + 1;
    if ("" != date) {
        if (date.getMonth() + 1 < 10) {
            month = '0' + (date.getMonth() + 1);
        }
        var day = date.getDate();
        if (date.getDate() < 10) {
            day = '0' + date.getDate();
        }

        return date.getFullYear() + '-' + month + '-' + day;
    } else {
        return "";
    }
}

////endregion

//endregion

//region cookie option

GNAMESPACE.Common.SetCookie = function (name, value) {
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}


GNAMESPACE.Common.GetCookie = function (name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}

//endregion

