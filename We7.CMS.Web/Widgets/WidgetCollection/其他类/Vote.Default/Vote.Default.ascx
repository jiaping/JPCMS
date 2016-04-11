<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Vote.Default.cs" Inherits="We7.CMS.Web.Widgets.Vote_Default" %>
<script type="text/C#" runat="server">
    [ControlDescription(Desc = "投票", Author = "sdfs")]
    string MetaData;
</script>
<div class="<%=Css %>">
<div class="vote mtop10">
    <h3 <%=BackgroundIcon() %>>
        网站投票</h3>
    <div <%=SetBoxBorderColor() %> class="vote_content" id="voteContent">
        <% if (CurrVote != null)
           { %>
        <h4>
            <%= CurrVote.Title %></h4>
        <% if (CurrVote.ListVoteEntrys != null && CurrVote.ListVoteEntrys.Count > 0)
           { %>
        <ul class="clear">     
            <% foreach (VoteEntry voteEntry in CurrVote.ListVoteEntrys)
               { %>       
            <li>
                <% if (CurrVote.OptionType == 1){ %>
                   <input type="radio" id='radio_<%=voteEntry.ID %>' value="<%=voteEntry.ID %>" name="vote<%=voteEntry.VoteID %>" />
                <% }else{%>
                   <input type="checkbox" id="checkbox_<%=voteEntry.ID %>" value="<%=voteEntry.ID %>" name="vote<%=voteEntry.VoteID %>"  />
                <% } %>
                <%= voteEntry.EntryText %>
            </li>            
           <% } %>
           <li class="vote_button_line">
                <input type="hidden" id="hdVoteID" value="<%= CurrVote.ID %>" />
                <input type="hidden" id="hdVoteOptionType" value="<%= CurrVote.OptionType %>" />
                <input type="hidden" id="hdVoteEntryID" value="" />
                <input type="button"  name="submitVote" id="submitVote" class="vote_button"  />
                <input type="button"  name="showVote" id="showVote"  class="voteshow_button"/>
           </li>
        </ul>
        <% } %>        
        <% } %>
    </div>
    <script type="text/javascript" src="/Widgets/WidgetCollection/其他类/Vote.Default/Js/vote.js?20110505008"></script> 
    <script language="javascript" type="text/javascript">
        $(function () {
            $("#voteContent").vote();
        });
    </script>

</div>
</div>