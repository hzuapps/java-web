<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" href="../src/css/mymusic.css"/>
<title>MyMusicPlayer</title>
</head>
<script src="src/js/smusic.min.js"></script>
<script>
//var musicList = [
//	{
//		title : 'Sugar',
//		singer : 'Maroon 5',
//		cover  : 'images/Maroon5.jpg',
//		src    : 'music/6039.mp3'
//	},
//	{
//		title : '洋葱',
//		singer : '平安',
//		cover  : 'images/yangcong.jpg',
//		src    : 'hmusic/6039.mp3'
//	},
//	{
//		title : '她说',
//		singer : '张碧晨',
//		cover  : 'images/yangcong.jpg',
//		src    : 'music/6039.mp3'
//	},
//	{
//		title : '海阔天空',
//		singer : 'beyond',
//		cover  : 'images/yangcong.jpg',
//		src    : 'music/6039.mp3'
//	}
//];
//new SMusic({
//	musicList:musicList
//});
var myMusicPlayer =  document.createElement("AUDIO");
</script>
<body>
<div class="grid-music-container f-usn">
    <div class="m-music-play-wrap">
        <div class="u-cover"></div>
        <div class="m-now-info">
            <h1 class="u-music-title"><strong>标题</strong><small>歌手</small></h1>
            <div class="m-now-controls">
                <div class="u-control u-process">
                    <span class="buffer-process"></span>
                    <span class="current-process"></span>
                </div>
                <div class="u-control u-time">00:00/00:00</div>
                <div class="u-control u-volume">
                    <div class="volume-process" data-volume="0.50">
                        <span class="volume-current"></span>
                        <span class="volume-bar"></span>
                        <span class="volume-event"></span>
                    </div>
                    <a class="volume-control"></a>
                </div>
            </div>
            <div class="m-play-controls">
                <a class="u-play-btn prev" title="上一曲"></a>
                <a class="u-play-btn ctrl-play play" title="暂停"></a>
                <a class="u-play-btn next" title="下一曲"></a>
                <a class="u-play-btn mode mode-list current" title="列表循环"></a>
                <a class="u-play-btn mode mode-random" title="随机播放"></a>
                <a class="u-play-btn mode mode-single" title="单曲循环"></a>
            </div>
        </div>
    </div>
    <div class="f-cb">&nbsp;</div>
    <div class="m-music-list-wrap"></div>
</div>


</body>
</html>