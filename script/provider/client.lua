local nonil = require 'without-check-nil'
local util  = require 'utility'
local lang  = require 'language'

local m = {}

function m.client()
    nonil.enable()
    local name = m.info.clientInfo.name
    nonil.disable()
    return name
end

function m.init(t)
    log.debug('Client init', util.dump(t))
    m.info = t
    lang(t.locale)

    if t.capabilities.workspace.configuration then
        m.isVSCode = true
        m.isVS = false
    else
        m.isVSCode = false
        m.isVS = true
    end
end

return m
