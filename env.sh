apply_cmssw_customization_steps() {
#     run_cmd mkdir -p HHTools
#     run_cmd ln -s "$this_dir/HHbtag" HHTools/HHbtag
#     run_cmd mkdir -p TauAnalysis
#     run_cmd ln -s "$this_dir/ClassicSVfit" TauAnalysis/ClassicSVfit
#     run_cmd ln -s "$this_dir/SVfitTF" TauAnalysis/SVfitTF
#     run_cmd mkdir -p HHKinFit2
#     run_cmd ln -s "$this_dir/HHKinFit2" HHKinFit2/HHKinFit2
    run_cmd git cms-init
    run_cmd git cms-addpkg Validation/MuonCSCDigis
}

action() {
    local this_file="$( [ ! -z "$ZSH_VERSION" ] && echo "${(%):-%x}" || echo "${BASH_SOURCE[0]}" )"
    local this_dir="$( cd "$( dirname "$this_file" )" && pwd )"
    local this_file_path="$this_dir/$(basename $this_file)"

    export ANALYSIS_PATH="$this_dir"
    source $this_dir/GEM-CSC-trg-dev/env.sh "$this_file_path" "$@"
}

action "$@"
unset -f action
# unset -f apply_cmssw_customization_steps