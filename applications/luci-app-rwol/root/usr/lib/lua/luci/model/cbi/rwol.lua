--[[

LuCI Remote Wake on LAN module

Copyright (C) 2015, OpenWrt.org

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

Author: -

]]--

m = Map("rwol", translate("Remote Wake on LAN"))

s = m:section(NamedSection, "global", "rwol")
s.anonymous = true
s.addremove = false


e = s:option(Flag, "enabled")
e.title			= translate("Enabled")
e.description	= translate("Enable the service.")
e.default		= false

li = s:option(Value, "listen_interface")
li.title		= translate("Listen interface")
li.description	= translate("Interface to receive requests.")
li.template 	= "cbi/network_ifacelist"
li.widget 		= "radio"
li.nocreate 	= true
li.default		= "wan"

lp = s:option(Value, "listen_port")
lp.title		= translate("Port")
lp.description	= translate("Port to receive requests.")
lp.default		= 9

wi = s:option(Value, "broadcast_interface")
wi.title		= translate("Broadcast interface")
wi.description	= translate("Interface to broadcast wol requests.")
wi.template 	= "cbi/network_ifacelist"
wi.widget 		= "radio"
wi.nocreate 	= true
wi.default		= "br-lan"

ll = s:option(Value, "log_length")
ll.title		= translate("Service log length")
ll.description	= translate("Number of last lines stored in service log file (50 to 500).")
ll.default		= "250"

rl = s:option(Value, "requests_length")
rl.title		= translate("Requests log length")
rl.description	= translate("Number of last lines stored in requests log file (50 to 500).")
rl.default		= "250"

function lp.validate(self, value)
	local int_value = tonumber(value)
	if int_value  and int_value > 0 and int_value <= 65535 then
		return value
	end
	return nil, translate("The port has to be a number from 1 to 65535.")
end

function ll.validate(self, value)
	local int_value = tonumber(value)
	if int_value  and int_value >= 45 and int_value <= 500 then
		return value
	end
	return nil, translate("The service log length has to be a number from 50 to 500.")
end

function rl.validate(self, value)
	local int_value = tonumber(value)
	if int_value  and int_value >= 45 and int_value <= 500 then
		return value
	end
	return nil, translate("The requests log length has to be a number from 50 to 500.")
end

return m
