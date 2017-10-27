isIe5Mac = (navigator.appVersion.indexOf("MSIE 5") > -1 && document.getElementById && navigator.userAgent.indexOf("Mac") != -1);

var imgOpenMenu = "Images/menu_images/p_arrow_openmenu.gif";
var imgClosedMenu = "Images/menu_images/p_arrow_closedmenu.gif";
var imgActiveSubmenu = "Images/menu_images/p_arrow_sm_on.gif";
var imgInactiveSubmenu = "Images/menu_images/p_arrow_sm_off.gif";
var previousMenuOn = null;
var previousRubOn = null;
var previousItemOn = null;
var previousImgRub = "";
var previousImgMenu = "";
var previousCellOn = null;
var previousMenuCellOn = null;
var menucount = 0;
var objContainer = new Array();
var memoryStick = new Array();

function verifyCompatibleBrowser() {
    this.ver = navigator.appVersion;
    this.dom = document.getElementById ? 1 : 0;
    this.ie5 = (this.ver.indexOf("MSIE 5") > -1 && this.dom) ? 1 : 0;
    this.ie4 = (document.all && !this.dom) ? 1 : 0;
    this.ns5 = (this.dom && parseInt(this.ver) >= 5) ? 1 : 0;
    this.ns4 = (document.layers && !this.dom) ? 1 : 0;
    this.bw = (this.ie5 || this.ie4 || this.ns4 || this.ns5);
    return this;
}


function ConstructObject(obj, _is_visible) {
    this.el = bw.dom ? document.getElementById(obj) : bw.ie4 ? document.all[obj] : bw.ns4 ? eval('document.' + obj) : 0;
    this.css = bw.dom ? document.getElementById(obj).style : bw.ie4 ? document.all[obj].style : bw.ns4 ? eval('document.' + obj) : 0;
    this.scrollHeight = bw.ns4 ? this.css.document.height : this.el.offsetHeight
    this.clipHeight = bw.ns4 ? this.css.clip.height : this.el.offsetHeight
    this.scrollWidth = bw.ns4 ? this.css.document.width : this.el.offsetWidth
    this.clipWidth = bw.ns4 ? this.css.clip.width : this.el.offsetWidth
    this.MoveArea = MoveArea;
    this.x;
    this.y;
    if (_is_visible == false) this.css.display = "none";
    else this.css.display = "block";
    this.obj = obj + "Object"
    this.name = obj;
    this.childObj = new Array();
    this.parentObj;
    eval(this.obj + "=this")
    return this
}

function MoveArea(x, y) {
    this.x = x; this.y = y
    this.css.left = this.x
    this.css.top = this.y
}

function InitialiseAreas() {
    bw = new verifyCompatibleBrowser();
    for (var i = 0; i < memoryStick.length; i++) {
        var bool = false;
        var layer = memoryStick[i];
        if (layer.selected) bool = true;
        objContainer[layer.name] = new ConstructObject(layer.name, true);
        objContainer[layer.name].parentObj = null;
        if (layer.hasChilds()) {
            for (var j = 0; j < layer.childs.length; j++) {
                var bool2 = false;
                var submenu = layer.childs[j];
                if (layer.selected) bool = true;
                objContainer[submenu.name] = new ConstructObject(submenu.name, bool);
                objContainer[submenu.name].parentObj = objContainer[layer.name];
                objContainer[layer.name].childObj[objContainer[layer.name].childObj.length] = objContainer[submenu.name];
                if (submenu.hasItems()) {
                    if (submenu.selected) bool2 = true;
                    var item = submenu.name + "_items"; // all the items are in the same layer
                    objContainer[item] = new ConstructObject(item, bool2);
                    objContainer[item].parentObj = objContainer[submenu.name];
                    objContainer[submenu.name].childObj[objContainer[submenu.name].childObj.length] = objContainer[item];
                }
            }
        }
    }
    previousCellOn = document.getElementById("defaultCellOn");
    previousMenuCellOn = document.getElementById("defaultMenuCellId");
}


/**********************************
// class defining the menu headers
**********************************/
function SGMenu(_text, _url, _name) {
    menucount++;
    this.text = _text;
    this.url = _url;
    this.name = _name;
    this.childs = new Array();
    this.selected = false;

    this.hasChilds = SGMenuHasChilds;
    this.addChild = SGMenuAddChild;
    this.getDivStart = SGMenuGetDivStart;
    this.getDivEnd = SGMenuGetDivEnd;
    this.getHTML = SGMenuWrite;
    memoryStick[memoryStick.length] = this;
}

function SGMenuHasChilds() {
    return (this.childs.length > 0) ? true : false;
}



