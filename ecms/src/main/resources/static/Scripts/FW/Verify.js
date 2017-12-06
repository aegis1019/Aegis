String.prototype.trim = function() {

    // 用正则表达式将前后空格用空字符串替代。  
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

// 检查数据是否为空
function CheckNull(strValue) {
    if (strValue == "") {
        return false;
    }
    return true;
}

//检查数据长度是否符合要求
function CheckStringLength(strValue, strMinLen, strMaxLen) {
    if (CheckNull(strValue.trim())) {
        //var strReg = "/^s*\\S((.){" + strMinLen + "," + strMaxLen + "}\\S)?\\s*$/";
        var strReg="/^(.){"+ strMinLen + "," + strMaxLen + "}$/";
        return eval(strReg).test(strValue.trim());
    }
    return true;
}

//检查整数
function CheckInt(strValue) {
    if (CheckNull(strValue)) {

        var reg = /^-?\d{1,9}$/;
        return reg.test(strValue);
    }
    return true;
}

//检查小数或整数
function CheckIntOrEecimal(strValue) {
    if (CheckNull(strValue)) {

        var reg = /^\d+(\.{0,1}\d+){0,1}$/;
        return reg.test(strValue);
    }
    return true;
}

//检查包含小数位的数字
function CheckDecimal(strValue, strDataScale) {
    if (CheckNull(strValue)) {

        var strReg = "/^-?\\d{1," + strDataScale + "}(\\.\\d{1," + strDataScale + "})?$/";
        return eval(strReg).test(strValue);
    }
    return true;
}

//检查没有小数位的数字
function CheckDecimalNoScale(strValue) {
    if (CheckNull(strValue)) {
        var reg = /^-?\d+$/;
        return reg.test(strValue);
    }
    return true;
}

//检查包含1，0的数字
function CheckBit(strValue) {
    var reg = /^[0,1]$/;
    return reg.test(strValue);
}

//检查日期和时间（YYYY-MM-DD HH:MM:SS）
function CheckDateTime(strValue) {
    if (CheckNull(strValue.trim())) {
        var reg = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\d):[0-5]?\d:[0-5]?\d$/;
        return reg.test(strValue.trim());
    }
    return true;
}

//检查日期（YYYY-MM-DD）
function CheckDate(strValue) {
    if (CheckNull(strValue.trim())) {

        var reg = /^(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)$/;
        return reg.test(strValue.trim());
    }
    return true;
}

//校验密码：只能输入6-20个字母、数字、下划线
function CheckPassword(strValue) {
    if (CheckNull(strValue.trim())) {
        var reg = /^(\w){6,20}$/;
        return reg.test(strValue);
    }
    return true
}

//校验EMAIL格式
function CheckMail(strValue) {
    if (CheckNull(strValue.trim())) {
        var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        return reg.test(strValue);
    }
    return true
}


//日期计算  
Date.prototype.DateDel = function(strInterval, Number) {
    var dtTmp = this;
    switch (strInterval) {
        case 's': return new Date(Date.parse(dtTmp) - (1000 * Number));
        case 'n': return new Date(Date.parse(dtTmp) - (60000 * Number));
        case 'h': return new Date(Date.parse(dtTmp) - (3600000 * Number));
        case 'd': return new Date(Date.parse(dtTmp) - (86400000 * Number));
        case 'w': return new Date(Date.parse(dtTmp) - ((86400000 * 7) * Number));
        case 'q': return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) - Number * 3, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
        case 'm': return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) - Number, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
        case 'y': return new Date((dtTmp.getFullYear() - Number), dtTmp.getMonth(), dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
    }
}

//#region 校验正则

function CheckCNTTypeSizeStr(strValue) {
    var reg = /(\d{2}[A-Z]{2}X[1-9][0-9]*;)/g;
    strValue = strValue.replace(reg, "");
    if (strValue.length > 0) {
        return false;
    }
    return true;
    //var res= reg.test(strValue);
}
//#endregion





