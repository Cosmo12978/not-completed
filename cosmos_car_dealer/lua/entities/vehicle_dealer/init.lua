AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self.Entity:SetModel( "models/gman_high.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_BBOX ) 
self.Entity:DrawShadow(false)
self.Entity:SetUseType(SIMPLE_USE)
test = self.Entity:GetCreationID()

local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
end
util.AddNetworkString("shop_open")
util.AddNetworkString("checkcar1")



function ENT:Use(activator, ent)
net.Start("shop_open")
net.WriteEntity(self)
net.Send(activator)     
end


canafford = true
plyown = nil
net.Receive( "checkcar1", function(ply)
 if canafford == true then
    Entity(1):SetNWBool( "car1", true )
    end
	end )
















	




















