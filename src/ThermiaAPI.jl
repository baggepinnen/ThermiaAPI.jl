"""
    module ThermiaAPI

The exported API follows that of the python functions and properties of the heat-pump class. Accessor properties are implemented as julia functions with the prefix `get_`, e.g., the python code `heat_pump.supply_line_temperature` is accessed as `get_supply_line_temperature(; heat_pump=ThermiaAPI.heat_pump[])`.

A default heat pump can be added to `ThermiaAPI.heat_pump::Ref.

See example usage in script `thermiaapi.jl`.

For help regarding the command-line interface (CLI), call `ThermiaAPI.command_main(["h"])`
"""
module ThermiaAPI

using Comonicon
using PythonCall

"Default instance of ThermiaOnlineAPI.Thermia"
const thermia = Ref(Py(nothing))

"Default instance of ThermiaOnlineAPI.HeatPump, obtained using, e.g., `thermia[].fetch_heat_pumps()[0]`"
const heat_pump = Ref(Py(nothing))

@enum OperationalStatus STATUS_MANUAL=1 STATUS_DEFROST=2 STATUS_HOTWATER=4 STATUS_HEAT=8 STATUS_COOL=16 STATUS_POOL=32 STATUS_LEGIONELLA=64 STATUS_PASSIVE_COOL=128 STATUS_STANDBY=512 STATUS_NO_DEMAND=1024 OPERATION_MODE_OFF=2048


export get_all_available_register_groups,
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
get_active_alarms,
get_operation_mode,
get_available_operation_modes,
get_available_operation_mode_map,
get_is_operation_mode_read_only,
get_hot_water_switch_state,
get_hot_water_boost_switch_state,
get_historical_data_registers,
get_heat_temperature,
get_hot_water_temperature,
get_historical_data_for_register,
set_temperature,
set_operation_mode,
set_hot_water_switch_state,
set_hot_water_boost_switch_state





@cast function connected()
    pyconvert(Bool, thermia[].connected)
end
@cast function debug(; heatpump=heat_pump[])
    heat_pump.debug()
end
@cast function update()
    thermia[].update_data()
    heat_pump[] = thermia[].fetch_heat_pumps()[0]
end

@cast function get_all_available_register_groups(; heat_pump=heat_pump[])
    heat_pump.get_all_available_register_groups()
end
@cast function get_supply_line_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.supply_line_temperature)
end
@cast function get_desired_supply_line_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.desired_supply_line_temperature)
end
@cast function get_return_line_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.return_line_temperature)
end
@cast function get_brine_out_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.brine_out_temperature)
end
@cast function get_brine_in_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.brine_in_temperature)
end
@cast function get_cooling_tank_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.cooling_tank_temperature)
end
@cast function get_cooling_supply_line_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Float64, Nothing}, heat_pump.cooling_supply_line_temperature)
end
@cast function get_operational_status(; heat_pump=heat_pump[])
    heat_pump.operational_status
end
@cast function get_available_operational_statuses(; heat_pump=heat_pump[])
    heat_pump.available_operational_statuses
end
@cast function get_available_operational_statuses_map(; heat_pump=heat_pump[])
    heat_pump.available_operational_statuses_map
end
@cast function get_operational_status_auxiliary_heater_3kw(; heat_pump=heat_pump[])
    heat_pump.operational_status_auxiliary_heater_3kw
end
@cast function get_operational_status_auxiliary_heater_6kw(; heat_pump=heat_pump[])
    heat_pump.operational_status_auxiliary_heater_6kw
end
@cast function get_operational_status_auxiliary_heater_9kw(; heat_pump=heat_pump[])
    heat_pump.operational_status_auxiliary_heater_9kw
end
@cast function get_operational_status_auxiliary_heater_12kw(; heat_pump=heat_pump[])
    heat_pump.operational_status_auxiliary_heater_12kw
end
@cast function get_operational_status_auxiliary_heater_15kw(; heat_pump=heat_pump[])
    heat_pump.operational_status_auxiliary_heater_15kw
end
@cast function get_operational_status_compressor_status(; heat_pump=heat_pump[])
    heat_pump.operational_status_compressor_status
end
@cast function get_operational_status_brine_pump_status(; heat_pump=heat_pump[])
    heat_pump.operational_status_brine_pump_status
end
@cast function get_operational_status_radiator_pump_status(; heat_pump=heat_pump[])
    heat_pump.operational_status_radiator_pump_status
end
@cast function get_operational_status_cooling_status(; heat_pump=heat_pump[])
    heat_pump.operational_status_cooling_status
