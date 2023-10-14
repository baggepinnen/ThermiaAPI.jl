# ThermiaAPI

A Julia wrapper for https://github.com/klejejs/python-thermia-online-api

PythonCall.jl is used to wrap the python package, make sure that PythonCall has access to the python package before loading this package, also set the following environment variables before loading this package.

```julia
ENV["THERMIA_USERNAME"] = ""
ENV["THERMIA_PASSWORD"] = ""
ENV["THERMIA_API_TYPE"] = "genesis" # classic or genesis
ENV["THERMIA_PATH"] = "/path/to/python-thermia-online-api"
```

## API
See docstrings of individual functions for more information.

- `connected`
- `debug`
- `get_active_alarm_count`
- `get_active_alarms`
- `get_all_available_register_groups`
- `get_auxiliary_heater_1_operational_time`
- `get_auxiliary_heater_2_operational_time`
- `get_auxiliary_heater_3_operational_time`
- `get_available_operation_mode_map`
- `get_available_operation_modes`
- `get_available_operational_statuses_map`
- `get_available_operational_statuses`
- `get_brine_in_temperature`
- `get_brine_out_temperature`
- `get_compressor_operational_time`
- `get_cooling_supply_line_temperature`
- `get_cooling_tank_temperature`
- `get_desired_supply_line_temperature`
- `get_heat_temperature`
- `get_historical_data_for_register`
- `get_historical_data_registers`
- `get_hot_water_boost_switch_state`
- `get_hot_water_operational_time`
- `get_hot_water_switch_state`
- `get_hot_water_temperature`
- `get_is_hot_water_active`
- `get_is_operation_mode_read_only`
- `get_operation_mode`
- `get_operational_status_auxiliary_heater_12kw`
- `get_operational_status_auxiliary_heater_15kw`
- `get_operational_status_auxiliary_heater_3kw`
- `get_operational_status_auxiliary_heater_6kw`
- `get_operational_status_auxiliary_heater_9kw`
- `get_operational_status_brine_pump_status`
- `get_operational_status_compressor_status`
- `get_operational_status_cooling_status`
- `get_operational_status_heating_status`
- `get_operational_status_hot_water_status`
- `get_operational_status_integral`
- `get_operational_status_pid`
- `get_operational_status_radiator_pump_status`
- `get_operational_status`
- `get_return_line_temperature`
- `get_supply_line_temperature`
- `set_hot_water_boost_switch_state`
- `set_hot_water_switch_state`
- `set_operation_mode`
- `set_temperature`
- `update`