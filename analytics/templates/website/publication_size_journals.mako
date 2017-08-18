## coding: utf-8
<div id="size_issn">
    <div class="row container-fluid">
        <div class="col-md-4">
            <h1 id="size_issn_value">
                <span id="loading_size_issn">
                    <img src="/static/images/loading.gif" width="40px" />
                    <h5>${_(u'loading')}</h5>
                </span>  
                <br/>
                <small>${_(u'periódicos')}</small>
            </h1>      
        </div>
        <div class="col-md-8">
            <h6><small id="size_issn_current"></small> ativo</h6> 
            <h6><small id="size_issn_inprogress"></small> em progresso</h6> 
            <h6><small id="size_issn_suspended"></small> suspenso</h6> 
            <h6><small id="size_issn_deceased"></small> descontinuado</h6> 
        </div>
    </div>
</div>
<script language="javascript">
    $("#loading_size_issn").show();
    $(document).ready(function() {
        var url =  "${request.route_url('publication_journal_status_detailde')}?collection=${selected_collection_code}&callback=?";

        $.getJSON(url,  function(data) {
            $('#size_issn_value').prepend($.number(data['total']).replace(',', '.'));
            $('#size_issn_current').prepend($.number(data['current']).replace(',', '.'));
            $('#size_issn_inprogress').prepend($.number(data['inprogress']).replace(',', '.'));
            $('#size_issn_suspended').prepend($.number(data['suspended']).replace(',', '.'));
            $('#size_issn_deceased').prepend($.number(data['deceased']).replace(',', '.'));
            $("#loading_size_issn").hide();
        });
    });
</script>
