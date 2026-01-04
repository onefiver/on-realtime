onNet("RealTime:SetTimezone", (hour, minute) => {
    NetworkOverrideClockTime(hour, minute, 0);
});