end
@cast function get_operational_status_hot_water_status(; heat_pump=heat_pump[])
    heat_pump.operational_status_hot_water_status
end
@cast function get_operational_status_heating_status(; heat_pump=heat_pump[])
    heat_pump.operational_status_heating_status
end
@cast function get_operational_status_integral(; heat_pump=heat_pump[])
    heat_pump.operational_status_integral
end
@cast function get_operational_status_pid(; heat_pump=heat_pump[])
    heat_pump.operational_status_pid
end
@cast function get_compressor_operational_time(; heat_pump=heat_pump[])
    heat_pump.compressor_operational_time
end
@cast function get_hot_water_operational_time(; heat_pump=heat_pump[])
    heat_pump.hot_water_operational_time
end
@cast function get_auxiliary_heater_1_operational_time(; heat_pump=heat_pump[])
    heat_pump.auxiliary_heater_1_operational_time
end
@cast function get_auxiliary_heater_2_operational_time(; heat_pump=heat_pump[])
    heat_pump.auxiliary_heater_2_operational_time
end
@cast function get_auxiliary_heater_3_operational_time(; heat_pump=heat_pump[])
    heat_pump.auxiliary_heater_3_operational_time
end
@cast function get_active_alarm_count(; heat_pump=heat_pump[])
    heat_pump.active_alarm_count
end
@cast function get_active_alarms(; heat_pump=heat_pump[])
    heat_pump.active_alarms
end
@cast function get_operation_mode(; heat_pump=heat_pump[])
    heat_pump.operation_mode
end
@cast function get_available_operation_modes(; heat_pump=heat_pump[])
    heat_pump.available_operation_modes
end
@cast function get_available_operation_mode_map(; heat_pump=heat_pump[])
    heat_pump.available_operation_mode_map
end
@cast function get_is_operation_mode_read_only(; heat_pump=heat_pump[])
    heat_pump.is_operation_mode_read_only
end
@cast function get_hot_water_switch_state(; heat_pump=heat_pump[])
    pyconvert(Union{Bool, Nothing}, heat_pump.hot_water_switch_state)
end
@cast function get_hot_water_boost_switch_state(; heat_pump=heat_pump[])
    pyconvert(Union{Bool, Nothing}, heat_pump.hot_water_boost_switch_state)
end
@cast function get_historical_data_registers(; heat_pump=heat_pump[])
    heat_pump.historical_data_registers
end
@cast function get_heat_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Int, Nothing}, heat_pump.heat_temperature)
end
@cast function get_hot_water_temperature(; heat_pump=heat_pump[])
    pyconvert(Union{Int, Nothing}, heat_pump.hot_water_temperature)
end
@cast function get_is_hot_water_active(; heat_pump=heat_pump[])
    pyconvert(Bool, heat_pump.is_hot_water_active)
end

"""
    get_historical_data_for_register(register::String; days = 1, hours = 0, heat_pump)

Retrieve historical data.

# Valid registers
- `"REG_OUTDOOR_TEMPERATURE"`
- `"REG_SUPPLY_LINE"`
- `"REG_HOT_WATER_TEMPERATURE"`
- `"REG_DESIRED_SYS_SUPPLY_LINE_TEMP"`
"""
@cast function get_historical_data_for_register(register; days = 1, hours = 0, heat_pump=heat_pump[])
    datetime = pyimport("datetime")
    now = datetime.datetime.now()
    heat_pump.get_historical_data_for_register(
        register, now - datetime.timedelta(days=days, hours=hours), now,
    )
end

"""
    set_temperature(temp::Int; heat_pump)

Set the desired indoor temperature to `temp`.
"""
@cast function set_temperature(temp::Int; heat_pump=heat_pump[])
    heat_pump.set_temperature(temp)
end
"""
    set_operation_mode(mode = "COMPRESSOR"; heat_pump)
"""
@cast function set_operation_mode(mode = "COMPRESSOR"; heat_pump=heat_pump[])
    heat_pump.set_operation_mode(mode)
end
"""
    set_hot_water_switch_state(switch_state::Int; heat_pump)

Enable or disable the hot water. Pass 1 or 0
"""
@cast function set_hot_water_switch_state(switch_state::Int; heat_pump=heat_pump[])
    heat_pump.set_hot_water_switch_state(switch_state)
end
"""
    set_hot_water_boost_switch_state(switch_state::Int; heat_pump)
Enable or disable the hot-water boost model. Pass 1 or 0
"""
@cast function set_hot_water_boost_switch_state(switch_state::Int; heat_pump=heat_pump[])
    heat_pump.set_hot_water_boost_switch_state(switch_state)
end

@main

end
   