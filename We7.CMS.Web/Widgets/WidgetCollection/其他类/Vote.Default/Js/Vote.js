/*
* vote plugin 1.0
* Copyright (c) 2011 WestEngine http://www.we7.cn
* Date:2011-4-29
* Desc:一个投票的插件
*/

(function ($) {

    //名称插件名称
    $.fn.vote = function (options) {

        //设置默认值
        var defaults = {
            ctrlVoteID: "#hdVoteID",                             //存放VoteID的控件ID
            ctrlVoteOptionType: "#hdVoteOptionType",             //存放投票的选项类型的控件ID
            ctrlShowVote: "#showVote",                           //查看按钮   
            ctrlVoteButton: "#submitVote",                       //提交按钮
            Url: "/Admin/Vote/vote.ashx"                         //提交的地址
        };

        //用自定义参数修正默认值
        defaults = $.extend(defaults, options);

        //对每一个选中的元数进行处理
        this.each(function (item) {
            var ctrl = $(this);
            ctrl.find(defaults.ctrlShowVote).bind("click", function () {
                var voteID = ctrl.find(defaults.ctrlVoteID).val();
                showVoteResult(voteID);
            });
            ctrl.find(defaults.ctrlVoteButton).bind("click", function () {
                var optionType = ctrl.find(defaults.ctrlVoteOptionType).val();
                var voteID = ctrl.find(defaults.ctrlVoteID).val();
                var VoteEntryIDs = new Array();

                if (optionType == 1) {
                    //单选
                    $('input[type=radio]:checked', ctrl).each(function (i) {
                        VoteEntryIDs.push($(this).val());
                    });
                }
                else {
                    //复选
                    $('input[type=checkbox]:checked', ctrl).each(function (i) {
                        VoteEntryIDs.push($(this).val());
                    });
                }

                if (VoteEntryIDs.length > 0) {
                    $.ajax({
                        url: defaults.Url,
                        dataType: "html",
                        data: { voteid: voteID, entrys: VoteEntryIDs.toString() },
                        success: function (text) {
                            if (text == "true" || text == "faild") {
                                showVoteResult(voteID);
                            }
                            else if (text == "voted") {
                                alert("您已经投过票了！");
                            }
                            else if (text == "expiry") {
                                alert("此投票已截止！");
                            }
                        }
                    });
                }
                else {
                    alert("请选择！");
                }
            });
        });

        //显示投票结果
        function showVoteResult(voteID) {
            var strFile = "/admin/Vote/VoteResult.aspx?id=" + voteID;
            var nWidth = "516";
            var nHeight = "406";
            var title = "模式窗口";
            var ret =
                      window.showModalDialog(strFile, window, "dialogWidth:" + nWidth + "px;dialogHeight:" + nHeight + "px;center:yes;status:no;scroll:no;help:no;");
        }
    }
})(jQuery); 