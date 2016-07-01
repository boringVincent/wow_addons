local addonName, addon = ...
local _G = _G

-- GLOBALS: GameTooltip InterfaceOptionsFrame_OpenToCategory GetSortBagsRightToLeft SetSortBagsRightToLeft
-- GLOBALS: UIDropDownMenu_AddButton UIDropDownMenu_CreateInfo UIDropDownMenu_SetSelectedValue
-- GLOBALS: SLASH_AIO1

local AIO = CreateFrame('Frame', nil, InterfaceOptionsFramePanelContainer)
AIO:Hide()
AIO:SetAllPoints()
AIO.name = addonName

-- Some wrapper functions
local function checkboxGetCVar(self) return GetCVarBool(self.cvar) end
local function checkboxSetChecked(self) self:SetChecked(self:GetValue()) end
local function checkboxSetCVar(self, checked) SetCVar(self.cvar, checked) end
local function checkboxOnClick(self)
	local checked = self:GetChecked()
	PlaySound(checked and "igMainMenuOptionCheckBoxOn" or "igMainMenuOptionCheckBoxOff")
	self:SetValue(checked)
end

local function newCheckbox(parent, cvar, getValue, setValue)
	local cvarTable = addon.hiddenOptions[cvar]
	local label = cvarTable['prettyName'] or cvar
	local description = _G[cvarTable['description']] or cvarTable['description'] or 'No description'
	local check = CreateFrame("CheckButton", "AIOCheck" .. label, parent, "InterfaceOptionsCheckButtonTemplate")

	check.cvar = cvar
	check.GetValue = getValue or checkboxGetCVar
	check.SetValue = setValue or checkboxSetCVar
	check:SetScript('OnShow', checkboxSetChecked)
	check:SetScript("OnClick", checkboxOnClick)
	check.label = _G[check:GetName() .. "Text"]
	check.label:SetText(label)
	check.tooltipText = label
	check.tooltipRequirement = description
	return check
end

local title = AIO:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText(AIO.name)

local subText = AIO:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightSmall')
subText:SetMaxLines(3)
subText:SetNonSpaceWrap(true)
subText:SetJustifyV('TOP')
subText:SetJustifyH('LEFT')
subText:SetPoint('TOPLEFT', title, 'BOTTOMLEFT', 0, -8)
subText:SetPoint('RIGHT', -32, 0)
subText:SetText('These options allow you to toggle various options that have been removed from the game in Legion.')

local playerTitles = newCheckbox(AIO, 'UnitNamePlayerPVPTitle')
local playerGuilds = newCheckbox(AIO, 'UnitNamePlayerGuild')
local playerGuildTitles = newCheckbox(AIO, 'UnitNameGuildTitle')
local stopAutoAttack = newCheckbox(AIO, 'stopAutoAttackOnTargetChange')
local attackOnAssist = newCheckbox(AIO, 'assistAttack')
local autoSelfCast = newCheckbox(AIO, 'autoSelfCast')
local castOnKeyDown = newCheckbox(AIO, 'ActionButtonUseKeyDown')
local fadeMap = newCheckbox(AIO, 'mapFade')
local secureToggle = newCheckbox(AIO, 'secureAbilityToggle')
local luaErrors = newCheckbox(AIO, 'scriptErrors')
local lootUnderMouse = newCheckbox(AIO, 'lootUnderMouse')
local targetDebuffFilter = newCheckbox(AIO, 'noBuffDebuffFilterOnTarget')
local reverseCleanupBags = newCheckbox(AIO, 'reverseCleanupBags',
	-- Get Value
	function(self)
		return GetSortBagsRightToLeft()
	end,
	-- Set Value
	function(self, checked)
		SetSortBagsRightToLeft(checked)
	end
)


local questSortingLabel = AIO:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightSmall')
questSortingLabel:SetPoint('TOPLEFT', reverseCleanupBags, 'BOTTOMLEFT', 0, 0)
questSortingLabel:SetText('Select quest sorting mode:')

