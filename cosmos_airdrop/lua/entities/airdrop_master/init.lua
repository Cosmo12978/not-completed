AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )
include( "crate_config.lua" )
function ENT:Initialize()
self.Entity:SetModel( "models/player/urban.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_BBOX ) 
self.Entity:DrawShadow(false)
self.Entity:SetUseType(SIMPLE_USE)

local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:EnableMotion(false)
phys:Wake()
end
end
util.AddNetworkString("open_airdrop_menu")
util.AddNetworkString("ammocrate")
util.AddNetworkString("armorcrate")
util.AddNetworkString("mediccrate")
util.AddNetworkString("weaponcrate")


function ENT:Use(activator, ent)
net.Start("open_airdrop_menu")
net.WriteEntity(self)
net.Send(activator)     
end


ammo_delay = 0
net.Receive( "ammocrate", function(ent, ply)
if CurTime() < ammo_delay then return 	ply:ChatPrint( "Crate still on cool down, Please try again later." ) end
 local ammocratespawn = ents.Create("ammo_crate")
			ammocratespawn:SetPos(cratespawn_location)
			ammocratespawn:Spawn()
			ammo_delay = CurTime() + ammo_delay_config
			ply:ChatPrint("Crate has spawned.")
	end )

armor_delay = 0
net.Receive( "armorcrate", function(ent, ply)
if CurTime() < armor_delay then return 	ply:ChatPrint( "Crate still on cool down, Please try again later." ) end
 local armorcraterespawn = ents.Create("armor_crate")
			armorcraterespawn:SetPos(cratespawn_location)
			armorcraterespawn:Spawn()
			armor_delay = CurTime() + armor_delay_config
			ply:ChatPrint("Crate has spawned.")
	end )

medic_delay = 0
net.Receive( "mediccrate", function(ent, ply)
if CurTime() < medic_delay then return 	ply:ChatPrint( "Crate still on cool down, Please try again later." ) end
 local mediccraterespawn = ents.Create("medic_crate")
			mediccraterespawn:SetPos(cratespawn_location)
			mediccraterespawn:Spawn()
			medic_delay = CurTime() + medic_delay_config
			ply:ChatPrint("Crate has spawned.")
	end )


weapon_delay = 0
net.Receive( "weaponcrate", function(ent, ply)
if CurTime() < weapon_delay then return 	ply:ChatPrint( "Crate still on cool down, Please try again later." ) end
 local weaponraterespawn = ents.Create("weapon_crate")
			weaponraterespawn:SetPos(cratespawn_location)
			weaponraterespawn:Spawn()
			weapon_delay = CurTime() + weapon_delay_config
			ply:ChatPrint("Crate has spawned.")
	end )



function ENT:Think(ent)
if CurTime() < ammo_delay then ammo_status = "Not Ready"  else ammo_status = "Ready" end
if CurTime() < ammo_delay then ammo_colors = true else ammo_colors = false end

self:SetNWString('ammo_statuss',ammo_status)
if ammo_colors == true then
self:SetNWBool('ammo_color', false)
else
self:SetNWBool('ammo_color', true)
end 



if CurTime() < armor_delay then armor_status = "Not Ready"  else armor_status = "Ready" end
if CurTime() < armor_delay then armor_colors = true else armor_colors = false end

self:SetNWString('armor_statuss',armor_status)
if armor_colors == true then
self:SetNWBool('armor_color', false)
else
self:SetNWBool('armor_color', true)
end 


 if CurTime() < medic_delay then medic_status = "Not Ready"  else medic_status = "Ready" end
if CurTime() < medic_delay then medic_colors = true else medic_colors = false end

self:SetNWString('medic_statuss',medic_status)
if medic_colors == true then
self:SetNWBool('medic_color', false)
else
self:SetNWBool('medic_color', true)
end 


 if CurTime() < weapon_delay then weapon_status = "Not Ready"  else weapon_status = "Ready" end
if CurTime() < weapon_delay then weapon_colors = true else weapon_colors = false end

self:SetNWString('weapon_statuss',weapon_status)
if weapon_colors == true then
self:SetNWBool('weapon_color', false)
else
self:SetNWBool('weapon_color', true)
end 




end













	




















