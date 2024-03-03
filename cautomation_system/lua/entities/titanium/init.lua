AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self.Entity:SetModel( "models/Items/BoxMRounds.mdl" )
self.Entity:SetMaterial("phoenix_storms/concrete0")
self.Entity:SetColor(Color(135,134,129,255))
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
end

