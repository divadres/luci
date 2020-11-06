--[[

LuCI Remote Wake-on-LAN module

Copyright (C) 2015, OpenWrt.org

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

Author: -
]]--
	
module("luci.controller.rwol", package.seeall)

function index()
	entry({"admin", "services", "rwol"               }, firstchild()            , _("Remote Wake on LAN"))
	entry({"admin", "services", "rwol",  "settings"  }, cbi("rwol")             , _("Settings")   , 10)
	entry({"admin", "services", "rwol",  "requestlog"}, view("rwol/request_log"), _("Requests Log"), 20)
	entry({"admin", "services", "rwol",  "servicelog"}, view("rwol/service_log"), _("Service Log"), 30)
end