
var ad = decodeURIComponent(getQueryString('ad'))
ad = JSON.parse(ad)
if(ad.length > 0){
	for(var i = 0; i < ad.length; i++) {
	    $('#bottom').append('<img class="imgbt" data-id="' + ad[i].url + '"  src="' + ad[i].img + '" alt="Image ' + i + '">');
	}
	
	$('.imgbt').click(function(){
		let that = this
		parent.wx.miniProgram.navigateTo({
			url: $(that).attr("data-id")
		}) 
	})
	
}
var title = decodeURIComponent(getQueryString('title'))
document.title = title

var UrlJson = decodeURI(getQueryString('json'));
var UrlJson = JSON.parse(UrlJson);
var left = UrlJson.left //左边
var right = UrlJson.right //右边
var all = [];
var arrColor =[];
var top1 = false
var top2 = false
var main1 = false
var main2 = false
var bottom2 = false
var foot = false
var bottom1 = false
var main3 = false
var bottom3 = false
var quanwei = ''
//transform: scaleX(-1);  css图像水平翻转

$.post("/api/config/getSign", function(data){
        wx.config({
            debug : false,
            appId : data.appid,
            timestamp :  data.timestamp,
            nonceStr :  data.nonceStr,
            signature :  data.signature,
            jsApiList : [
                'checkJSApi',
            ]
        });
});

var type = getQueryString('type');
var pid  = getQueryString('pid');
var qrcode = decodeURI(getQueryString('qrcode'))
if(type == '1'){  
    $('#to').attr('src','/api/config/graph?id=danrenweb&pid=' + pid);   //网页
    $('.qrcode').attr('src',qrcode);
    $('.qrcode').show()
}else{
    $('#to').attr('src','/api/config/graph?id=danrenmini');    //小程序
    $('.qrcode').attr('src',qrcode);
    $('.qrcode').show()
}
	$('#to').click(function(){
	    if(type == '1'){ 
            //parent.location.href = '/#/pages/design/entries?id='  + getQueryString('id');
        }else{
            parent.wx.miniProgram.navigateTo({
				url: '/pages/design/entries?id='  + getQueryString('id')
		    }) 
        }
	});
var name = decodeURI(getQueryString('name'))
$('.username').text(name)
$('.type').text(UrlJson.data.type)
$('.zhiyin').text(UrlJson.data.zhiyin)
$('.celuo').text(UrlJson.data.celuo)
$('.juese').text(UrlJson.data.juese)
$('.nengliang').text(UrlJson.data.nengliang)
$('.zhuti').text(UrlJson.data.zhuti)
$('.jiaocha').text(UrlJson.data.jiaocha)


left.list.forEach((item, index) => {
	disposaldata(item, 'WordRed', index, '#F33307')
});

right.list.forEach((item, index) => {
	disposaldata(item, 'WordBlack', index, '#222222')
});

if (left.tone[0] < 4) {
	$('#red').html($('#red').html() + '<image x="900" y="180" width="530" height="180" href="img/RedArrowL.png"></image>')
} else {
	$('#red').html($('#red').html() + '<image x="900" y="180" width="530" height="180" href="img/RedArrowR.png"></image>')
}

if (left.tone[1] < 4) {
	$('#red').html($('#red').html() + '<image x="900" y="640" width="530" height="180" href="img/RedArrowL.png"></image>')
} else {
	$('#red').html($('#red').html() + '<image x="900" y="640" width="530" height="180" href="img/RedArrowR.png"></image>')
}

if (right.tone[0] < 4) {
	$('#black').html($('#black').html() + '<image x="2450" y="180" width="530" height="180" href="img/BlackArrowL.png"></image>')
} else {
	$('#black').html($('#black').html() + '<image x="2450" y="180" width="530" height="180" href="img/BlackArrowR.png"></image>')
}

if (right.tone[1] < 4) {
	$('#black').html($('#black').html() + '<image x="2450" y="640" width="530" height="180" href="img/BlackArrowL.png"></image>')
} else {
	$('#black').html($('#black').html() + '<image x="2450" y="640" width="530" height="180" href="img/BlackArrowR.png"></image>')
}

$('#red').html($('#red').html() + '<image x="900" y="380" width="231" height="231" href="img/triangle.png"></image> <text transform="matrix(0.9429 0 0 1 975 560)" class="st2 st7 st6">'+ left.tone[0] +  '</text>')

