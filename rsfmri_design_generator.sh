#!/bin/bash

# Creating a generic design.fsf

echo "Generating a generic design.fsf file that can be used to automate melodic specific pre-processing and ICA decomposition via FEAT."
sleep 3
echo "______"
sleep 1

## Setup - source config file

source config.sh

## Creating textfile and saving as a .fsf

cat << EOF > "design.fsf"

# FEAT version number
set fmri(version) 3.15

# Are we in MELODIC?
set fmri(inmelodic) 1

# Analysis level
# 1 : First-level analysis
# 2 : Higher-level analysis
set fmri(level) 1

# Which stages to run
# 0 : No first-level analysis (registration and/or group stats only)
# 7 : Full first-level analysis
# 1 : Pre-processing
# 2 : Statistics
set fmri(analysis) 7

# Use relative filenames
set fmri(relative_yn) 0

# Balloon help
set fmri(help_yn) 1

# Run Featwatcher
set fmri(featwatcher_yn) 1

# Cleanup first-level standard-space images
set fmri(sscleanup_yn) 0

# Output directory
set fmri(outputdir) "${output_dir}"

# TR(s)
set fmri(tr) 0.736000 

# Total volumes
set fmri(npts) 490

# Delete volumes
set fmri(ndelete) 0

# Perfusion tag/control order
set fmri(tagfirst) 1

# Number of first-level analyses
set fmri(multiple) 1

# Higher-level input type
# 1 : Inputs are lower-level FEAT directories
# 2 : Inputs are cope images from FEAT directories
set fmri(inputtype) 2

# Carry out pre-stats processing?
set fmri(filtering_yn) 1

# Brain/background threshold, %
set fmri(brain_thresh) 10

# Critical z for design efficiency calculation
set fmri(critical_z) 5.3

# Noise level
set fmri(noise) 0.66

# Noise AR(1)
set fmri(noisear) 0.34

# Motion correction
# 0 : None
# 1 : MCFLIRT
set fmri(mc) 1

# Spin-history (currently obsolete)
set fmri(sh_yn) 0

# B0 fieldmap unwarping?
set fmri(regunwarp_yn) 1

# GDC Test
set fmri(gdc) ""

# EPI dwell time (ms)
set fmri(dwell) ${echo_spacing}

# EPI TE (ms)
set fmri(te) ${epi_te}

# % Signal loss threshold
set fmri(signallossthresh) 10

# Unwarp direction
set fmri(unwarp_dir) y-

# Slice timing correction
# 0 : None
# 1 : Regular up (0, 1, 2, 3, ...)
# 2 : Regular down
# 3 : Use slice order file
# 4 : Use slice timings file
# 5 : Interleaved (0, 2, 4 ... 1, 3, 5 ... )
set fmri(st) 0

# Slice timings file
set fmri(st_file) ""

# BET brain extraction
set fmri(bet_yn) 1

# Spatial smoothing FWHM (mm)
set fmri(smooth) 5

# Intensity normalization
set fmri(norm_yn) 0

# Perfusion subtraction
set fmri(perfsub_yn) 0

# Highpass temporal filtering
set fmri(temphp_yn) 1

# Lowpass temporal filtering
set fmri(templp_yn) 0

# MELODIC ICA data exploration
set fmri(melodic_yn) 0

# Carry out main stats?
set fmri(stats_yn) 1

# Carry out prewhitening?
set fmri(prewhiten_yn) 1

# Add motion parameters to model
# 0 : No
# 1 : Yes
set fmri(motionevs) 0
set fmri(motionevsbeta) ""
set fmri(scriptevsbeta) ""

# Robust outlier detection in FLAME?
set fmri(robust_yn) 0

# Higher-level modelling
# 3 : Fixed effects
# 0 : Mixed Effects: Simple OLS
# 2 : Mixed Effects: FLAME 1
# 1 : Mixed Effects: FLAME 1+2
set fmri(mixed_yn) 2

# Higher-level permutations
set fmri(randomisePermutations) 5000

# Number of EVs
set fmri(evs_orig) 1
set fmri(evs_real) 1
set fmri(evs_vox) 0

# Number of contrasts
set fmri(ncon_orig) 1
set fmri(ncon_real) 1

# Number of F-tests
set fmri(nftests_orig) 0
set fmri(nftests_real) 0

# Add constant column to design matrix? (obsolete)
set fmri(constcol) 0

# Carry out post-stats steps?
set fmri(poststats_yn) 1

# Pre-threshold masking?
set fmri(threshmask) ""

# Thresholding
# 0 : None
# 1 : Uncorrected
# 2 : Voxel
# 3 : Cluster
set fmri(thresh) 3

# P threshold
set fmri(prob_thresh) 0.05