local questSortingDropdown = CreateFrame("Frame", "AIOQuestSorting", AIO, "UIDropDownMenuTemplate")
questSortingDropdown:SetPoint("TOPLEFT", questSortingLabel, "BOTTOMLEFT", -16, -10)
questSortingDropdown.initialize = function(dropdown)
	local sortMode = { "top", "proximity" }
	for i, mode in next, sortMode do
		local info = UIDropDownMenu_CreateInfo()
		info.text = sortMode[i]
		info.value = sortMode[i]
		info.func = function(self)
			SetCVar("trackQuestSorting", self.value)
			UIDropDownMenu_SetSelectedValue(dropdown, self.value)
		end
		UIDropDownMenu_AddButton(info)
	end
	UIDropDownMenu_SetSelectedValue(dropdown, (GetCVarInfo("trackQuestSorting")))
end
questSortingDropdown:HookScript("OnShow", questSortingDropdown.initialize)

local actionCamModeLabel = AIO:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightSmall')
actionCamModeLabel:SetPoint('TOPLEFT', questSortingDropdown, 'BOTTOMLEFT', 16, 0)
actionCamModeLabel:SetText('Select Action Cam mode:')

local actionCamModeDropdown = CreateFrame("Frame", "AIOActionCamMode", AIO, "UIDropDownMenuTemplate")
actionCamModeDropdown:SetPoint("TOPLEFT", actionCamModeLabel, "BOTTOMLEFT", -16, -10)
actionCamModeDropdown.initialize = function(dropdown)
	local sortMode = { "basic", "full", "off", "default" }
	for i, mode in next, sortMode do
		local info = UIDropDownMenu_CreateInfo()
		info.text = sortMode[i]
		info.value = sortMode[i]
		info.func = function(self)
			ConsoleExec("actioncam "..self.value)
			UIDropDownMenu_SetSelectedValue(dropdown, self.value)
		end
		UIDropDownMenu_AddButton(info)
	end
	UIDropDownMenu_SetSelectedValue(dropdown, "off") -- TODO: This is wrong, obviously
end
actionCamModeDropdown:HookScript("OnShow", actionCamModeDropdown.initialize)

playerTitles:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -8)
playerGuilds:SetPoint("TOPLEFT", playerTitles, "BOTTOMLEFT", 0, -4)
playerGuildTitles:SetPoint("TOPLEFT", playerGuilds, "BOTTOMLEFT", 0, -4)
stopAutoAttack:SetPoint("TOPLEFT", playerGuildTitles, "BOTTOMLEFT", 0, -4)
attackOnAssist:SetPoint("TOPLEFT", stopAutoAttack, "BOTTOMLEFT", 0, -4)
autoSelfCast:SetPoint("TOPLEFT", attackOnAssist, "BOTTOMLEFT", 0, -4)
castOnKeyDown:SetPoint("TOPLEFT", autoSelfCast, "BOTTOMLEFT", 0, -4)
fadeMap:SetPoint("TOPLEFT", castOnKeyDown, "BOTTOMLEFT", 0, -4)
secureToggle:SetPoint("TOPLEFT", fadeMap, "BOTTOMLEFT", 0, -4)
luaErrors:SetPoint("TOPLEFT", secureToggle, "BOTTOMLEFT", 0, -4)
lootUnderMouse:SetPoint("TOPLEFT", luaErrors, "BOTTOMLEFT", 0, -4)
targetDebuffFilter:SetPoint("TOPLEFT", lootUnderMouse, "BOTTOMLEFT", 0, -4)
reverseCleanupBags:SetPoint("TOPLEFT", targetDebuffFilter, "BOTTOMLEFT", 0, -4)

-- TODO reducedLagTolerance maxSpellStartRecoveryOffset


-- Chat settings
local AIO_Chat = CreateFrame('Frame', nil, InterfaceOptionsFramePanelContainer)
AIO_Chat:Hide()
AIO_Chat:SetAllPoints()
AIO_Chat.name = "Chat"
AIO_Chat.parent = addonName