$('#red').html($('#red').html() + '<image x="900" y="840" width="231" height="231" href="img/triangle.png"></image> <text transform="matrix(0.9429 0 0 1 975 1030)" class="st2 st7 st6">'+ left.tone[1] +  '</text>')


$('#black').html($('#black').html() + '<image x="2750" y="380" width="231" height="231" href="img/triangle.png"></image> <text transform="matrix(0.9429 0 0 1 2820 560)" class="st2 st7 st6">'+ right.tone[0] +  '</text>')


$('#black').html($('#black').html() + '<image x="2750" y="840" width="231" height="231" href="img/triangle.png"></image> <text transform="matrix(0.9429 0 0 1 2820 1010)" class="st2 st7 st6">'+ right.tone[1] +  '</text>')


$('#red').html($('#red').html() + '<image x="1200" y="380" width="231" height="231" href="img/square.png"></image> <text transform="matrix(0.9429 0 0 1 1275 560)" class="st2 st7 st6">'+ left.color[0] +  '</text>')

$('#red').html($('#red').html() + '<image x="1200" y="840" width="231" height="231" href="img/square.png"></image> <text transform="matrix(0.9429 0 0 1 1275 1010)" class="st2 st7 st6">'+ left.color[1] +  '</text>')

$('#black').html($('#black').html() + '<image x="2450" y="380" width="231" height="231" href="img/square.png"></image> <text transform="matrix(0.9429 0 0 1 2525 560)" class="st2 st7 st6">'+ right.color[0] +  '</text>')

$('#black').html($('#black').html() + '<image x="2450" y="840" width="231" height="231" href="img/square.png"></image> <text transform="matrix(0.9429 0 0 1 2525 1010)" class="st2 st7 st6">'+ right.color[1] +  '</text>')



if (arrCon(all, [64, 61, 63], [47, 24, 4])) {
	top1 = true
	top2 = true
	$('#centre1').children().css('fill', '#F9DF82');
	$('#centre2').children().css('fill', '#95B569');
}

if (arrCon(all, [17, 43, 11], [62, 23, 56])) {
	top2 = true
	main1 = true
	$('#centre2').children().css('fill', '#95B569');
	$('#centre3').children().css('fill', '#B49366');
}

if (arrCon(all, [31, 8, 33], [7, 1, 13])) {
	main1 = true
	main2 = true
	$('#centre3').children().css('fill', '#B49366');
	$('#centre4').children().css('fill', '#F3DA80');
}

if (arrCon(all, [15, 2, 46], [5, 14, 29])) {
	main2 = true
	bottom2 = true
	$('#centre4').children().css('fill', '#F3DA80');
	$('#centre5').children().css('fill', '#C14D4D');
}

if (arrCon(all, [42, 3, 9], [53, 60, 52])) {
	bottom2 = true
	foot = true
	$('#centre5').children().css('fill', '#C14D4D');
	$('#centre6').children().css('fill', '#8F6269');
}

if (arrCon(all, [18, 28, 32], [58, 38, 54])) {
	bottom1 = true
	foot = true
	$('#L1').children().css('fill', '#8F6269');
	$('#centre6').children().css('fill', '#8F6269');
}

if (arrCon(all, [19, 39, 41], [49, 55, 30])) {
	bottom3 = true
	foot = true
	$('#R2').children().css('fill', '#8F6269');
	$('#centre6').children().css('fill', '#8F6269');
}
if (arrCon(all, [48, 57], [16, 20])) {
	bottom1 = true
	main1 = true
	$('#L1').children().css('fill', '#8F6269');
	$('#centre3').children().css('fill', '#B49366');
}

if (arrCon(all, [22, 36], [12, 35])) {
	bottom3 = true
	main1 = true
	$('#R2').children().css('fill', '#8F6269');
	$('#centre3').children().css('fill', '#B49366');
}

if (arrCon(all, [45], [21])) {
	main3 = true
	main1 = true
	$('#R1').children().css('fill', '#C14D4D');
	$('#centre3').children().css('fill', '#B49366');
}
if (arrCon(all, [25], [51])) {
	main3 = true
	main2 = true
	$('#R1').children().css('fill', '#C14D4D');
	$('#centre4').children().css('fill', '#8F6269');
}
if (arrCon(all, [26], [44])) {
	main3 = true
	bottom1 = true
	$('#R1').children().css('fill', '#C14D4D');
	$('#L1').children().css('fill', '#8F6269');
}

