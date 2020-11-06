'use strict';
'require fs';
'require ui';


return L.view.extend({
    load: function() {
        return fs.lines('/var/log/rwol/requests.log');
    },
	handleReset: function(){
		fs.remove('/var/log/rwol/requests.log')
		location.reload()
	},
    render: function(lines) {
		var rows = []
		
		for (var i = 0; i < lines.length; i++)
			if(lines[i]){
				rows.push(JSON.parse(lines[i]));
			}
			

        var tbl = E('div', {'class': 'table','id': 'requests'}, [
						E('div', {'class': 'tr table-titles'}, [
							E('div', {'class': 'th'}, _('Date')), 
							E('div', {'class': 'th'}, _('Time')), 
							E('div', {'class': 'th'}, _('Host')), 
							E('div', { 'class': 'th'}, _('Port')), 
							E('div', {'class': 'th'}, _('Listen interface')), 
							E('div', { 'class': 'th'}, _('Broadcast interface')), 
							E('div', { 'class': 'th'}, _('Wake MAC'))
						])
					]);

        cbi_update_table(tbl, rows);
		
        return E('div', {'class': 'cbi-map','id': 'map'}, [
					E('div', {'class': 'cbi-section-descr'}, [
						_('Requests log')
					]),
					E('div', { 'class': 'cbi-section'}, [
						E('div', { 'class': 'cbi-section-node'}, [
							tbl
						])
					])	
				]);
    },
    handleSaveApply: null,
    handleSave: null
});