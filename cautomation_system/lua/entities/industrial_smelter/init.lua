AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self.Entity:SetModel( "models/Items/BoxMRounds.mdl" )
self.Entity:SetMaterial("phoenix_storms/concrete0")
self.Entity:SetColor(Color(184, 115, 51))
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
 
end


