-- ------------------------------------------------------------------------------ --
--                            TradeSkillMaster_Mailing                            --
--            http://www.curse.com/addons/wow/tradeskillmaster_mailing            --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- TradeSkillMaster_Mailing Locale - zhCN
-- Please use the localization app on CurseForge to update this
-- http://wow.curseforge.com/addons/tradeskillmaster_mailing/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("TradeSkillMaster_Mailing", "zhCN")
if not L then return end

-- L["AH Mail:"] = ""
L[ [=[Automatically rechecks mail every 60 seconds when you have too much mail.

If you loot all mail with this enabled, it will wait and recheck then keep auto looting.]=] ] = [=[当你有过多邮件时，每60秒自动重新检查邮件。
若你启用此功能时打开所有邮件，插件将等待并重新检查以保持自动拾取。]=]
L["Auto Recheck Mail"] = "自动复查邮件"
L["BE SURE TO SPELL THE NAME CORRECTLY!"] = "请务必保证收件人姓名拼写的正确性!!!"
-- L["Bought %sx%d for %s from %s"] = ""
-- L["Buys"] = ""
L["Buy: %s (%d) | %s | %s"] = "竞拍获胜: %s (%d) | %s | %s"
-- L["Cancelled auction of %sx%d"] = ""
-- L["Cancels"] = ""
L["Cannot finish auto looting, inventory is full or too many unique items."] = "自动打开邮件无法完成，背包已满或者拥有过多唯一物品。"
--[==[ L[ [=[|cff99ffffShift-Click|r to automatically re-send after the amount of time specified in the TSM_Mailing options.
|cff99ffffCtrl-Click|r to perform a dry-run where Mailing doesn't send anything, but prints out what it would send (useful for testing your operations).]=] ] = "" ]==]
L["Clear"] = "清除"
-- L["Clicking this button clears the item box."] = ""
-- L["Click this button to automatically mail items in the groups which you have selected."] = ""
-- L["Click this button to mail the item to the specified character."] = ""
-- L["Click this button to send all disenchantable items in your bags to the specified character. You can set the maximum quality to be sent in the options."] = ""
-- L["Click this button to send excess gold to the specified character (Maximum of 200k per mail)."] = ""
L["COD Amount (per Item):"] = "邮件收费金额(每件):"
-- L["COD: %s | %s | (%s) | %s | %s"] = ""
L["Could not loot item from mail because your bags are full."] = "由于您的背包已满,无法再收取邮件。"
L["Could not send mail due to not having free bag space available to split a stack of items."] = "由于您的背包没有拆开堆叠的空间,无法发送出邮件。"
-- L["Default Mailing Page"] = ""
-- L["Delete Empty NPC Mail"] = ""
L["Display Total Money Received"] = "显示收取金币总额"
-- L["Done sending mail."] = ""
L["Drag (or place) the item that you want to send into this editbox."] = "将您想要邮寄的物品拖进编辑框。"
L["Enable Inbox Chat Messages"] = "开启对话框收件信息"
L["Enable Sending Chat Messages"] = "开启对话框发件信息"
-- L["Enter name of the character disenchantable items should be sent to."] = ""
L["Enter the desired COD amount (per item) to send this item with. Setting this to '0c' will result in no COD being set."] = "输入您希望的该物品邮寄时收取的费用(每件)。设置为 '0c' 将不会收取费用。"
L["Enter the name of the player you want to send excess gold to."] = "输入收取额外金币的收件人姓名。"
L["Enter the name of the player you want to send this item to."] = "输入收取这件物品的收件人姓名。"
L["Expired: %s | %s"] = "拍卖已到期: %s | %s"
-- L["Expires"] = ""
-- L["Failed to send mail:"] = ""
L["General"] = "常规"
L["General Settings"] = "常规设置"
-- L["Here you can select groups with TSM_Mailing operations to be automatically mailed to other characters."] = ""
-- L["If checked, a maximum quantity to send to the target can be set. Otherwise, Mailing will send as many as it can."] = ""
-- L["If checked, a 'Reload UI' button will be shown while waiting for the inbox to refresh. Reloading will cause the mailbox to refresh and may be faster than waiting for the next refresh."] = ""
L["If checked, information on mails collected by TSM_Mailing will be printed out to chat."] = "如果勾选，通过TSM_Mailing收取的邮件信息将会在聊天框里显示。"
L["If checked, information on mails sent by TSM_Mailing will be printed out to chat."] = "如果勾选，通过TSM_Mailing发送的邮件信息将会在聊天框里显示。"
-- L["If checked, mail from NPCs which have no attachments will automatically be deleted."] = ""
L["If checked, the Mailing tab of the mailbox will be the default tab."] = "如果勾选，Mailing标签的将被设定为邮箱的默认标签。"
L["If checked, the target's current inventory will be taken into account when determing how many to send. For example, if the max quantity is set to 10, and the target already has 3, Mailing will send at most 7 items."] = "如果勾选，当决定发送多少时,收件人当前的库存将被考虑进来。例如,如果最大的数量设置为10件,目标已经有3件,邮件将发送最多7件。"
L["If checked, the total amount of gold received will be shown at the end of automatically collecting mail."] = "如果勾选，收取的总金币数会显示在自动收件的最后。"
-- L["Inbox Settings"] = ""
-- L["Inbox update in %d seconds."] = ""
L["Item (Drag Into Box):"] = "物品(拖进列表):"
-- L["Keep Free Bag Space"] = ""
L["Keep Quantity"] = "保持数量"
-- L["Lastly, click this button to send the mail."] = ""
L["Limit (In Gold):"] = "限制(金):"
-- L["Lists the groups with mailing operations. Left click to select/deselect the group, Right click to expand/collapse the group."] = ""
-- L["Mail Disenchantables"] = ""
-- L["Mail Disenchantables Maximum Quality"] = ""
L["Mailing all to %s."] = "全部邮寄至 %s。"
L["Mailing operations contain settings for easy mailing of items to other characters."] = "Mailing操作的设置邮寄使邮寄更加便捷。"
L["Mailing up to %d to %s."] = "邮寄%d给%s。"
L["Mailing will keep this number of items in the current player's bags and not mail them to the target."] = "这是该物品的背包内最低保有量, 保有的物品不会被邮寄出去。"
-- L["Mailing will not send any disenchantable items above this quality to the target player."] = ""
-- L["Mailing would send the following items to %s:"] = ""
L["Mail Selected Groups"] = "邮寄选定分组"
L["Mail Send Delay"] = "邮寄时间间隔"
L["Make Mailing Default Mail Tab"] = "将Mailing设置为默认标签"
-- L["Maximum Quantity"] = ""
L["Max Quantity:"] = "最大数量:"
-- L["Move Group To Bags"] = ""
-- L["Move Group to Bank"] = ""
-- L["Move Non Group Items to Bank"] = ""
-- L["Move Target Shortfall To Bags"] = ""
L["Multiple Items"] = "多件物品"
L["No Item Specified"] = "没有指定物品"
L["No Target Player"] = "没有目标角色"
L["No Target Specified"] = "无指定目标"
-- L["Nothing to Move"] = ""
-- L["Not sending any gold as you either did not enter a limit or did not press enter to store the limit."] = ""
L["Not sending any gold as you have less than the specified limit."] = "没有邮寄金币,因为您的金币数量低于金币保有量。"
L["Not Target Specified"] = "没有指定目标"
-- L["Open All Mail"] = ""
-- L["Open Mail Complete Sound"] = ""
-- L["Opens all mail containing canceled auctions."] = ""
-- L["Opens all mail containing expired auctions."] = ""
-- L["Opens all mail containing gold from sales."] = ""
-- L["Opens all mail containing items you have bought."] = ""
-- L["Opens all mail in your inbox. If you have more than 50 items in your inbox, the opening will automatically continue when the inbox refreshes."] = ""
L["Operation Settings"] = "操作设置"
-- L["Optionally specify a per-item COD amount."] = ""
-- L["Play the selected sound when Mailing is done opening all mail."] = ""
-- L["Preparing to Move"] = ""
L["Quick Send"] = "快速发送"
L["Restart Delay (minutes)"] = "自动邮件重启延迟（分钟）"
L["Restock Target to Max Quantity"] = "对目标最大数量补货"
-- L["Sales"] = ""
L["Sale: %s (%d) | %s | %s"] = "拍卖成功: %s (%d) | %s | %s"
-- L["Send all %s to %s - No COD"] = ""
-- L["Send all %s to %s - %s per Item COD"] = ""
-- L["Send Disenchantable Items to %s"] = ""
-- L["Send Excess Gold to Banker"] = ""
L["Send Excess Gold to %s"] = "邮寄超额金币给 %s"
L["Sending..."] = "发送中..."
-- L["Sending Settings"] = ""
L["Send Items Individually"] = "单独发送每种物品"
L["Sends each unique item in a seperate mail."] = "使用单独的邮件发送每个唯一物品"
L["Send %sx%d to %s - No COD"] = "邮寄 %sx%d 给 %s - 不收费"
L["Send %sx%d to %s - %s per Item COD"] = "邮寄 %sx%d 给 %s - 单件收费 %s"
-- L["Sent all disenchantable items to %s."] = ""
L["Sent %s to %s."] = "邮寄%s给%s。"
L["Sent %s to %s with a COD of %s."] = "邮寄%s给%s附带收费%s。"
L["Set Max Quantity"] = "设置最大数量"
L["Sets the maximum quantity of each unique item to send to the target at a time."] = "设置单次邮寄的每种物品的最大邮寄量。"
-- L["Shift-Click|r to leave mail with gold."] = ""
-- L["Shift-Click|r to leave the fields populated after sending."] = ""
L["Showing all %d mail."] = "显示全部%d封邮件。"
L["Showing %d of %d mail."] = "显示 %d / %d 封邮件。"
-- L["Show Reload UI Button"] = ""
L["Skipping operation '%s' because there is no target."] = "由于没有目标,跳过操作 '%s' 。"
-- L["Sold [%s]x%d for %s to %s"] = ""
-- L["Sources to Include in Restock"] = ""
-- L["Sources to Include in Restock:"] = ""
-- L["Specifies the default page that'll show when you select the TSM_Mailing tab."] = ""
-- L["Specify the item to be mailed here."] = ""
-- L["Specify the target player and the maximum quantity to send."] = ""
-- L["%s sent you a COD of %s for %s"] = ""
-- L["%s sent you a message: %s"] = ""
-- L["%s sent you %s"] = ""
-- L["%s sent you %s and %s"] = ""
-- L["%sShift-Click|r to continue opening after an inbox refresh if you have more than 50 items in your inbox."] = ""
L["%s to collect."] = "%s等待收取。"
-- L["Stopped opening mail to keep %d slots free."] = ""
L["Target:"] = "收件人:"
L["Target is Current Player"] = "收件人是当前玩家"
L["Target Player"] = "收件人"
L["Target Player:"] = "收件人:"
-- L["Test Selected Sound"] = ""
L["The name of the player you want to mail items to."] = "您所希望的收件角色的姓名。"
-- L["The 'Open All Mail' button will open all mail in your inbox (including beyond the 50-mail limit). The AH mail buttons below that will open specific types of mail from your inbox."] = ""
-- L["These buttons change what is shown in the mailbox frame. You can view your inbox, automatically mail items in groups, quickly send items to other characters, and more in the various tabs."] = ""
-- L["These will toggle between the module specific tabs."] = ""
-- L["This button will de-select all groups."] = ""
-- L["This button will move all items in the selected groups using the restock target settings from the bank to your bags."] = ""
-- L["This button will move items in the selected groups from the bank to your bags."] = ""
-- L["This button will move items in the selected groups from your bags to the bank."] = ""
-- L["This button will move items NOT in the selected groups from your bags to the bank."] = ""
-- L["This button will select all groups."] = ""
-- L["This feature makes it easy to mail all of your disenchantable items to a specific character. You can change the maximum quality of items to be sent in the options."] = ""
-- L["This feature makes it easy to maintain a specific amount of gold on the current character."] = ""
L["This is maximum amount of gold you want to keep on the current player. Any amount over this limit will be send to the specified character."] = "这是您希望的当前角色金币保有量。多余的金币会被邮寄到指定角色(金库角色)。"
-- L["This is the maximum number of the specified item to send when you click the button below. Setting this to 0 will send ALL items."] = ""
-- L["This is where the items in your inbox are listed in an information and easy to read format."] = ""
L["This slider controls how long the mail sending code waits between consecutive mails. If this is set too low, you will run into internal mailbox errors."] = "此滑动条控制着连续发送邮件的间隔时间。若设置数值太低，会出现内部邮箱错误。"
-- L["This slider controls how much free space to keep in your bags when looting from the mailbox. This only applies to bags that any item can go in."] = ""
L["This tab allows you to quickly send any quantity of an item to another character. You can also specify a COD to set on the mail (per item)."] = "此标签允许您快速发送任何数量的物品给另一个角色。您也可以通过设置发送收费邮件(单件计费)。"
-- L["Total Gold Collected: %s"] = ""
L["TSM Groups"] = "TSM分组"
L["TSM_Mailing Excess Gold"] = "TSM_Mailing 超额金币"
L["When you shift-click a send mail button, after the initial send, it will check for new items to send at this interval."] = "当你shift+左键点击发送按钮, 初次邮寄后，将在设置的分钟数后检查新物品。"
-- L["Your auction of %s expired"] = ""
