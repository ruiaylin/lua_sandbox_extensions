-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/.

local grammar = require "lpeg.bsd.filterlog".syslog_grammar
local log
local fields

log = "85,16777216,,1000005815,ovpnc1,match,pass,out,4,0x0,,63,0,0,DF,17,udp,76,10.88.10.6,198.100.147.178,55218,123,56"
fields = grammar:match(log)
assert(fields.direction == "out", fields.direction)
assert(fields.tos.value == 0, tostring(fields.tos.value))
assert(fields.reason == "match", fields.reason)
assert(fields.ip_version == "4", fields.ip_version)
assert(fields.protocol_text == "udp", fields.protocol_text)
assert(fields.destination_port.value == 123, tostring(fields.destination_port.value))
assert(fields.anchor == "", fields.anchor)
assert(fields.ttl.value == 63, tostring(fields.ttl.value))
assert(fields.source_address == "10.88.10.6", fields.source_address)
assert(fields.offset.value == 0, tostring(fields.offset.value))
assert(fields.real_interface == "ovpnc1", fields,real_interface)
assert(fields.rule_number.value == 85, tostring(fields.rule_number.value))
assert(fields.sub_rule_number.value == 16777216, tostring(fields.sub_rule_number.value))
assert(fields.flags == "DF", fields.flags)
assert(fields.tracker.value == 1000005815, tostring(fields.tracker.value))
assert(fields.destination_address == "198.100.147.178", fields.destination_address)
assert(fields.ecn == "", fields.ecn)
assert(fields.action == "pass", fields.action)
assert(fields.source_port.value == 55218, tostring(fields.source_port.value))
assert(fields.data_length.value == 56, tostring(fields.data_length.value))
assert(fields.id.value == 0, tostring(fields.id.value))
assert(fields.protocol_id.value == 17, tostring(fields.protocol_id.value))
assert(fields.length.value == 76, tostring(fields.length.value))

log = "85,16777216,,1000005815,ovpnc1,match,pass,out,4,0x0,,127,23173,0,DF,6,tcp,52,10.88.10.6,104.208.28.54,34313,443,0,S,3394332116,,8192,,mss;nop;wscale;nop;nop;sackOK"
fields = grammar:match(log)
assert(fields.direction == "out", fields.direction)
assert(fields.tos.value == 0, tostring(fields.tos.value))
assert(fields.reason == "match", fields.reason)
assert(fields.ip_version == "4", fields.ip_version)
assert(fields.protocol_text == "tcp", fields.protocol_text)
assert(fields.destination_port.value == 443, tostring(fields.destination_port.value))
assert(fields.anchor == "", fields.anchor)
assert(fields.ttl.value == 127, tostring(fields.ttl.value))
assert(fields.source_address == "10.88.10.6", fields.source_address)
assert(fields.offset.value == 0, tostring(fields.offset.value))
assert(fields.real_interface == "ovpnc1", fields,real_interface)
assert(fields.rule_number.value == 85, tostring(fields.rule_number.value))
assert(fields.sub_rule_number.value == 16777216, tostring(fields.sub_rule_number.value))
assert(fields.flags == "DF", fields.flags)
assert(fields.tracker.value == 1000005815, tostring(fields.tracker.value))
assert(fields.destination_address == "104.208.28.54", fields.destination_address)
assert(fields.ecn == "", fields.ecn)
assert(fields.action == "pass", fields.action)
assert(fields.source_port.value == 34313, tostring(fields.source_port.value))
assert(fields.data_length.value == 0, tostring(fields.data_length.value))
assert(fields.id.value == 23173, tostring(fields.id.value))
assert(fields.protocol_id.value == 6, tostring(fields.protocol_id.value))
assert(fields.length.value == 52, tostring(fields.length.value))

log = "5,16777216,,1000000003,igb0,match,block,in,6,0x00,0x00000,255,ICMPv6,58,144,fe80::201:5cff:fe63:de46,ff02::1,"
fields = grammar:match(log)
assert(fields.direction == "in", fields.direction)
assert(fields.class == "0x00", fields.class)
assert(fields.reason == "match", fields.reason)
assert(fields.ip_version == "6", fields.ip_version)
assert(fields.protocol_text == "ICMPv6", fields.protocol_text)
assert(fields.real_interface == "igb0", fields,real_interface)
assert(fields.source_address == "fe80::201:5cff:fe63:de46", fields.source_address)
assert(fields.flow_label == "0x00000", fields.flow_label)
assert(fields.hop_limit.value == 255, tostring(fields.hop_limit.value))
assert(fields.destination_address == "ff02::1", fields.destination_address)
assert(fields.tracker.value == 1000000003, tostring(fields.tracker.value))
assert(fields.anchor == "", fields.anchor)
assert(fields.rule_number.value == 5, tostring(fields.rule_number.value))
assert(fields.sub_rule_number.value == 16777216, tostring(fields.sub_rule_number.value))
assert(fields.action == "block", fields.action)
assert(fields.protocol_id.value == 58, tostring(fields.protocol_id.value))
assert(fields.length.value == 144, tostring(fields.length.value))
