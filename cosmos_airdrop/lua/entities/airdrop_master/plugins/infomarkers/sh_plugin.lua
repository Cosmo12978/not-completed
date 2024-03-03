local PLUGIN = PLUGIN or {}

PLUGIN.name = "Infomation Markers"
PLUGIN.author = "Cosmos"
PLUGIN.description = "Adds a command to make environmental infomation markers."


ix.command.Add("Infomarker", {
	description = "Creates an environmental infomation marker",
	adminOnly = true,
	OnRun = function(self, client, command)
		local trace1 = client:GetEyeTrace()
		local pos_hit = trace1.HitPos
        
  local markerent=ents.Create("Marker")
	markerent:SetPos(pos_hit)
	markerent:Spawn()
    markerent:SetOwner(client)
	end
})

