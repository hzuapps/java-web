<!DOCTYPE html>


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/> 

	<meta name="viewport" content="width=device-width,initial-scale=1.0"> 
	<meta http-equiv="X-UA-Compatible" content="IE-edge"> 
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css"> 
   <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script> 

   <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> 
   <script src="index.js"></script> 
   
    <style>
    #login_panel
    {
    width: 302px;
    height: 200px;
    top: 92px;
	left:500px;
    background-color: rgba(0,0,0,0.05);
    position: relative;
    border-radius: 5px;
    border: 1px solid rgba(201,201,201,0.5);
    float: none;
    padding-left: 80px;
    padding-right: 35px;
    padding-top: 45px;
    }


    .uk-margin {
        margin-bottom: 20px;
		
    }
   

   
    </style>

</head>
<body>
<div id="login_panel">
   <form action="" method="post" enctype="multipart/form-data">
   <div class="uk-margin" style="text-align:?center;" >
            <h3 style="color:red;">
                        分享你的音乐</h3>
        </div>
     <input type="file" name="music" />
	 </br>
     <input type="submit" placeholder="上传" name="submit" value="上传"  />
</form>
    

</div>


</body></html>