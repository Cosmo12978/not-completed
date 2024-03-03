AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self.Entity:SetModel( "models/props_junk/rock001a.mdl" )
self.Entity:SetColor(Color(161, 157, 148,255))
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
 
end

