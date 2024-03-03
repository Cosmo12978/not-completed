AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self.Entity:SetModel( "models/mechanics/solid_steel/i_beam2_8.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )       
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
	phys:SetMaterial("gmod_ice") 
phys:Wake()
end
end