function SGMenuAddChild(obj) {
    var index = this.childs.length;
    obj.name = "m" + menucount + "_rub" + index;
    obj.parent = this;
    this.childs[index] = obj;
    if (obj.selected) {
        this.selected = true;
        previousMenuOn = eval('document.getElementById("' + this.name + '")');
    }
}

function SGMenuGetDivStart() {
    var urlAdr = "";
    var startId = "";
    compl = ' oncLick="hilightMenu(this)"';
    var cellClass = (this.selected) ? "menuOn" : "menuOff";
    //var anchorClass=(this.selected)?"menutextOn":"menutext";
    var arrow = (this.selected) ? "Images/menu_images/p_arrow_openmenu.gif" : "Images/menu_images/p_arrow_closedmenu.gif";

    if (this.selected) {
        previousImgMenu = this.name + '_arrow';
        previousMenuOn = this.name;
        startId = "defaultMenuCellId";
    }
    var html = '<div id="' + this.name + '" style="display:block;padding-top:1px">' + "\n";
    html += '<table width="140" height="20" cellspacing="0" cellpadding="0" border="0">' + "\n";
    if (isIe5Mac) {
        html += '<tr>' + "\n" +
			'<td colspan="2"><img src="images/spacer.gif" width="1" height="1" alt="" border="0"></td>' + "\n" +
		'</tr>' + "\n";
    }

    html += '<tr class="' + cellClass + '"';
    if (this.selected) html += ' id="' + startId + '"';
    html += '>' + "\n" +
	    "\t" + '<td width="10" align="right" valign="top"><img name="' + this.name + '_arrow" src="' + arrow + '" width="7" height="7" alt="" border="0"></td>' + "\n";
    if (this.url == "#") urlAdr = 'javascript:show_child(\'' + this.name + '\',\'' + this.name + '_arrow\')';
    else urlAdr = this.url;

    html += "\t" + '<td width="*"><a href="' + urlAdr + '"' + compl + ' class="menuText" onfocus="if(this.blur)this.blur()">' + this.text + '</a></td>' + "\n" +
	'</tr>' + "\n" +
	'</table>' + "\n";
    return (html);
}

function SGMenuGetDivEnd() {
    return ("</div>\n");
}

function SGMenuWrite() {
    var out = this.getDivStart();
    if (this.hasChilds()) {
        for (var i = 0; i < this.childs.length; i++) {
            out += this.childs[i].getHTMLStart();
            if (this.childs[i].hasItems()) {
                out += this.childs[i].getItems();
            }
            out += this.childs[i].getHTMLEnd();
        }
    }
    out += this.getDivEnd();
    //alert(out);
    return (out);
}

/*******************************
// class defining the menuitems
*******************************/
function SGRub(_text, _menu, _url) {
    this.text = _text;
    this.url = _url;
    this.menu = _menu;
    this.name = "";
    this.items = new Array();
    this.selected = false;
    this.parent = null;

    this.hasItems = SGRubHasItems;
    this.addItem = SGRubAddItem;
    this.getHTMLStart = SGRubGetHTMLStart;
    this.getHTMLEnd = SGMenuGetDivEnd;
    this.getItems = SGRubGetItems;
    this.setSelected = SGRubSetSelected;
}

function SGRubHasItems() {
    return (this.items.length > 0) ? true : false;
}

function SGRubAddItem(obj) {
    this.items[this.items.length] = obj;
}

function SGRubGetHTMLStart() {
    var compl = ' oncLick="hilight(this)"';
    var startId = "";
    var cellClass = (this.selected) ? "submenuOnCell" : "submenuOffCell";
    var arrow = (this.selected) ? "Images/menu_images/p_arrow_sm_on.gif" : "Images/menu_images/p_arrow_sm_off.gif";
    if (this.selected) {
        previousImgRub = this.name + '_arrow';
        previousRubOn = this.name;
        startId = "defaultCellOn";
    }

    var html = '<div id="' + this.name + '" style="padding-top:1px;" class="cellOff">' + "\n" +
		'<table width="140" height="18" cellspacing="0" cellpadding="0" border="0">' + "\n";
    if (isIe5Mac) {
        html += '<tr>' + "\n" +
				'<td colspan="2"><img src="images/spacer.gif" width="1" height="1" alt="" border="0"></td>' + "\n" +
			'</tr>' + "\n";
    }
    html += '<tr class="' + cellClass + '"';
    if (this.selected) html += 'id="' + startId + '"';
    html += '>' + "\n" +
			    '<td width="10" height="18" align="right" valign="top"><img name="' + this.name + '_arrow" src="' + arrow + '" width="7" height="7" alt="" border="0"></td>' + "\n" +
			    '<td width="*">';
    if (this.url == "#") {
        var def_url = 'javascript:show_child(\'' + this.name + '\',\'' + this.name + '_arrow\')';
    }
    else {
        //def_url=this.url; 
        var def_url = "javascript:parent.window.left_menu.location='" + this.menu + "';parent.window.main_frm.location='" + this.url + "'";

    }
    //if (def_url.indexOf("javascript") > 0 ) 
    html += '<a href="' + def_url + '"' + compl + ' class="subMenuOff" onfocus="if(this.blur)this.blur()">' + this.text + '</a></td>' + "\n" +
			'</tr>' + "\n" +
		'</table>' + "\n";
    /* else
    html += '<a href="javascript:parent.window.left_menu.location=\''+this.menu+'\';parent.window.main_frm.location=\''+def_url+'\'"'+compl+' class="subMenuOff" onfocus="if(this.blur)this.blur()">'+this.text+'</a></td>'+"\n"+
    '</tr>'+"\n"+
    '</table>'+"\n";*/
    return (html);
}

