AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )


function ENT:Initialize()
self.Entity:SetModel( "models/props_wasteland/laundry_washer003.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
self.Entity:SetUseType(SIMPLE_USE)
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
 self.is_attached = false
 self.prossess = false
 self.on = false
end



function ENT:EndTouch(ent)   ----- when not touching anymore it tells it its not attached
self.is_attached = false
end

function ENT:Touch(ent)
if ent:GetClass() == "quarry" then
	self.is_attached = true 
end
end



 delay = 0

function ENT:Think(ent)

if self.is_attached == true then
	self:SetNWString('attach', "Is Attached")
else

self:SetNWString('attach', "Is Not Attached")
end



if self.is_attached == true and Entity(1):GetNWBool("if online") == true then
	self.prossess = true
	self:SetNWString('running', "Is Running")  
		else
self.prossess = false
	self:SetNWString('running', "Is Not Running")
end



if self.prossess == true then

if CurTime() < delay then return end	
	

local ores_extracted = {
iron = "ironore",
titanium = "titaniumore",
copper = "copperore",
silver = "silverore"

}

local ore = ents.Create(table.Random(ores_extracted))
			ore:SetPos(self:GetPos() + Vector(0, 0, 50))
			ore:Spawn()


	delay = CurTime() + 5

end
end












