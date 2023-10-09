module ThermiaAPI

ENV["JULIA_CONDAPKG_BACKEND"] = "Null"
ENV["JULIA_PYTHONCALL_EXE"] = "python3"
using PythonCall

const thermia = Ref(Py(nothing))
const heat_pump = Ref(Py(nothing))

function __init__()
    ENV["JULIA_CONDAPKG_BACKEND"] = "Null"
    ENV["JULIA_PYTHONCALL_EXE"] = "python3"
    global USERNAME = ENV["THERMIA_USERNAME"]
    global PASSWORD = ENV["THERMIA_PASSWORD"]
    global API_TYPE = ENV["THERMIA_API_TYPE"]


    path = get(ENV, "THERMIA_PATH", nothing)
    if path !== nothing
        @info "Adding ThermiaAPI $path to python path"
        sys = pyimport("sys")
        sys.path.append(path)
    end

    global thermia, heat_pump
    @info "Connecting to ThermiaOnlineAPI"
    ThermiaOnlineAPI = pyimport("ThermiaOnlineAPI")
    for i = 1:5
        sleeptime = 3
        try
            thermia[] = ThermiaOnlineAPI.Thermia(USERNAME, PASSWORD, api_type=API_TYPE)
            @info "Fetching heat pumps"
            heat_pump[] = thermia[].fetch_heat_pumps()[0]
            break
        catch
            @error "Failed to connect to ThermiaOnlineAPI, retrying in $sleeptime seconds"
            sleep(sleeptime)
            sleeptime *= 2
        end
    end
end
@enum OperationalStatus STATUS_MANUAL=1 STATUS_DEFROST=2 STATUS_HOTWATER=4 STATUS_HEAT=8 STATUS_COOL=16 STATUS_POOL=32 STATUS_LEGIONELLA=64 STATUS_PASSIVE_COOL=128 STATUS_STANDBY=512 STATUS_NO_DEMAND=1024 OPERATION_MODE_OFF=2048


export get_all_available_register_groups,
get_operational_status,
get_supply_line_temperature,
get_desired_supply_line_temperature,
get_return_line_temperature,
get_brine_out_temperature,
get_brine_in_temperature,
get_cooling_tank_temperature,
get_cooling_supply_line_temperature,
get_operational_status,
get_available_operational_statuses,
get_available_operational_statuses_map,
get_operational_status_auxiliary_heater_3kw,
get_operational_status_auxiliary_heater_6kw,
get_operational_status_auxiliary_heater_9kw,
get_operational_status_auxiliary_heater_12kw,
get_operational_status_auxiliary_heater_15kw,
get_operational_status_compressor_status,
get_operational_status_brine_pump_status,
get_operational_status_radiator_pump_status,
get_operational_status_cooling_status,
get_operational_status_hot_water_status,
get_operational_status_heating_status,
get_operational_status_integral,
get_operational_status_pid,
get_compressor_operational_time,
get_hot_water_operational_time,
get_auxiliary_heater_1_operational_time,
get_auxiliary_heater_2_operational_time,
get_auxiliary_heater_3_operational_time,
get_active_alarm_count,
get_active_alarm_count,
get_active_alarms,
get_operation_mode,
get_available_operation_modes,
get_available_operation_mode_map,
get_is_operation_mode_read_only,
get_hot_water_switch_state,
get_hot_water_boost_switch_state,
get_historical_data_registers,
get_heat_temperature,
get_historical_data_for_register,
set_temperature,
set_operation_mode,
set_hot_water_switch_state,
set_hot_water_boost_switch_state





function connected()
    pyconvert(Bool, thermia[].connected)
end
function debug(; heatpump=heat_pump[])
    heat_pump.debug()
end


function get_all_available_register_groups(; heat_pump=heat_pump[])
    heat_pump.get_all_available_register_groups()
end
function get_operational_status(; heat_pump=heat_pump[])
    heat_pump.operational_status
end
function get_supply_line_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.supply_line_temperature)
end
function get_desired_supply_line_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.desired_supply_line_temperature)
end
function get_return_line_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.return_line_temperature)
end
function get_brine_out_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.brine_out_temperature)
end
function get_brine_in_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.brine_in_temperature)
end
function get_cooling_tank_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.cooling_tank_temperature)
end
function get_cooling_supply_line_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.cooling_supply_line_temperature)
end
function get_operational_status(; heat_pump=heat_pump[])
    heat_pump.operational_status
end
function get_available_operational_statuses(; heat_pump=heat_pump[])
    heat_pump.available_operational_statuses
end
function get_available_operational_statuses_map(; heat_pump=heat_pump[])
    heat_pump.available_operational_statuses_map
end
function get_operational_status_auxiliary_heater_3kw(; heat_pump=heat_pump[])
    heat_pump.operational_status_auxiliary_heater_3kw
end
function get_operational_status_auxiliary_heater_6kw(; heat_pump=heat_pump[])
    heat_pump.operational_status_auxiliary_heater_6kw
