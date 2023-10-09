# ThermiaAPI

[![Build Status](https://github.com/baggepinnen/ThermiaAPI.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/baggepinnen/ThermiaAPI.jl/actions/workflows/CI.yml?query=branch%3Amain)

A Julia wrapper for https://github.com/klejejs/python-thermia-online-api

Set the following environment variables before loading this package

```julia
ENV["THERMIA_USERNAME"] = ""
ENV["THERMIA_PASSWORD"] = ""
ENV["THERMIA_API_TYPE"] = "genesis" # classic or genesis
ENV["THERMIA_PATH"] = "/path/to/python-thermia-online-api"
```