include("shared.lua")

function ENT:Draw()

    self:DrawModel()



	net.Receive( "garagemenu", function()

	local Cargarage = vgui.Create( "DFrame" ) 	
Cargarage:SetPos(430,100)			
Cargarage:SetSize( 1000, 800 ) 				
Cargarage:SetTitle( "" ) 		
Cargarage:MakePopup("Vehicle Title Font")
Cargarage:SetDraggable(false)
Cargarage:SetBackgroundBlur(true)
Cargarage:ShowCloseButton(false)

local background = vgui.Create("DImage", Cargarage)
background:SetPos(0, 0)	
background:SetSize(1000, 800)	
background:SetImage("materials/pngs/garage.png")


local car1spawn = vgui.Create( "DButton", Cargarage ) 
car1spawn:SetText( "Spawn" )					
car1spawn:SetPos( 340, 700 )					
car1spawn:SetSize( 150, 40 )
car1spawn:Paint( 100, 30 )		
car1spawn.Paint = function() -- The paint function
    surface.SetDrawColor( 4, 255, 0,1000 ) -- What color do You want to paint the button (R, B, G, A)	
    surface.DrawRect( 0, 0, car1spawn:GetWide(), car1spawn:GetTall())
  	end					
car1spawn.DoClick = function()	
	Cargarage:Close()						
	net.Start( "car1_spawned" )
	net.SendToServer()	
end 

local closemenu = vgui.Create( "DButton", Cargarage ) 
closemenu:SetText( "Close" )					
closemenu:SetPos( 540, 700 )					
closemenu:SetSize( 150, 40 )
closemenu:Paint( 100, 30 )		
closemenu.Paint = function() -- The paint function
    surface.SetDrawColor( 255, 0, 0,1000 ) -- What color do You want to paint the button (R, B, G, A)	
    surface.DrawRect( 0, 0, closemenu:GetWide(), closemenu:GetTall())

  	end
closemenu.DoClick = function()	
	Cargarage:Close()						
end 


local player = LocalPlayer()

 if player:IsSuperAdmin()
 	then
 	admin_menu()
 	else
 	end

end)

function admin_menu()

local frame = vgui.Create( "DFrame" )
frame:SetSize( 300, 300 )
frame:Center()
frame:MakePopup()
frame:SetTitle( "Admin Menu" ) 


local DCollapsible = vgui.Create( "DCollapsibleCategory", frame )	-- Create a collapsible category
DCollapsible:SetLabel( "Set Spawn Values" )						-- Set the name ( label )
DCollapsible:SetPos( 25, 50 )		-- Set position
DCollapsible:SetSize( 250, 100 )	-- Set size
DCollapsible:SetExpanded( false )	-- Start collapsed
 
local DermaList = vgui.Create( "DPanelList", DermaPanel ) -- Make a list of items to add to our category (collection of controls)
DermaList:SetSpacing( 5 )							-- Set the spacing between items
DermaList:EnableHorizontal( false )					-- Only vertical items
DermaList:EnableVerticalScrollbar( false )			-- Enable the scrollbar if (the contents are too wide)
DCollapsible:SetContents( DermaList )				-- Add DPanelList to our Collapsible Category
 
local CategoryItemOne = vgui.Create( "DTextEntry" )
	CategoryItemOne:Dock( TOP )
	CategoryItemOne:DockMargin( 0, 0, 0, 0 )
	CategoryItemOne:SetPlaceholderText( "Vector: Put a space between the vectors like x y x" )
	CategoryItemOne.OnEnter = function( self )
		chat.AddText("Car spawn set to ", self:GetValue() )
		spawn_point = self:GetValue()
		net.Start("car_spawn_point")
		net.WriteVector(Vector(spawn_point))
            net.SendToServer()	
	end		
	DermaList:AddItem( CategoryItemOne )		
end



















end








