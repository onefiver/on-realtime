setInterval(() => {
    const date = new Date(new Date().toLocaleString("en-US", { timeZone: Config.Timezone }));

    const hour = date.getHours();
    const minute = date.getMinutes();

    emitNet("RealTime:SetTimezone", -1, hour, minute);
}, 1000);
