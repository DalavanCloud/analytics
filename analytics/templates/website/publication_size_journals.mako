## coding: utf-8
<div id="size_issn">
    <h1 id="size_issn_value">
        <span id="loading_size_issn">
            <img src="/static/images/loading.gif" width="40px" />
            <h5>${_(u'loading')}</h5>
        </span>  
        <br/>
        <small>${_(u'periódicos')}</small>
    </h1>      
</div>
<script language="javascript">
    $("#loading_size_issn").show();
    $(document).ready(function() {
        var url =  "${request.route_url('publication_size')}?code=${selected_code}&collection=${selected_collection_code}&field=issn&callback=?";

        $.getJSON(url,  function(data) {
            $('#size_issn_value').prepend($.number(data['total']).replace(',', '.'));
            $("#loading_size_issn").hide();
        });
    });
</script>
