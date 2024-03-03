AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self.Entity:SetModel( "models/hunter/blocks/cube05x05x05.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )    
self.Entity:SetUseType(SIMPLE_USE)       
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
 self.used = false
end

function ENT:Use(ent)
	local drill = ents.Create("quarry")
			drill:SetPos(self:GetPos() + Vector(0, 80, 70))
			drill:Spawn()
			ent:Remove()
			ents.FindByClass( "mega_drill_box" )[1]:Remove()
end


