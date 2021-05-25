-- Tabs System start

-- main ui
local list = {"Ragebot", "Anti Aim", "Visuals", "Misc"}
local tabs = menu.Combo("Tabs System", "Tabs", list, 0, "")

-- tabs
local menu_tabs = {
    ["Ragebot"] = {
        menu.Text("Tabs System", "Ragebot"),
        menu.Switch("Tabs System", "Ragebot_Switch", false)
    },
    ["Anti Aim"] = {
        menu.Text("Tabs System", "Anti Aim")
    },
    ["Visuals"] = {
        menu.Text("Tabs System", "Visuals")
    },
    ["Misc"] = {
        menu.Text("Tabs System", "Misc")
    }
}

-- callback
local function uisystem() -- base ui system to keep the lua menu from getting cluttered.
    local current = tabs:GetInt()

    for k, t in pairs(menu_tabs) do -- loop thru menu_tabs and get the key (f.e. Ragebot) and the table of menu elements 
        for i, v in pairs(t) do -- loop thru the table of menu elements and change visiblity
            if k == list[current + 1] then v:SetVisible(true) else v:SetVisible(false) end
        end
    end
end

-- Tabs System end


-- Register callback that gets fired everytime you change a tab
tabs:RegisterCallback(uisystem)
uisystem() -- call once on startup