AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.OurHealth = 1500 -- Amount of damage that the entity can handle - set to 0 to make it indestructible


function ENT:Initialize()
	self.Entity:SetModel("models/props_c17/FurnitureFireplace001a.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	local phys = self.Entity:GetPhysicsObject()

	if (phys:IsValid()) then
		phys:Wake()
	end

	self.isSmelt = false
	self.finishsmelt = 0
	self.titanium = false
	self.iron = false
	self.silver = false
	self.copper = false
end

function ENT:StartTouch(ent)
	if ent:GetClass() == "ironore" and self.isSmelt == false then
		ent:Remove()
		self.iron = true
		self.isSmelt = true
		self.finishsmelt = CurTime() + 10
		
	end



	if ent:GetClass() == "titaniumore" and self.isSmelt == false then
		ent:Remove()
		self.isSmelt = true
		self.finishsmelt = CurTime() + 200
		self.titanium = true
	end

	if ent:GetClass() == "copperore" and self.isSmelt == false then
		ent:Remove()
		self.isSmelt = true
		self.finishsmelt = CurTime() + 200
		self.copper = true

	end


if ent:GetClass() == "silverore" and self.isSmelt == false then
		ent:Remove()
		self.isSmelt = true
		self.finishsmelt = CurTime() + 200
		self.silver = true

	end

end

function ENT:Think()

if self.isSmelt == true then
	self:SetNWString( "Status", "Online" ) 
else
	self:SetNWString( "Status", "Offline" ) 
end


	if self.silver == true and self.isSmelt == true then
		if self.finishsmelt <= CurTime() then
			self.isSmelt = false
			local silvers = ents.Create("silver")
			silvers:SetPos(self:GetPos() + Vector(0, 0, 80))
			silvers:Spawn()
			self.silver = false
		end
	end



	if self.titanium == true and self.isSmelt == true then
		if self.finishsmelt <= CurTime() then
			self.isSmelt = false
			local titaniums = ents.Create("titanium")
			titaniums:SetPos(self:GetPos() + Vector(0, 0, 80))
			titaniums:Spawn()
			self.titanium = false
		end
	end



	if self.copper == true and self.isSmelt == true then
		if self.finishsmelt <= CurTime() then
			self.isSmelt = false
			local copper = ents.Create("copper")
			copper:SetPos(self:GetPos() + Vector(0, 0, 80))
			copper:Spawn()
			self.copper = false
		end
	end

	if self.iron == true and self.isSmelt == true then
		if self.finishsmelt <= CurTime() then
			self.isSmelt = false
			local iron = ents.Create("iron")
			iron:SetPos(self:GetPos() + Vector(0, 0, 80))
			iron:Spawn()
			self.iron = false



		end
	end



end



function ENT:OnTakeDamage(dmg)
	self:TakePhysicsDamage(dmg) -- React physically when getting shot/blown
	if (self.OurHealth <= 0) then return end -- If the health-variable is already zero or below it - do nothing
	self.OurHealth = self.OurHealth - dmg:GetDamage() -- Reduce the amount of damage took from our health-variable

	-- If our health-variable is zero or below it
	if (self.OurHealth <= 0) then
		self:Remove() -- Remove our entity
	end
end