local Title_Chat = AIO_Chat:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge')
Title_Chat:SetJustifyV('TOP')
Title_Chat:SetJustifyH('LEFT')
Title_Chat:SetPoint('TOPLEFT', 16, -16)
Title_Chat:SetText(AIO_Chat.name)

local SubText_Chat = AIO_Chat:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightSmall')
SubText_Chat:SetMaxLines(3)
SubText_Chat:SetNonSpaceWrap(true)
SubText_Chat:SetJustifyV('TOP')
SubText_Chat:SetJustifyH('LEFT')
SubText_Chat:SetPoint('TOPLEFT', Title_Chat, 'BOTTOMLEFT', 0, -8)
SubText_Chat:SetPoint('RIGHT', -32, 0)
SubText_Chat:SetText('These options allow you to modify chat settings.') -- TODO

local chatStyleLabel = AIO_Chat:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightSmall')
chatStyleLabel:SetPoint('TOPLEFT', SubText_Chat, 'BOTTOMLEFT', 0, -12)
chatStyleLabel:SetText('Select chat style:')

local chatMouseScroll = newCheckbox(AIO_Chat, 'chatMouseScroll')
local chatDelay = newCheckbox(AIO_Chat, 'removeChatDelay')
local chatStyleDropdown = CreateFrame("Frame", "AIO_chatStyle", AIO_Chat, "UIDropDownMenuTemplate")

chatStyleDropdown:SetPoint("TOPLEFT", chatStyleLabel, "BOTTOMLEFT", -16, -10)
chatStyleDropdown.initialize = function(dropdown)
	local chatStyle = { "im", "classic" }
	for i, mode in next, chatStyle do
		local info = UIDropDownMenu_CreateInfo()
		info.text = chatStyle[i]
		info.value = chatStyle[i]
		info.func = function(self)
			SetCVar("chatStyle", self.value)
			UIDropDownMenu_SetSelectedValue(dropdown, self.value)
		end
		UIDropDownMenu_AddButton(info)
	end
	UIDropDownMenu_SetSelectedValue(dropdown, GetCVarInfo("chatStyle"))
end
chatStyleDropdown:HookScript("OnShow", chatStyleDropdown.initialize)

chatDelay:SetPoint('TOPLEFT', chatStyleDropdown, 'BOTTOMLEFT', 16, -12)
chatMouseScroll:SetPoint('TOPLEFT', chatDelay, 'BOTTOMLEFT', 0, -4)


-- Floating Combat Text settings
local AIO_FCT = CreateFrame('Frame', nil, InterfaceOptionsFramePanelContainer)
AIO_FCT:Hide()
AIO_FCT:SetAllPoints()
AIO_FCT.name = "Floating Combat Text"
AIO_FCT.parent = addonName

local Title_FCT = AIO_FCT:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge')
Title_FCT:SetJustifyV('TOP')
Title_FCT:SetJustifyH('LEFT')
Title_FCT:SetPoint('TOPLEFT', 16, -16)
Title_FCT:SetText(AIO_FCT.name)

local SubText_FCT = AIO_FCT:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightSmall')
SubText_FCT:SetMaxLines(3)
SubText_FCT:SetNonSpaceWrap(true)
SubText_FCT:SetJustifyV('TOP')
SubText_FCT:SetJustifyH('LEFT')
SubText_FCT:SetPoint('TOPLEFT', Title_FCT, 'BOTTOMLEFT', 0, -8)
SubText_FCT:SetPoint('RIGHT', -32, 0)
SubText_FCT:SetText('These options allow you to modify Floating Combat Text Options.')

local fctfloatmodeLabel = AIO_FCT:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightSmall')
fctfloatmodeLabel:SetPoint('TOPLEFT', SubText_FCT, 'BOTTOMLEFT', 0, -4)
fctfloatmodeLabel:SetText('Select text float mode: 1 = UP, 2 = DOWN, 3 = ARC (requires UI reload to apply)')

