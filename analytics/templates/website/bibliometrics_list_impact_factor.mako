## coding: utf-8
<%inherit file="base.mako"/>

<%block name="central_container">
  % if not selected_journal_code:
    <div class="panel panel-warning">
      <div class="panel-heading">
        <h3 class="panel-title">${_(u'Atenção')}</h3>
      </div>
      <div class="panel-body">
        ${_(u'É necessário selecionar um periódico para dados bibliométricos.')}
      </div>
    </div>
  % else:
    <div class="row container-fluid">
      <form class="form-inline" method="GET">
          <label>Formas do título</label>
          <input type="text" name="titles" class="col-md-8" id="tokenfield" value="${titles}"/>
          <button type="submit" class="btn btn-default">${_(u'aplicar')}</button>
      </form>
    </div>
    <h3>${_(u'Fator de Impacto em 1, 2, 3, 4 e 5 anos')}</h3>
      <table class="table table-bordered table-impact-factor">
      % for base_year, data in sorted(blist.items(), reverse=True):
        <% 
          base_year = int(base_year) 
        %>
        <tr>
          <th class="table-impact-factor-header" colspan="6">${_(u'citações em')} ${base_year} ${_(u'para publicações de')}</th>
          <th class="table-impact-factor-header" colspan="6">${_(u'documentos publicados em')}</th>
          <th class="table-impact-factor-header" colspan="5">${_(u'fator de impacto')}</th>
        </tr>
        <tr>
          <th class="success">${base_year-1}</th>
          <th class="success">${base_year-2}</th>
          <th>${base_year-3}</th>
          <th>${base_year-4}</th>
          <th>${base_year-5}</th>
          <th>${_(u'total')}</th>
          <th class="success">${base_year-1}</th>
          <th class="success">${base_year-2}</th>
          <th>${base_year-3}</th>
          <th>${base_year-4}</th>
          <th>${base_year-5}</th>
          <th>${_(u'total')}</th>
          <th>${_(u'1 ano')}</th>
          <th class="success">${_(u'2 ano')}</th>
          <th>${_(u'3 ano')}</th>
          <th>${_(u'4 ano')}</th>
          <th>${_(u'5 ano')}</th>
        </tr>
        <tr>
          <td class="success">${int(data['fi_citations'][1])}</td>
          <td class="success">${int(data['fi_citations'][2])}</td>
          <td>${int(data['fi_citations'][3])}</td>
          <td>${int(data['fi_citations'][4])}</td>
          <td>${int(data['fi_citations'][5])}</td>
          <td>${int(sum(data['fi_citations'][1:6]))}</td>
          <td class="success">${int(data['fi_documents'][1])}</td>
          <td class="success">${int(data['fi_documents'][2])}</td>
          <td>${int(data['fi_documents'][3])}</td>
          <td>${int(data['fi_documents'][4])}</td>
          <td>${int(data['fi_documents'][5])}</td>
          <td>${int(sum(data['fi_documents'][1:6]))}</td>
          <td>${'%.4f' % data['fi'][1]}</td>
          <td class="success">${'%.4f' % data['fi'][2]}</td>
          <td>${'%.4f' % data['fi'][3]}</td>
          <td>${'%.4f' % data['fi'][4]}</td>
          <td>${'%.4f' % data['fi'][5]}</td>
        </tr>
      % endfor
      </table>
  % endif
</%block>

<%block name="extra_js">
  <script>
    $('#tokenfield').tokenfield({
      'limit': 5,
      'delimiter': '||'
    })
  </script>
</%block>