# Z threshold
set fmri(z_thresh) 3.1

# Z min/max for colour rendering
# 0 : Use actual Z min/max
# 1 : Use preset Z min/max
set fmri(zdisplay) 0

# Z min in colour rendering
set fmri(zmin) 2

# Z max in colour rendering
set fmri(zmax) 8

# Colour rendering type
# 0 : Solid blobs
# 1 : Transparent blobs
set fmri(rendertype) 1

# Background image for higher-level stats overlays
# 1 : Mean highres
# 2 : First highres
# 3 : Mean functional
# 4 : First functional
# 5 : Standard space template
set fmri(bgimage) 1

# Create time series plots
set fmri(tsplot_yn) 1

# Registration to initial structural
set fmri(reginitial_highres_yn) 0

# Search space for registration to initial structural
# 0   : No search
# 90  : Normal search
# 180 : Full search
set fmri(reginitial_highres_search) 90

# Degrees of Freedom for registration to initial structural
set fmri(reginitial_highres_dof) 3

# Registration to main structural
set fmri(reghighres_yn) 1

# Search space for registration to main structural
# 0   : No search
# 90  : Normal search
# 180 : Full search
set fmri(reghighres_search) 90

# Degrees of Freedom for registration to main structural
set fmri(reghighres_dof) BBR

# Registration to standard image?
set fmri(regstandard_yn) 1

# Use alternate reference images?
set fmri(alternateReference_yn) 0

# Standard image
set fmri(regstandard) "${MNI_input}"

# Search space for registration to standard space
# 0   : No search
# 90  : Normal search
# 180 : Full search
set fmri(regstandard_search) 90

# Degrees of Freedom for registration to standard space
set fmri(regstandard_dof) 12

# Do nonlinear registration from structural to standard space?
set fmri(regstandard_nonlinear_yn) 1

# Control nonlinear warp field resolution
set fmri(regstandard_nonlinear_warpres) 10

# High pass filter cutoff
set fmri(paradigm_hp) 100

# Total voxels
set fmri(totalVoxels) 242851840


# Number of lower-level copes feeding into higher-level analysis
set fmri(ncopeinputs) 0

# 4D AVW data or FEAT directory (1)
set feat_files(1) "${resting_input}"

# Add confound EVs text file
set fmri(confoundevs) 0

# B0 unwarp input image for analysis 1
set unwarp_files(1) "${FMAP_RADS_input}"

# B0 unwarp mag input image for analysis 1
set unwarp_files_mag(1) "${FMAP_MAG_brain_input}"

# Subject's structural image for analysis 1
set highres_files(1) "${T1_input}"

# Resampling resolution
set fmri(regstandard_res) 4

# Variance-normalise timecourses
set fmri(varnorm) 1

# Automatic dimensionality estimation
set fmri(dim_yn) 1

# Output components
set fmri(dim) 1

# 1 : Single-session ICA
# 2 : Multi-session temporal concatenation
# 3 : Multi-session tensor TICA
set fmri(icaopt) 1

# Threshold IC maps
set fmri(thresh_yn) 1

# Mixture model threshold
set fmri(mmthresh) 0.5

# Output full stats folder
set fmri(ostats) 0

# Timeseries and subject models
set fmri(ts_model_mat) ""
set fmri(ts_model_con) ""
set fmri(subject_model_mat) ""
set fmri(subject_model_con) ""


##########################################################
# Now options that don't appear in the GUI

# Alternative (to BETting) mask image
set fmri(alternative_mask) ""

# Initial structural space registration initialisation transform
set fmri(init_initial_highres) ""

# Structural space registration initialisation transform
set fmri(init_highres) ""

# Standard space registration initialisation transform
set fmri(init_standard) ""

# For full FEAT analysis: overwrite existing .feat output dir?
set fmri(overwrite_yn) 0" 

EOF

sleep 1
echo "______"
sleep 1
echo "Generic design.fsf file produced."
sleep 2
echo "______"
sleep 2

## Copying subject specific design file to each subject directory

echo "Copying generic subject design.fsf file to each subject directories and editing paths for melodic"
sleep 1

find "$start_dir" -maxdepth 1 -mindepth 1 -type d | sort | while read -r dir; do

    cd "$dir"

    cp "${design_path}/design.fsf" "$(basename "$dir")_design.fsf" # copy design.fsf into each subject directory, with subject specific name

    sed -i '' "s|XXXX|$(basename "$dir")|g" "$(basename "$dir")_design.fsf" # replace all "XXXX" in design.fsf file with subject number (changing paths)

    cd "$original_dir" # move back to original directory

done

sleep 1
echo "______"
sleep 1
echo "Each subject has their own unique design.fsf file. Subjects are ready for automated melodic (via FEAT)."