local fctfloatmodeDropdown = CreateFrame("Frame", "AIOfctFloatMode", AIO_FCT, "UIDropDownMenuTemplate")
fctfloatmodeDropdown:SetPoint("TOPLEFT", fctfloatmodeLabel, "BOTTOMLEFT", -16, -10)
fctfloatmodeDropdown.initialize = function(dropdown)
	local floatMode = { "1", "2", "3" }
	for i, mode in next, floatMode do
		local info = UIDropDownMenu_CreateInfo()
		info.text = floatMode[i]
		info.value = floatMode[i]
		info.func = function(self)
			SetCVar("floatingCombatTextFloatMode", self.value)
			UIDropDownMenu_SetSelectedValue(dropdown, self.value)
		end
		UIDropDownMenu_AddButton(info)
	end
	UIDropDownMenu_SetSelectedValue(dropdown, GetCVarInfo("floatingCombatTextFloatMode"))
end
fctfloatmodeDropdown:HookScript("OnShow", fctfloatmodeDropdown.initialize)

local fctEnergyGains = newCheckbox(AIO_FCT, 'floatingCombatTextEnergyGains')
local fctAuras = newCheckbox(AIO_FCT, 'floatingCombatTextAuras')
local fctReactives = newCheckbox(AIO_FCT, 'floatingCombatTextReactives')
local fctHonorGains = newCheckbox(AIO_FCT, 'floatingCombatTextHonorGains')
local fctRepChanges = newCheckbox(AIO_FCT, 'floatingCombatTextRepChanges')
local fctComboPoints = newCheckbox(AIO_FCT, 'floatingCombatTextComboPoints')
local fctCombatState = newCheckbox(AIO_FCT, 'floatingCombatTextCombatState')
local fctSpellMechanics = newCheckbox(AIO_FCT, 'floatingCombatTextSpellMechanics')
local fctHealing = newCheckbox(AIO_FCT, 'floatingCombatTextCombatHealing')
local fctAbsorbSelf = newCheckbox(AIO_FCT, 'floatingCombatTextCombatHealingAbsorbSelf')
local fctAbsorbTarget = newCheckbox(AIO_FCT, 'floatingCombatTextCombatHealingAbsorbTarget')
local fctDirectionalScale = newCheckbox(AIO_FCT, 'floatingCombatTextCombatDamageDirectionalScale')

fctEnergyGains:SetPoint("TOPLEFT", fctfloatmodeDropdown, "BOTTOMLEFT", 16, -12)
fctAuras:SetPoint("TOPLEFT", fctEnergyGains, "BOTTOMLEFT", 0, -4)
fctHonorGains:SetPoint("TOPLEFT", fctAuras, "BOTTOMLEFT", 0, -4)
fctRepChanges:SetPoint("TOPLEFT", fctHonorGains, "BOTTOMLEFT", 0, -4)
fctComboPoints:SetPoint("TOPLEFT", fctRepChanges, "BOTTOMLEFT", 0, -4)
fctCombatState:SetPoint("TOPLEFT", fctComboPoints, "BOTTOMLEFT", 0, -4)
fctSpellMechanics:SetPoint("TOPLEFT", fctCombatState, "BOTTOMLEFT", 0, -4)
fctHealing:SetPoint("TOPLEFT", fctSpellMechanics, "BOTTOMLEFT", 0, -4)
fctAbsorbSelf:SetPoint("TOPLEFT", fctHealing, "BOTTOMLEFT", 0, -4)
fctAbsorbTarget:SetPoint("TOPLEFT", fctAbsorbSelf, "BOTTOMLEFT", 0, -4)
fctDirectionalScale:SetPoint("TOPLEFT", fctAbsorbTarget, "BOTTOMLEFT", 0, -4)


-- Hook up options to addon panel
InterfaceOptions_AddCategory(AIO, addonName)
InterfaceOptions_AddCategory(AIO_Chat, addonName)
InterfaceOptions_AddCategory(AIO_FCT, addonName)


-- Slash handler
SlashCmdList.AIO = function(msg)
	--msg = msg:lower()
	InterfaceOptionsFrame_OpenToCategory(addonName)
	InterfaceOptionsFrame_OpenToCategory(addonName)
end
SLASH_AIO1 = "/aio"