if (arrCon(all, [40], [37])) {
	main3 = true
	bottom3 = true
	$('#R1').children().css('fill', '#C14D4D');
	$('#R2').children().css('fill', '#8F6269');
}
if (arrCon(all, [59], [6])) {
	bottom2 = true
	bottom3 = true
	$('#centre5').children().css('fill', '#C14D4D');
	$('#R2').children().css('fill', '#8F6269');
}
if (arrCon(all, [50], [27])) {
	bottom2 = true
	bottom1 = true
	$('#centre5').children().css('fill', '#C14D4D');
	$('#L1').children().css('fill', '#8F6269');
}

if (arrCon(all, [10], [34])) {
	bottom2 = true
	main2 = true
	$('#centre5').children().css('fill', '#C14D4D');
	$('#centre4').children().css('fill', '#F3DA80');
}

if (arrCon(all, [10], [57])) {
	main2 = true
	bottom1 = true
	$('#centre4').children().css('fill', '#F3DA80');
	$('#L1').children().css('fill', '#8F6269');
}
if (arrCon(all, [10], [20])) {
	main1 = true
	main2 = true
	$('#centre3').children().css('fill', '#B49366');
	$('#centre4').children().css('fill', '#8F6269');
}

if (arrCon(all, [34], [20])) {
	main1 = true
	bottom2 = true
	$('#centre5').children().css('fill', '#C14D4D');
	$('#centre3').children().css('fill', '#B49366');
}
if (arrCon(all, [34], [57])) {
	bottom1 = true
	bottom2 = true
	$('#centre5').children().css('fill', '#C14D4D');
	$('#L1').children().css('fill', '#8F6269');
}


if (!top1 && !top2 && !main1 && !main2 && !main3 && !bottom1 && !bottom2 && !bottom3 && !foot){
    $('.nengliang').text('无定义')

}

function getType() {
	bottom3 ? quanwei = "情绪" : bottom2 ? quanwei = "中枢" : bottom1 ? quanwei = "直觉" : main3 ? quanwei = "意志力" : main2 ?
		quanwei = "自我" : foot || main1 || top2 || top1 ? quanwei = "环境" : quanwei = "月亮";
	var r = right.list[0]
	var l = left.list[0]
}


if(arrIn(all,20,57)){
    var line =$('#linex')
    line.show()
    var coolor0 = rgbToHex ($('#line57').children().eq(0).css('fill'))
    var coolor1 = rgbToHex ($('#line57').children().eq(1).css('fill'))
	line.children().eq(0).css('fill', coolor0 );
	line.children().eq(1).css('fill', coolor1);
}

if(arrIn(all,20,34)){
    var line =$('#linex')
    line.show()
    var coolor0 = rgbToHex ($('#line20').children().eq(0).css('fill'))
    var coolor1 = rgbToHex ($('#line20').children().eq(1).css('fill'))
	line.children().eq(0).css('fill', coolor0);
	line.children().eq(1).css('fill', coolor1);
}

if(arrIn(all,10,34)){
    var line =$('#linex')
    line.show()
    var coolor0 = rgbToHex ($('#line10').children().eq(0).css('fill'))
    var coolor1 = rgbToHex ($('#line10').children().eq(1).css('fill'))
	line.children().eq(0).css('fill', coolor0);
	line.children().eq(1).css('fill', coolor1);
}

if(arrIn(all,10,57)){
    var line =$('#linex')
    line.show()
    var coolor0 = rgbToHex ($('#line57').children().eq(0).css('fill'))
    var coolor1 = rgbToHex ($('#line57').children().eq(1).css('fill'))
	line.children().eq(0).css('fill', coolor0);
	line.children().eq(1).css('fill', coolor1);
}

function rgbToHex(rgb) {
  var matches = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
  var red = parseInt(matches[1]);
  var green = parseInt(matches[2]);
  var blue = parseInt(matches[3]);

  var hexRed = decimalToHex(red);
  var hexGreen = decimalToHex(green);
  var hexBlue = decimalToHex(blue);

  return "#" + hexRed + hexGreen + hexBlue;
}
function decimalToHex(decimal) {
  var hex = decimal.toString(16);
  return hex.length === 1 ? "0" + hex : hex;
}

