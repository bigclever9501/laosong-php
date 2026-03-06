var UrlJson = decodeURI(getQueryString('json'));
var UrlJson = JSON.parse(UrlJson);
var left = UrlJson.liuri.left //左边
var right = UrlJson.liuri.right //右边
var all = [];

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
var arrColor =[];

var ad = decodeURIComponent(getQueryString('ad'))
ad = JSON.parse(ad)
var title = decodeURIComponent(getQueryString('title'))
document.title = title

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
var qrcode = decodeURI(getQueryString('qrcode'))
 $('.qrcode').attr('src',qrcode);
    $('.qrcode').show()

if (UrlJson.hasOwnProperty('people') == false) {
    $('#L').hide(); //流日
    $('#R').hide()

	right.list.forEach((item, index) => {
	    disposaldata(item, 'WordBlack', index, '#222222')
    });
   
}else{
     
    $('.divtable').hide();  //合图
    $('.detail').show();
    var type = getQueryString('type');
    var pid  = getQueryString('pid');
        if(type == '1'){  
            $('#to').attr('src','/api/config/graph?id=liuriweb&pid=' + pid);   //网页
        }else{
            $('#to').attr('src','/api/config/graph?id=liurimini');    //小程序
        } 
   
    $('#L').show(); //流日
    $('#R').show()
    $('#rect').show()
    $('.name').text(UrlJson.title)
    UrlJson.people.right.list.forEach((item, index) => {
	    RWord(item, 'LBlack', index, '#4e6ef2')
    });
    UrlJson.people.left.list.forEach((item, index) => {
	    RWord(item, 'LRed', index, '#4e6ef2')
    });    
    right.list.forEach((item, index) => {
	    disposaldata(item, 'WordRed', index, '#F33307')
    });
}
		    $('#to').click(function(){
		        if(type == '1'){  
               //    parent.location.href = '/#/pages/design/entries?id='  + getQueryString('id');
               }else{
                parent.wx.miniProgram.navigateTo({
				     url: '/pages/design/entries?id='  + getQueryString('id')
				}) 
               }
		    });

$('#date').text(getQueryString('date'))
$('#time').text(getQueryString('time'))
right.list.forEach((item, index) => {
	//disposaldata(item, 'WordBlack', index, '#222222')
	$('.cls-1').eq(index).text(item)

});

$('.cls-5').text(right.list[0])

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

// getType()
// getTag()

if(arrIn(all,20,57)){
    var line =$('#linex')
    line.show()
    var coolor0 = rgbToHex ($('#line57').children().eq(0).css('fill'))
    var coolor1 = rgbToHex ($('#line57').children().eq(1).css('fill'))
	line.children().eq(0).css('fill', coolor0 );
	line.children().eq(1).css('fill', coolor1);
// 	$('#line57').children().eq(0).css('fill',coolor0)
// 	$('#line20').children().eq(1).css('fill',coolor1)
}

if(arrIn(all,20,34)){
    var line =$('#linex')
    line.show()
    var coolor0 = rgbToHex ($('#line20').children().eq(0).css('fill'))
    var coolor1 = rgbToHex ($('#line20').children().eq(1).css('fill'))
	line.children().eq(0).css('fill', coolor0);
	line.children().eq(1).css('fill', coolor1);
// 	$('#line34').children().eq(0).css('fill',coolor0)
// 	$('#line20').children().eq(1).css('fill',coolor1)
}

if(arrIn(all,10,34)){
    var line =$('#linex')
    line.show()
    var coolor0 = rgbToHex ($('#line10').children().eq(0).css('fill'))
    var coolor1 = rgbToHex ($('#line10').children().eq(1).css('fill'))
	line.children().eq(0).css('fill', coolor0);
	line.children().eq(1).css('fill', coolor1);
// 	$('#line34').children().eq(0).css('fill',coolor0)
// 	$('#line10').children().eq(1).css('fill',coolor1)
}

if(arrIn(all,10,57)){
    var line =$('#linex')
    line.show()
    var coolor0 = rgbToHex ($('#line57').children().eq(0).css('fill'))
    var coolor1 = rgbToHex ($('#line57').children().eq(1).css('fill'))
	line.children().eq(0).css('fill', coolor0);
	line.children().eq(1).css('fill', coolor1);
// 	$('#line57').children().eq(0).css('fill',coolor0)
// 	$('#line10').children().eq(1).css('fill',coolor1)
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
	var line = $('#line' + inte)
	arrColor.push(colo)
	all.push(inte)
	if (line.css("display") == 'none') {
		line.show()
		line.children().eq(0).css('fill', colo);
		line.children().eq(1).css('fill', colo);
	} else {
		line.children().eq(0).css('fill', colo);
	}
	$('#TuSerial').children().eq(inte - 1).children().eq(1).css('fill', '#FFFFFF');
	$('#TuSerial').children().eq(inte - 1).children().eq(0).css('fill', '#293140');
	$('#' + ming).text(num)
	console.log(num);
}

function RWord(num, ming, index, colo) { //设置两排数字及连线
	var ming = ming + (index + 1)
	var inte = parseInt(num)
	var line = $('#line' + inte)
	all.push(inte)
	if (line.css("display") == 'none') {
		line.show()
		line.children().eq(0).css('fill', colo);
		line.children().eq(1).css('fill', colo);
	} else {
		line.children().eq(0).css('fill', colo);
	}
	$('#TuSerial').children().eq(inte - 1).children().eq(1).css('fill', '#FFFFFF');
	$('#TuSerial').children().eq(inte - 1).children().eq(0).css('fill', '#293140');
	$('#' + ming).text(num)
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


function arrIn(arr, numbers1, numbers2) { //数组是否同时包含
  return arr.includes(numbers1) && arr.includes(numbers2);  
}

function getQueryString(name) {
  const url_string =  window.location.href
  const url = new URL(url_string);
  return url.searchParams.get(name);
}


