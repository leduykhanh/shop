{include file="$tpl_dir./global.tpl"}
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <style>
        .help-title {
            height: 50px;
            background-color: #0071bd;
            border-top-right-radius: 130px !important;
            color: white;
            display: table;
        }

        .help-content {
            background-color: #0071bd;
            border-bottom-left-radius: 30px !important;
            color: white;
            min-height: 250px;
        }

        .question {
            color: #f5aa39;
            font-size: 20px;
        }

    </style>

</head>
<body>
    <div class="container">
        <div class="row text-center" style="margin-bottom: 30px; color: #0071bc">
            <h2><strong>{l s='FAQ & Help'}</strong></h2>
        </div>

        <div class="row">
            <div class="col-md-2"></div>

            <div class="col-md-8 help-title">
                <h3 style="display: table-cell; vertical-align: middle;">{l s='SHIPPING QUESTIONS ?'}</h3>
            </div>
        </div>


        <div class="row" style="margin-top: 6px;">
            <div class="col-md-2"></div>

            <div class="col-md-8 help-content">
                <div class="row" style="margin-bottom: 20px; margin-top: 20px;">
                    <div class="col-md-12 question">
                        {l s='Which cities do Tutti delivers?'}
                    </div>

                    <div class="col-md-12 answer">
                        {l s='At the moment, we only deliver to Tehran, Karaj and Esfahan. We will shortly expand to other cities as demand and requests from those places grow.'}
                    </div>
                </div>

                <div class="row" style="margin-bottom: 20px; margin-top: 20px;">
                    <div class="col-md-12 question">
                        {l s='Why are you not delivering in my city?'}
                    </div>
                </div>

                <div class="row" style="margin-bottom: 20px; margin-top: 20px;">
                    <div class="col-md-12 question">
                        {l s='How long would it take to deliver my product?'}
                    </div>
                </div>

        </div>

    </div>
</body>
</html>