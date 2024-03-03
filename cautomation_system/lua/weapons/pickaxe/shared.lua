AddCSLuaFile("shared.lua")

SWEP.PrintName = "Pickaxe"
SWEP.Author = "Cosmothecat"
SWEP.Category = "Cautomation"
SWEP.Purpose = "Used to mine rocks."
SWEP.Instructions = "Left click to mine rocks."

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModel = "models/weapons/hl2meleepack/v_pickaxe.mdl"
SWEP.WorldModel = "models/weapons/hl2meleepack/w_pickaxe.mdl"
SWEP.DrawCrosshair 		= false

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Slot = 4
SWEP.SlotPos = 1		

SWEP.Primary.Ammo = "none"
SWEP.Secondary.Ammo = "none"

	

function SWEP:PrimaryAttack() 
	local tgt = self.Owner:GetEyeTrace()
if tgt.HitPos:Distance(self.Owner:GetShootPos()) <= 75 then
	local hit = self:GetOwner():GetEyeTrace().Entity
	self:SendWeaponAnim( ACT_VM_DRAW )
		self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
	    hit:EmitSound(Sound("physics/concrete/rock_impact_hard1.wav"))
	    hit:EmitSound(Sound("ambient/materials/rock1.wav"))




bullet = {}
			bullet.Num    = 1
			bullet.Src    = self.Owner:GetShootPos()
			bullet.Dir    = self.Owner:GetAimVector()
			bullet.Spread = Vector(0, 0, 0)
			bullet.Tracer = 0
			bullet.Force  = 1
			bullet.Damage = 4

self.Owner:FireBullets( bullet )

end
     self:SetNextPrimaryFire( CurTime() + 2 )
	end

function SWEP:SecondaryAttack()

	end