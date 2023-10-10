ENV["JULIA_CONDAPKG_BACKEND"] = "Null"
ENV["JULIA_PYTHONCALL_EXE"] = "python3"
USERNAME = ENV["THERMIA_USERNAME"]
PASSWORD = ENV["THERMIA_PASSWORD"]
API_TYPE = ENV["THERMIA_API_TYPE"]

using ThermiaAPI
using ConfigEnv
dotenv()


path = get(ENV, "THERMIA_PATH", nothing)
if path !== nothing
    @info "Adding ThermiaAPI $path to python path"
    sys = pyimport("sys")
    sys.path.append(path)
end

ThermiaOnlineAPI = pyimport("ThermiaOnlineAPI")

@info "Connecting to ThermiaOnlineAPI"
for i = 1:5 # Try 5 times with exponential backoff
    sleeptime = 3
    try
        ThermiaAPI.thermia[] = ThermiaOnlineAPI.Thermia(USERNAME, PASSWORD, api_type=API_TYPE)
        @info "Fetching heat pumps"
        ThermiaAPI.heat_pump[] = thermia[].fetch_heat_pumps()[0] # This sets the default heat pump for all functions. 
        break
    catch
        @error "Failed to connect to ThermiaOnlineAPI, retrying in $sleeptime seconds"
        sleep(sleeptime)
        sleeptime *= 2
    end
end
