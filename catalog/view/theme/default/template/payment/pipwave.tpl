<div id="pwscript" class="text-center">
    <span style="font-size: 20px; vertical-align: text-top; margin-right: 10px;"><?php echo $text_pay_via; ?></span>
    <img src="admin/view/image/payment/pipwave.png">
    <hr />
</div>
<?php if (isset($api_data)) { ?>
<div id="pwloading" class="text-center" style="margin-top: 20px; margin-bottom: 20px;">
    <?php echo '<img src="' . $loading_img . '" />'; ?>
</div>
<script type="text/javascript">
    var pwconfig = <?php echo $api_data; ?>;
    (function (_, p, w, s, d, k) {
        var a = _.createElement("script");
        a.setAttribute("src", w + d);
        a.setAttribute("id", k);
        setTimeout(function () {
            var reqPwInit = (typeof reqPipwave != "undefined");
            if (reqPwInit) {
                reqPipwave.require(["pw"], function (pw) {
                    pw.setOpt(pwconfig);
                    pw.startLoad();
                });
            } else {
                _.getElementById(k).parentNode.replaceChild(a, _.getElementById(k));
            }
        }, 800);
    })(document, "script", <?php echo '"' . $url . '"'; ?>, "pw.sdk.min.js", "pw.sdk.min.js", "pwscript");
</script>
<?php } else { ?>
<?php echo isset($error) ? (is_array($error) ? implode('; ', $error) : $error) : "Error occured"; ?>
<?php } ?>