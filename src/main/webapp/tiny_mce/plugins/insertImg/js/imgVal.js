// JavaScript Document
//提供图片验证的数组
var imgValidateCons = {};

/*
imgValidateCons.store存储上传验证的配置值
	init()
	*检测imgValOptions是否存在，如果存在则将其中所有的配置项以及值写在imgValidateCons.store中
	imgValidateCons.store.add(cons, b)
	*cons:配置项
	*b:配置值
	*将配置项和值存储在imgValidateCons.store对象中
	imgValidateCons.store.check(cons)
	*cons:配置项
	*验证配置项是否存在或者是否值为1
*/
imgValidateCons.store = {
	init : function(){
		if(imgValOptions) {
			for(var con in imgValOptions)
			{
				imgValidateCons.store[con] = imgValOptions[con];	
			}	
		}	
	},
	add : function(cons, b){imgValidateCons.store[cons] = b; return 1;},
	check : function(cons){
		var store = imgValidateCons.store;
		if(store[cons]) 
			return true;
		else 
			return false;
	}
};
