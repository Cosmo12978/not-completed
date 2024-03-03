include("shared.lua")

    surface.CreateFont( "MARKMENUFONT", {
    font = "Roboto",
    size = 30,
    weight = 650,
    shadow = true,
    antialias = false,
});




function ENT:Draw()
    self:DrawModel()
    local Pos = self:GetPos()
    local Ang = Angle( 0, 0, 0)
    surface.SetFont("MARKMENUFONT")
    Ang:RotateAroundAxis(Ang:Forward(), 90)
    local TextAng = Ang
    TextAng:RotateAroundAxis(TextAng:Right(), -90)
    cam.Start3D2D(Pos + Ang:Right() * -17, Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.1)
        draw.WordBox(.9, -50, 0, "markertext", "MARKMENUFONT", Color(0, 0, 0, 155), Color(255, 255, 255, 155)) -- WORDBOX TEXT AND COLOR VAL HERE
    cam.End3D2D()
end




net.Receive( "openmarkereditor", function( len, ply )  --- After USE ( press e ) on server it opens this

  markercreationui = vgui.Create("DFrame")
  markercreationui:SetSize(550, 350)
  markercreationui:SetPos((ScrW() / 2) - 350, (ScrH() / 2) - 200)
  markercreationui:MakePopup()
  markercreationui:SetTitle("Marker Creation Menu")
  markercreationui:SetBackgroundBlur("true")

--- COLOR
local Mixer = vgui.Create("DColorMixer", markercreationui)
Mixer:SetSize(200,200)
Mixer:SetPos(160,120)               
Mixer:SetPalette(true)              
Mixer:SetAlphaBar(false)             
Mixer:SetWangs(true)                
Mixer:SetColor(Color(30,100,160))   
Mixer.ValueChanged = function()
       local mixercolor = Mixer:GetColor() -- COLOR BE ABLE TO BE CUSTOM
end


local DLabel = vgui.Create( "DLabel", markercreationui )
DLabel:SetPos( 610, 130 )
DLabel:SetText( "Marker Color" )

---- TXT ENTRY

    local TextEntryPH = vgui.Create( "DTextEntry", markercreationui )
    TextEntryPH:SetPos(65,50)
    TextEntryPH:SetSize(400,26)
    TextEntryPH:SetPlaceholderText( "Fill Text Here and Text Color Below" )
    TextEntryPH.OnEnter = function( self )
         local markertext = self:GetValue() --- TEXT VALUE NEEDED TO BE DISPLAYED IN WORDBOX ( ABOVE LINE 23 ) BUT UNIQUE FOR EACH ENTITY 
          
          
    end

end)

