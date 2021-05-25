--ffi start
local ffi = require("ffi")

ffi.cdef[[
    void* GetProcAddress(void* hModule, const char* lpProcName);
    void* GetModuleHandleA(const char* lpModuleName);
    
    typedef struct {
        uint8_t r;
        uint8_t g;
        uint8_t b;
        uint8_t a;
    } color_struct_t;

    typedef void (*console_color_print)(const color_struct_t&, const char*, ...);

    typedef void* (__thiscall* get_client_entity_t)(void*, int);
]]

local ffi_helpers = {
    color_print_fn = ffi.cast("console_color_print", ffi.C.GetProcAddress(ffi.C.GetModuleHandleA("tier0.dll"), "?ConColorMsg@@YAXABVColor@@PBDZZ")),
    color_print = function(self, text, color)
        local col = ffi.new("color_struct_t")

        col.r = color:r() * 255
        col.g = color:g() * 255
        col.b = color:b() * 255
        col.a = color:a() * 255

        self.color_print_fn(col, text)
    end
}
--ffi end

--console print start

local username = cheat.GetCheatUserName()

local console_print = 
{
    "-----------------------------------",
    "        Welcome "..username,
    "-----------------------------------",
    "This is an open source tabs system.",
    "-----------------------------------",
    "        Created by ak47hvh.",
    "-----------------------------------",
}

for i = 1, #console_print do

    ffi_helpers.color_print(ffi_helpers, "\n"..tostring(console_print[i]), Color.new(0.3, 0.88, 0.3, 1))

end

--console print end

--menu vars start

--Here you put for example g_Config:FindVar(string tab_name, string sub_tab_name, string group_name, string opt_name, string combo_val (optional))

--menu vars end

--Tabs System start

--main ui
local menuui = menu.Text("Tabs System", "Tabs System")
local tabs = menu.Combo("Tabs System", "Tabs", {"Ragebot", "Anti Aim", "Visuals", "Misc"}, 0, "")

--tabs
local ragebotui = menu.Text("Tabs System", "Ragebot")
local antiaimui = menu.Text("Tabs System", "Anti Aim")
local visualsui = menu.Text("Tabs System", "Visuals")
local miscui = menu.Text("Tabs System", "Misc")

--ragebot menu

--antiaim menu

--visuals menu

--misc menu

local function uisystem() --base ui system to keep the lua menu from getting cluttered.
    if tabs:GetInt() == 0 then
        ragebotui:SetVisible(true)
    else
        ragebotui:SetVisible(false)
    end

    if tabs:GetInt() == 1 then
        antiaimui:SetVisible(true)
    else
        antiaimui:SetVisible(false)
    end

    if tabs:GetInt() == 2 then
        visualsui:SetVisible(true)
    else
        visualsui:SetVisible(false)
    end

    if tabs:GetInt() == 3 then
        miscui:SetVisible(true)
    else
        miscui:SetVisible(false)
    end
end

--Tabs System end


--Callbacks start
cheat.RegisterCallback("frame_stage", uisystem)
--Callbacks end