autoload -Uz log_debug log_error log_info log_status log_output

## Dependency Information
local name='nv-codec-headers'
local version='12.0.16.2'
local url='https://github.com/ffmpeg/nv-codec-headers.git'
local hash='22441b505d9d9afc1e3002290820909846c24bdc'

## Dependency Overrides
local targets=('windows-x*')

## Build Steps
setup() {
  log_info "Setup (%F{3}${target}%f)"
  setup_dep ${url} ${hash}
}

build() {
  autoload -Uz mkcd progress

  log_info "Build (%F{3}${target}%f)"
  cd ${dir}

  log_debug "Running make"
  make PREFIX="${target_config[output_dir]}"
}

install() {
  autoload -Uz progress

  log_info "Install (%F{3}${target}%f)"

  cd ${dir}

  make PREFIX="${target_config[output_dir]}" install
}
