--[[
        © Asterion Project 2021.
        This script was created from the developers of the AsterionTeam.
        You can get more information from one of the links below:
            Site - https://asterionproject.ru
            Discord - https://discord.gg/Cz3EQJ7WrF
        
        developer(s):
            Selenter - https://steamcommunity.com/id/selenter

        ——— Chop your own wood and it will warm you twice.
]]--

local PLUGIN = PLUGIN

-- disable the old observer's hud
ix.plugin.list["observer"].HUDPaint = nil
for k, v in pairs(HOOKS_CACHE["HUDPaint"]) do
	if k.uniqueID == "observer" and k.folder == "helix/plugins/observer.lua" then
		HOOKS_CACHE["HUDPaint"][k] = nil
	end
end

surface.CreateFont( "AdminESPFont", {
	font = "Roboto",
	size = 17,
	extended = true,
	weight = 100,
} )

local function createText(data, x, y, col, y2)
	draw.SimpleText(data, "AdminESPFont", x, y + y2 - 1, Color(0, 0, 0), TEXT_ALIGN_LEFT)
	draw.SimpleText(data, "AdminESPFont", x, y + y2 + 1, Color(0, 0, 0), TEXT_ALIGN_LEFT)
	draw.SimpleText(data, "AdminESPFont", x - 1, y + y2, Color(0, 0, 0), TEXT_ALIGN_LEFT)
	draw.SimpleText(data, "AdminESPFont", x + 1, y + y2, Color(0, 0, 0), TEXT_ALIGN_LEFT)
	draw.SimpleText(data, "AdminESPFont", x, y + y2, col, TEXT_ALIGN_LEFT)
end

function PLUGIN:HUDPaint()
	local client = LocalPlayer()
    if client:GetCharacter() and client:Alive() and client:IsAdmin() and client:GetMoveType() == MOVETYPE_NOCLIP then

        for k, v in pairs(ents.GetAll()) do
            local p = v:IsPlayer()

            if !p and !self.entslist[v:GetClass()] then goto skip end
            if !p or (p and v != LocalPlayer() and v:Alive() and v:GetCharacter()) then
                local _y = 0
                local info = v:ESPInfo()
                for k2, v2 in pairs(info) do
                    if v2[1] and self:DistanceFits(LocalPlayer():GetPos(), v:GetPos(), v2[2]) then
                        local pos = v:GetPos()
                        local head = Vector(pos.x, pos.y, !t and pos.z or pos.z +60)
                        local headPos = head:ToScreen()
                        local distance = LocalPlayer():GetPos():Distance(v:GetPos())
                        local x, y = headPos.x, headPos.y
                        local f = math.abs(350 / distance)
                        local size = 52 * f
                        local col = self.entslist[v:GetClass()] or color_white

                        createText(tostring(v2[1]), (x - size / 2) + size, y - size / 2, col, _y)

                        _y = _y + 15
                    end
                end
            end

            ::skip::
        end
    end
end
