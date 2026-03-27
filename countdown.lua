-- OBS Countdown Script (Lua)
-- Lets you set a start time and counts down to zero

obs           = obslua
source_name   = ""
start_minutes = 1
start_seconds = 0
remaining     = 0
timer_active  = false

------------------------------------------------------------

function update_text()
    local source = obs.obs_get_source_by_name(source_name)
    if source ~= nil then
        local minutes = math.floor(remaining / 60)
        local seconds = remaining % 60

        local text = string.format("%02d:%02d", minutes, seconds)
        local settings = obs.obs_data_create()
        obs.obs_data_set_string(settings, "text", text)
        obs.obs_source_update(source, settings)
        obs.obs_data_release(settings)
        obs.obs_source_release(source)
    end
end

------------------------------------------------------------

function timer_callback()
    if timer_active then
        if remaining > 0 then
            remaining = remaining - 1
            update_text()
        else
            timer_active = false
            obs.timer_remove(timer_callback)
        end
    end
end

------------------------------------------------------------

function script_update(settings)
    source_name   = obs.obs_data_get_string(settings, "source")
    start_minutes = obs.obs_data_get_int(settings, "minutes")
    start_seconds = obs.obs_data_get_int(settings, "seconds")

    remaining = start_minutes * 60 + start_seconds
    update_text()
end

------------------------------------------------------------

function script_properties()
    local props = obs.obs_properties_create()

    local list = obs.obs_properties_add_list(
        props, "source", "Text Source",
        obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING
    )

    local sources = obs.obs_enum_sources()
    if sources ~= nil then
        for _, src in ipairs(sources) do
            local name = obs.obs_source_get_name(src)
            obs.obs_property_list_add_string(list, name, name)
        end
    end
    obs.source_list_release(sources)

    obs.obs_properties_add_int(props, "minutes", "Start Minutes", 0, 600, 1)
    obs.obs_properties_add_int(props, "seconds", "Start Seconds", 0, 59, 1)

    obs.obs_properties_add_button(props, "start", "Start Countdown", start_countdown)

    return props
end

------------------------------------------------------------

function start_countdown(props, prop)
    remaining = start_minutes * 60 + start_seconds
    timer_active = true
    obs.timer_add(timer_callback, 1000)
    return true
end

------------------------------------------------------------

function script_description()
    return "Simple countdown timer that updates a Text Source."
end
