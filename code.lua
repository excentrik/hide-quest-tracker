-- This file is loaded from "Hide Quest Tracker.toc"
local frame, events = CreateFrame("Frame"), {};
function events:PLAYER_REGEN_DISABLED(...)
 -- handle PLAYER_REGEN_DISABLED here
	--print(WatchFrame);
--	WatchFrame:Hide()	
	if GetZoneText()~="Proving Grounds" then
		ObjectiveTrackerFrame:Hide()
	        ObjectiveTrackerFrame.Show = ObjectiveTrackerFrame.Hide
	end
end
function events:PLAYER_REGEN_ENABLED(...)
 -- handle PLAYER_REGEN_ENABLED here
	ObjectiveTrackerFrame.Show = nil
        ObjectiveTrackerFrame:Show()
end
frame:SetScript("OnEvent", function(self, event, ...)
 events[event](self, ...); -- call one of the functions above
end);
for k, v in pairs(events) do
 frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end