end
function get_operational_status_auxiliary_heater_9kw(; heat_pump=heat_pump[])
    heat_pump.operational_status_auxiliary_heater_9kw
end
function get_operational_status_auxiliary_heater_12kw(; heat_pump=heat_pump[])
    heat_pump.operational_status_auxiliary_heater_12kw
end
function get_operational_status_auxiliary_heater_15kw(; heat_pump=heat_pump[])
    heat_pump.operational_status_auxiliary_heater_15kw
end
function get_operational_status_compressor_status(; heat_pump=heat_pump[])
    heat_pump.operational_status_compressor_status
end
function get_operational_status_brine_pump_status(; heat_pump=heat_pump[])
    heat_pump.operational_status_brine_pump_status
end
function get_operational_status_radiator_pump_status(; heat_pump=heat_pump[])
    heat_pump.operational_status_radiator_pump_status
end
function get_operational_status_cooling_status(; heat_pump=heat_pump[])
    heat_pump.operational_status_cooling_status
end
function get_operational_status_hot_water_status(; heat_pump=heat_pump[])
    heat_pump.operational_status_hot_water_status
end
function get_operational_status_heating_status(; heat_pump=heat_pump[])
    heat_pump.operational_status_heating_status
end
function get_operational_status_integral(; heat_pump=heat_pump[])
    heat_pump.operational_status_integral
end
function get_operational_status_pid(; heat_pump=heat_pump[])
    heat_pump.operational_status_pid
end
function get_compressor_operational_time(; heat_pump=heat_pump[])
    heat_pump.compressor_operational_time
end
function get_hot_water_operational_time(; heat_pump=heat_pump[])
    heat_pump.hot_water_operational_time
end
function get_auxiliary_heater_1_operational_time(; heat_pump=heat_pump[])
    heat_pump.auxiliary_heater_1_operational_time
end
function get_auxiliary_heater_2_operational_time(; heat_pump=heat_pump[])
    heat_pump.auxiliary_heater_2_operational_time
end
function get_auxiliary_heater_3_operational_time(; heat_pump=heat_pump[])
    heat_pump.auxiliary_heater_3_operational_time
end
function get_active_alarm_count(; heat_pump=heat_pump[])
    heat_pump.active_alarm_count
end
function get_active_alarm_count(; heat_pump=heat_pump[])
    heat_pump.active_alarm_count
end
function get_active_alarms(; heat_pump=heat_pump[])
    heat_pump.active_alarms
end
function get_operation_mode(; heat_pump=heat_pump[])
    heat_pump.operation_mode
end
function get_available_operation_modes(; heat_pump=heat_pump[])
    heat_pump.available_operation_modes
end
function get_available_operation_mode_map(; heat_pump=heat_pump[])
    heat_pump.available_operation_mode_map
end
function get_is_operation_mode_read_only(; heat_pump=heat_pump[])
    heat_pump.is_operation_mode_read_only
end
function get_hot_water_switch_state(; heat_pump=heat_pump[])
    pyconvert(Union{Bool, Nothing}, heat_pump.hot_water_switch_state)
end
function get_hot_water_boost_switch_state(; heat_pump=heat_pump[])
    pyconvert(Union{Bool, Nothing}, heat_pump.hot_water_boost_switch_state)
end
function get_historical_data_registers(; heat_pump=heat_pump[])
    heat_pump.historical_data_registers
end
function get_heat_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Int, Nothing}, heat_pump.heat_temperature)
end

"""
    get_historical_data_for_register(register::String; days = 1, hours = 0, heat_pump)

"REG_OUTDOOR_TEMPERATURE"
"""
function get_historical_data_for_register(register; days = 1, hours = 0, heat_pump=heat_pump[])
    datetime = pyimport("datetime")
    now = datetime.datetime.now()
    heat_pump.get_historical_data_for_register(
        register, now - datetime.timedelta(days=days, hours=hours), now,
    )
end

function update()
    thermia[].update_data()
end

"""
    set_temperature(temp::Int; heat_pump)
"""
function set_temperature(temp::Int; heat_pump=heat_pump[])
    heat_pump.set_temperature(temp)
end
"""
    set_operation_mode(mode = "COMPRESSOR"; heat_pump)
"""
function set_operation_mode(mode = "COMPRESSOR"; heat_pump=heat_pump[])
    heat_pump.set_operation_mode(mode)
end
"""
    set_hot_water_switch_state(switch_state::Int; heat_pump)
Pass 1 or 0
"""
function set_hot_water_switch_state(switch_state::Int; heat_pump=heat_pump[])
    heat_pump.set_hot_water_switch_state(switch_state)
end
"""
    set_hot_water_boost_switch_state(switch_state::Int; heat_pump)
Pass 1 or 0
"""
function set_hot_water_boost_switch_state(switch_state::Int; heat_pump=heat_pump[])
    heat_pump.set_hot_water_boost_switch_state(switch_state)
end


end
   