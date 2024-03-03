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
util.AddNetworkString("open_airdrop_menu1")
util.AddNetworkString("ammocrate1")
util.AddNetworkString("armorcrate1")
util.AddNetworkString("mediccrate1")
util.AddNetworkString("weaponcrate1")


function ENT:Use(activator, ent)
net.Start("open_airdrop_menu1")
net.WriteEntity(self)
net.Send(activator)     
end


ammo_delay1 = 0
net.Receive( "ammocrate1", function(ent, ply)
if CurTime() < ammo_delay1 then return 	ply:ChatPrint( "Crate still on cool down, Please try again later." ) end
 local ammocratespawn1 = ents.Create("ammo_crate")
			ammocratespawn1:SetPos(cratespawn_location1)
			ammocratespawn1:Spawn()
			ammo_delay1 = CurTime() + ammo_delay_config1
			ply:ChatPrint("Crate has spawned.")
	end )

armor_delay1 = 0
net.Receive( "armorcrate1", function(ent, ply)
if CurTime() < armor_delay1 then return 	ply:ChatPrint( "Crate still on cool down, Please try again later." ) end
 local armorcraterespawn1 = ents.Create("armor_crate")
			armorcraterespawn1:SetPos(cratespawn_location1)
			armorcraterespawn1:Spawn()
			armor_delay1 = CurTime() + armor_delay_config1
			ply:ChatPrint("Crate has spawned.")
	end )

medic_delay1 = 0
net.Receive( "mediccrate1", function(ent, ply)
if CurTime() < medic_delay1 then return 	ply:ChatPrint( "Crate still on cool down, Please try again later." ) end
 local mediccraterespawn1 = ents.Create("medic_crate")
			mediccraterespawn1:SetPos(cratespawn_location1)
			mediccraterespawn1:Spawn()
			medic_delay1 = CurTime() + medic_delay_config1
			ply:ChatPrint("Crate has spawned.")
	end )


weapon_delay1 = 0
net.Receive( "weaponcrate1", function(ent, ply)
if CurTime() < weapon_delay1 then return 	ply:ChatPrint( "Crate still on cool down, Please try again later." ) end
 local weaponraterespawn1 = ents.Create("weapon_crate")
			weaponraterespawn1:SetPos(cratespawn_location1)
			weaponraterespawn1:Spawn()
			weapon_delay1 = CurTime() + weapon_delay_config1
			ply:ChatPrint("Crate has spawned.")
	end )



function ENT:Think(ent)
if CurTime() < ammo_delay1 then ammo_status1 = "Not Ready"  else ammo_status1 = "Ready" end
if CurTime() < ammo_delay1 then ammo_colors1 = true else ammo_colors1 = false end

self:SetNWString('ammo_statuss1',ammo_status1)
if ammo_colors1 == true then
self:SetNWBool('ammo_color1', false)
else
self:SetNWBool('ammo_color1', true)
end 



if CurTime() < armor_delay1 then armor_status1 = "Not Ready"  else armor_status1 = "Ready" end
if CurTime() < armor_delay1 then armor_colors1 = true else armor_colors1 = false end

self:SetNWString('armor_statuss1',armor_status1)
if armor_colors1 == true then
self:SetNWBool('armor_color1', false)
else
self:SetNWBool('armor_color1', true)
end 


 if CurTime() < medic_delay1 then medic_status1 = "Not Ready"  else medic_status1 = "Ready" end
if CurTime() < medic_delay1 then medic_colors1 = true else medic_colors1 = false end

self:SetNWString('medic_statuss1',medic_status1)
if medic_colors1 == true then
self:SetNWBool('medic_color1', false)
else
self:SetNWBool('medic_color1', true)
end 


 if CurTime() < weapon_delay1 then weapon_status1 = "Not Ready"  else weapon_status1 = "Ready" end
if CurTime() < weapon_delay1 then weapon_colors1 = true else weapon_colors1 = false end

self:SetNWString('weapon_statuss1',weapon_status1)
if weapon_colors1 == true then
self:SetNWBool('weapon_color1', false)
else
self:SetNWBool('weapon_color1', true)
end 




end













	




