function SGRubGetItems() {
    var html = '<div id="' + this.name + '_items">' + "\n" +
		'<table width="140" cellspacing="0" cellpadding="0" border="0" height="15">' + "\n";

    for (var i = 0; i < this.items.length; i++) {
        var cellClass = (this.items[i].selected) ? "subMenuItemOn" : "subMenuItem";
        if (this.items[i].selected) previousItemOn = eval('document.getElementById("' + this.name + '_items")');

        if (this.items[i].text != "") {
            html += '<tr>' + "\n" +
			    '<td class="itemCell" height="15"><a href="' + this.items[i].url + '" class="' + cellClass + '">' + this.items[i].text + '</a></td>' + "\n" +
			'</tr>' + "\n";
        }
    }
    html += '</table>' + "\n" +
		'</div>' + "\n";
    return (html);
}

function SGRubSetSelected(num) {
    var item_on = this.items[num - 1];
    item_on.selected = true;
    this.selected = true;
    this.parent.selected = true;
}

/*************************
//class defining items
*************************/
function Item(_text, _url) {
    this.text = _text;
    this.url = _url;
    this.selected = false;
}


function show_child(name, pict) {
    var my_img = null;
    var layer = null;

    if (pict.indexOf("menu") != -1) {
        if (previousImgMenu != "") {
            my_img = document.images[previousImgMenu];
            my_img.src = "Images/menu_images/p_arrow_closedmenu.gif";
        }
        if (previousImgRub != "") {
            my_img = document.images[previousImgRub];
            my_img.src = "Images/menu_images/p_arrow_sm_off.gif";
        }
        document.images[pict].src = "Images/menu_images/p_arrow_openmenu.gif";
        previousImgMenu = pict;
    }
    if (pict.indexOf("rub") != -1) {
        if (previousImgRub != "") {
            my_img = document.images[previousImgRub];
            my_img.src = "Images/menu_images/p_arrow_sm_off.gif";
        }
        document.images[pict].src = "Images/menu_images/p_arrow_sm_on.gif";
        previousImgRub = pict;
    }



    if (name.indexOf("menu") != -1) {
        if (previousMenuOn != null) {
            for (var i = 0; i < objContainer[previousMenuOn].childObj.length; i++) {
                if (objContainer[previousMenuOn].childObj[i].css.display == "block") objContainer[previousMenuOn].childObj[i].css.display = "none";
                if (objContainer[previousMenuOn].childObj[i].childObj.length > 0) {
                    for (var j = 0; j < objContainer[previousMenuOn].childObj[i].childObj.length; j++) {
                        objContainer[previousMenuOn].childObj[i].childObj[j].css.display = "none";
                    }
                }
            }
        }
        previousMenuOn = name;
    }

    if (name.indexOf("rub") != -1) {
        if (previousRubOn != null) {
            for (var i = 0; i < objContainer[previousRubOn].childObj.length; i++) {
                objContainer[previousRubOn].childObj[i].css.display = "none";
            }
        }
        previousRubOn = name;
    }

    layer = objContainer[name];
    for (var i = 0; i < layer.childObj.length; i++) {
        layer.childObj[i].css.display = "block";
    }
}

function hilight(obj) {
    if (previousCellOn != null) previousCellOn.className = "submenuOffCell";
    var myCell = null;
    if (bw.ns5) myCell = obj.parentNode.parentNode;
    else myCell = obj.parentElement.parentElement;
    myCell.className = "submenuOnCell";
    previousCellOn = myCell;
}

function hilightMenu(obj) {
    if (previousMenuCellOn != null) previousMenuCellOn.className = "menuOff";
    if (previousCellOn != null) previousCellOn.className = "submenuOffCell";
    var myCell = null;
    if (bw.ns5) myCell = obj.parentNode.parentNode;
    else myCell = obj.parentElement.parentElement;
    myCell.className = "menuOn";
    previousMenuCellOn = myCell;

}