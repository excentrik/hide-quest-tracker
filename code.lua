-- This file is loaded from "Hide Quest Tracker.toc"
local frame, events = CreateFrame("Frame"), {};
function events:PLAYER_REGEN_DISABLED(...)
 -- handle PLAYER_REGEN_DISABLED here
	WatchFrame:Hide()
        WatchFrame.Show = WatchFrame.Hide
end
function events:PLAYER_REGEN_ENABLED(...)
 -- handle PLAYER_REGEN_ENABLED here
	WatchFrame.Show = nil
        WatchFrame:Show()
end
frame:SetScript("OnEvent", function(self, event, ...)
 events[event](self, ...); -- call one of the functions above
end);
for k, v in pairs(events) do
 frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end