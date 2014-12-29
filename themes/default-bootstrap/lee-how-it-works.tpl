<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <!-- Jquery -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

    <style>
        .who-we-are {
            height: 250px;
            background-color: #fbb03b;
            border-top-right-radius: 130px !important;
            border-bottom-left-radius: 130px !important;
            margin: 0 auto;
        }

        .what-we-do {
            height: 200px;
            background-color: #fbb03b;
            border-top-right-radius: 100px !important;
            border-bottom-left-radius: 100px !important;
            margin: 0 auto;
            position: relative;
        }

        .text-box {
            height: 150px;
            margin: 10px auto;
            display: table;
        }

        .circle {
            background-color: red;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: table;
            margin: 0 auto;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .text-align-center {
            vertical-align: middle;
            display: table-cell;
            color: white;
            font-size: 30px;
        }

        .divider {
            border: 1px blue solid;
            margin-top: 40px;
            margin-bottom: 20px;;
        }

    </style>

</head>
<body>
    <div class="container">
        <div class="row text-center" style="margin-bottom: 30px;">
            <h2><strong>WHO</strong> WE ARE</h2>
        </div>

        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 who-we-are">
                <div class="col-md-2"></div>
                <div class="col-md-8 text-box text-center">
                    <span style="display: table-cell; vertical-align: middle;">
						Tutti is neither Italian, nor it is a speaking bird. Tutti is a community that is 
						looking to bring you, your friends and family, every single day, the best deal 
						on the market. As a well-behaved Tutti, we keep negotiating until we get what 
						our dearest customers want. 
						Tutti is a private start-up established and registered in Iran. We are a team of 
						professionals that have over 15 years of experience in Iran and abroad. 
					</span>
                </div>
            </div>
        </div>

        <div class="row divider"></div>

        <div class="row text-center" style="margin-bottom: 30px;">
            <h2><strong>WHAT</strong> WE DO</h2>
        </div>
		<div>
		Tutti’s goal is to make you discover one great original offering, at an amazing 
		price, every single day! 
		We work hard to get you the lowest prices on the market and give back all its 
		benefits to our community. 
		We exclusively collaborate with original manufacturers, services providers and 
		official brand representatives in order to bring our community the best, newest 
		and most demanded products with certified warranties. 
		</div>
        <div class="row" style="margin-top: 30px;">
            <div class="col-md-4">
                <div class="col-md-2"></div>
                <div class="col-md-8 what-we-do">
                    <img style="position: absolute;max-width: 120px; max-height: 100px; margin-top: 70px; margin-left: 10px;" src="../img/Layer1.png">
                    <img style="position: absolute; max-width: 100px; max-height: 70px; margin-top: 70px; margin-left: 140px;" src="../img/Layer3.png">
                    <img style="position: absolute; max-width: 100px; max-height: 60px; margin-top: 20px; margin-left: 30px;" src="../img/Layer4.png">
                    <img style="position: absolute; max-width: 100px; max-height: 50px; margin-top: 120px; margin-left: 40px;" src="../img/Layer5.png">

                </div>

                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="circle text-center">
                        <span class="text-align-center "> 1 </span>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="col-md-2"></div>
                <div class="col-md-8 what-we-do">
                    <img style="position: absolute;max-width: 100px; max-height: 80px; margin-top: 30px; margin-left: 10px;" src="../img/Layer6.png">
                    <img style="position: absolute;max-width: 100px; max-height: 80px; margin-top: 100px; margin-left: 60px;" src="../img/wallet.png">
                </div>
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="circle text-center">
                        <span class="text-align-center "> 2 </span>
                    </div>
                </div>

            </div>
            <div class="col-md-4">
                <div class="col-md-2"></div>
                <div class="col-md-8 what-we-do">
                    <img style="position: absolute;max-width: 150px; max-height: 120px; margin-top: 40px; margin-left: 20px;" src="../img/delivered.png">
                </div>
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="circle text-center">
                        <span class="text-align-center "> 3 </span>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>
</html>