module ThermiaAPI
using PythonCall

const thermia = Ref(Py(nothing))
const heat_pump = Ref(Py(nothing))

function __init__()
    global USERNAME = ENV["THERMIA_USERNAME"]
    global PASSWORD = ENV["THERMIA_PASSWORD"]
    global API_TYPE = ENV["THERMIA_API_TYPE"]


    path = get(ENV, "THERMIA_PATH", nothing)
    if path !== nothing
        sys = pyimport("sys")
        sys.path.append(path)
    end

    ThermiaOnlineAPI = pyimport("ThermiaOnlineAPI")
    thermia[] = ThermiaOnlineAPI.Thermia(USERNAME, PASSWORD, api_type=API_TYPE)
    heat_pump[] = thermia[].fetch_heat_pumps()[0]
end
@enum OperationalStatus STATUS_MANUAL=1 STATUS_DEFROST=2 STATUS_HOTWATER=4 STATUS_HEAT=8 STATUS_COOL=16 STATUS_POOL=32 STATUS_LEGIONELLA=64 STATUS_PASSIVE_COOL=128 STATUS_STANDBY=512 STATUS_NO_DEMAND=1024 OPERATION_MODE_OFF=2048


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
    pyconvert(Float64, heat_pump.supply_line_temperature)
end
function get_desired_supply_line_temperature(; heat_pump=heat_pump[])
    pyconvert(Float64, heat_pump.desired_supply_line_temperature)
end
function get_return_line_temperature(; heat_pump=heat_pump[])
    pyconvert(Float64, heat_pump.return_line_temperature)
end
function get_brine_out_temperature(; heat_pump=heat_pump[])
    pyconvert(Float64, heat_pump.brine_out_temperature)
end
function get_brine_in_temperature(; heat_pump=heat_pump[])
    pyconvert(Float64, heat_pump.brine_in_temperature)
end
function get_cooling_tank_temperature(; heat_pump=heat_pump[])
    pyconvert(Float64, heat_pump.cooling_tank_temperature)
end
function get_cooling_supply_line_temperature(; heat_pump=heat_pump[])
    pyconvert(Float64, heat_pump.cooling_supply_line_temperature)
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
    pyconvert(Bool, heat_pump.hot_water_switch_state)
end
function get_hot_water_boost_switch_state(; heat_pump=heat_pump[])
    pyconvert(Bool, heat_pump.hot_water_boost_switch_state)
end
function get_historical_data_registers(; heat_pump=heat_pump[])
    heat_pump.historical_data_registers
end
function get_heat_temperature(; heat_pump=heat_pump[])
    pyconvert(Int, heat_pump.heat_temperature)
end

function get_historical_data_for_register(; heat_pump=heat_pump[])
    datetime = pyimport("datetime")
    heat_pump.get_historical_data_for_register(
            "REG_OUTDOOR_TEMPERATURE",
            datetime.datetime.now() - datetime.timedelta(days=1),
            datetime.datetime.now(),
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
   