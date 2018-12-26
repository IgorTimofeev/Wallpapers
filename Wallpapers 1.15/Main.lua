-- 1.15
-- подключаем библеотеку.
local GUI = require("GUI")
local MineOSInterface = require("MineOSInterface")
local MineOSCore = require("MineOSCore")
local computer = require("computer")
local fs = require("filesystem") -- опа, что то новое будет.
-- указываем локализацию (языки)
local resourcesPath = MineOSCore.getCurrentScriptDirectory()
local localization = MineOSCore.getLocalization(resourcesPath .. "Localizations/")

local pictures = { -- Список обоев.
  "Tatu",
  "WinterSunrise",
  "Nocturnal",
  "AhsokaTano",
  "Sea",
  "Sea-mountains",
  "moscow",
  "Piter",
  "Nice_girl",
  "Win_10",
  "texture",
  "Winter_National",
  "Car",
  "field",
  "Colors",
  "CPU",
  "Surgut",
  "Forest",
  "Sea-2",
  "Hard_disk",
  "Kiev",
  "Color_Skull",
  "winter_fun",
  "Squirrel",
  "Ferret",
  "Android_P",
  "Android_O",
  "Android_N",
  "Android_M",
  "Redstone",
  "Linux",
  "Code",
  "Anonumys", -- анонимус, отсосимус!
  "MineCraft", 
  "Apple", 
  "Trap_nation",
  "Ryzen",
  "Ryazan",
  "Raspberry",
  "Firefox",
  "Scrimer",
  "lox",
  "Anime",
  "seashell",
  "Ice_haze",
  "Sea_wave",
  "3D_Cat",
  "Github",
  "lake_forest_mountains",
  "Nvidia",
  "wave_in_the_ocean",
  "Strawberry_cocktail",
  "Matrix",
  "Intel_Inside",
  "Rammstein", 
  "Google", 
  "TED",
  "Little_big",  
  "Yandex",
  "Cat",
  "Sea-Night",
  "IMac",
  "Mojave",
  "Mojave_Night",
  "yosemite",
  "Omen",
  "Helloween",
  "NewYork",
  "Sunset",
  "CalfMountains",
  "China",
  "japan",
  "SnowMountains",
  "Lineage_os",
  "Flyme",
  "MIUI",
  "steam",
  "Urban",
  "NewYear",
  "acer",
  "vaio",
  "xbox360",
}

local application, window = MineOSInterface.addWindow(GUI.titledWindow(1, 1, 145, 35, "Wallpapers", false)) --  окно

application.menu:addItem(localization.author).onTouch = function() -- вкладка "Автор"
 local container = GUI.addBackgroundContainer(application, true, true, localization.author1) -- тут все понятно..
end

local x, y, width, horizontalSpace, verticalSpace = 3, 3, 8, 2, 1 
for i = 1, #pictures do
  window:addChild(GUI.text(x, y, 0x878787, string.limit(pictures[i], width))) -- название обоины.
  window:addChild(GUI.roundedButton(x, y + 1, width, 3, 0x969696, 0xE1E1E1, 0x696969, 0x969696, localization.download)).onTouch = function() -- кнопка скачать
    local file = pictures[i] .. ".pic"  
    
        loadfile("/bin/wget.lua")("https://github.com/Fronun/Wallpapers/raw/master/wall/" .. file, "/MineOS/Pictures/" .. file, "-FQ")
      computer.beep() 
      os.sleep(1.000)
    GUI.alert(localization.warning ..file)
      
  end

  x = x + width + horizontalSpace
  if x + width > window.width then
    x, y = 3, y + verticalSpace + 4

  end
end

window.onResize = function(width, height)
  window.backgroundPanel.width = width
  window.backgroundPanel.height = height
 end

window:resize(window.width, window.height)


application:draw()
