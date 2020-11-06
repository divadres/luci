'use strict';
'require fs';
'require ui';


return L.view.extend({
    load: function() {
        return L.resolveDefault(fs.read('/var/log/rwol/service.log'), '');
    },
	
	handleReset: function(){
		fs.remove('/var/log/rwol/service.log')
		location.reload()
	},
	
    render: function(log) {
		
        return E('div', {'class': 'cbi-map','id': 'map'}, [
					E('div', {'class': 'cbi-section-descr'}, [
						_('Service Log')
					]),
					E('div', { 'class': 'cbi-section'}, [
						E('div', { 'class': 'cbi-section-node'}, [
							E('textarea', { 'readonly': 'readonly', 'rows': '25', 'wrap': 'off', 'style': 'width: 100% !important; padding: 5px; font-family: monospace'},[
								log
							])
						])
					])	
				]);
    },
    handleSaveApply: null,
    handleSave: null
});