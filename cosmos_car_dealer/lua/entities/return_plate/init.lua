AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" ) --- includes diffrent files included with this entity

function ENT:Initialize() --- function that gives physics, model, and basic options
self.Entity:SetModel( "models/props_phx/construct/metal_plate2x4.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )
self.Entity:DrawShadow(false)  --- makes shawdows with the entity false to save preformence        
self.Entity:SetUseType(SIMPLE_USE)
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end


end

local car1 = simfphys.SpawnVehicleSimple( "sim_fphys_dukes")

function ENT:Touch()
print(car1:GetClass())
end