function disposaldata(num, ming, index, colo) { //设置两排数字及连线
	var ming = ming + (index + 1)
	var inte = parseInt(num)
	all.push(inte)
	arrColor.push(colo)
	var line = $('#line' + inte)
	if (line.css("display") == 'none') {
		line.show()
		line.children().eq(0).css('fill', colo);
		line.children().eq(1).css('fill', colo);
	} else {
		line.children().eq(0).css('fill', colo);
	}
	$('#TuSerial').children().eq((inte * 2) - 1).css('fill', '#FFFFFF');
	$('#TuSerial').children().eq((inte * 2) - 2).css('fill', '#293140');
	$('#' + ming + '>text').text(num)
// 	var matrixStr = $('#' + ming).children().eq(1).children().attr('transform');
//     var regex = /matrix\(([\d.]+) ([\d.]+) [\d.]+ [\d.]+ ([\d.]+) ([\d.]+)/;
//     var matches = regex.exec(matrixStr);
// 	var matches = regex.exec(matrixStr);
//     if (matches) {
//         var xOffset = parseFloat(matches[3]) ;
//         var yOffset = parseFloat(matches[4]) ;
//         var x = xOffset - 60;
//         var y =  yOffset - 157;
//         var newDiv = '<rect x="40" y="'+ y +'" width="600" height="215" class="frame"></rect>'
//         $('.aa' ).append(newDiv);
//     }
}

function aN(t) {
	var arr = [];
    left.list.forEach((function (s, a) {
        arr.push(parseInt(s))
    }))
    right.list.forEach((function (s, a) {
        arr.push(parseInt(s))
    }))
    
	return arr.includes(t)	
}
var tag
var en
//console.log(aN(15))
function getTag() {
	if (!top1 && !top2 && !main1 && !main2 && !main3 && !bottom1 && !bottom2 && !bottom3 && !foot)
		return tag = "反映者", void(en = "Reflector");
	var t = !1;
	if (aN(5) && aN(15) || aN(14) && aN(2) || aN(29) && aN(46) || aN(34) && aN(10) || aN(34) && aN(57) || aN(27) && aN(50) || aN(42) && aN(53) || aN(3) && aN(60) || aN(9) && aN(52) || aN(59) && aN(6) || aN(20) && aN(34))
		aN(35) && aN(36) || aN(12) && aN(22) || aN(45) && aN(21) || aN(20) && aN(34) ? (console.log(1), t = !0) :
		console.log(1), (aN(5) && aN(15) || aN(14) && aN(2) || aN(29) && aN(46) || aN(34) && aN(10)) && (aN(10) && aN(
			20) || aN(7) && aN(31) || aN(1) && aN(8) || aN(13) && aN(33) ? (t = !0, 2) : 2), (aN(34) && aN(57) || aN(
			27) && aN(50)) && (aN(57) && aN(20) || aN(48) && aN(16)) && (t = !0, console.log(3)), (aN(16) && aN(48) ||
			aN(20) && aN(57)) && (aN(50) && aN(27) || aN(32) && aN(54) || aN(28) && aN(38) || aN(18) && aN(58)) && (
			t = !0, console.log(4)), t ? (tag = "显示生产者", en = "Manifesting Generator") : (tag = "生产者", en =
			"Generator");
	else {
		var i = !1;
		(aN(45) && aN(21) || aN(12) && aN(22) || aN(35) && aN(36)) && (i = !0),
		(aN(16) && aN(48) || aN(20) && aN(57)) && (aN(18) && aN(58) || aN(28) && aN(38) || aN(32) && aN(54) || aN(44) &&
			aN(26)) && (i = !0),
		aN(20) && aN(10) && aN(25) && aN(51) && (i = !0),
			tag = "投射者",
			en = "Projector",
			i && (tag = "显示者", en = "Manifestor")
	}
 	$('.type').text(tag)
}

function arrIn(arr, numbers1, numbers2) { //数组是否同时包含
  return arr.includes(numbers1) && arr.includes(numbers2);  
}

function arrCon(arr, numbers1, numbers2) { //比对两边数组是否存在
	var ret = false;
	numbers1.forEach((item, index) => {
		if (arr.includes(item) && arr.includes(numbers2[index])) {
			ret = true
		}
	});
	return ret
}

function getQueryString(name) {
  const url_string =  window.location.href
  const url = new URL(url_string);
  return url.searchParams.get(name);
}


