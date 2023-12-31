% This file contains all the variables that should be modified at beginning of every cruise
%-----------------------------
 
struct_levels_to_print(0);

warning("off");

# set octave"s graphics_toolkit to the one that works...
graphics_toolkit("gnuplot");

%-----------------------------
CRUISE = "AMT24";

% Variables to be changed during cruise according to specific setups and user needs
%
% Date
% Set date interval to be processed (format is "yyyymmdd")
% (this will have to be changed each time the scripts are run)
% first day of cruise = 20180925, jday=268: "With_AC9/"  
% day of switch to default config = 20180927, jday=270: "/" 
% day of ACS switch = 20181019, jday=292": "With_AC9_Without_ACS/"% end day 301
# last day is 20181028
% dates
 
 
# default config # ACS 122 system
#inidate = "20141001"; #  jday 274 - use as test day
#enddate = "20141001"; 
inidate = "20141009"; #  jday 268 - start hr 14
enddate = "20141009"; #  date when ACS breaks
WAP_ROOT = strcat(lower(CRUISE),'_14') 
dh8_instruments = {"bb3", "acs"};
dh8_ports = {2,4}; 
dh8_serialnumber = {1173,122}; 
WAPhour = "14";
ACS_CAL_FILE_NAME = "acs122_20140904.dev";
#ACS_CAL_FILE_NAME = "acs167.dev";
%-----------------------------

# ACS 167 system
#inidate = "20141001"; #  jday 274 - use as test day
#enddate = "20141001";
#inidate = "20141020" 
#enddate = "20141028"; #  jday 302 - end hr 7
#WAP_ROOT = strcat(lower(CRUISE),'_14') 
#dh8_instruments = {"bb3", "acs2"};
#dh8_ports = {2,4}; 
#dh8_serialnumber = {1173,167}; 
#WAPhour = "14";
#ACS_CAL_FILE_NAME = "acs122_20140904.dev";
#ACS_CAL_FILE_NAME = "acs167.dev";

#  ACS 167 system with AC9
# inidate = "20141001"; #  jday 274 - use as test day
# enddate = "20141001"; 
#inidate = "20141030"; #  
#enddate = "20141031"; #  
#WAP_ROOT = strcat('amt24_withAC9','_14') 
#dh8_instruments = {"bb3", "acs2"};
#dh8_ports = {2,4}; 
#dh8_serialnumber = {1173,167}; 
#WAPhour = "10";
#ACS_CAL_FILE_NAME = "acs122_20140904.dev";
#ACS_CAL_FILE_NAME = "acs167.dev";

# default config # use for step2
#inidate = "20141029"; #  jday 268 - start hr 14
#enddate = "20141030"; #  date when ACS breaks
#WAP_ROOT = strcat(lower(CRUISE),'_14') 
#dh8_instruments = {"bb3", "acs"};
#dh8_ports = {2,4}; 
#dh8_serialnumber = {1173,122}; 
#WAPhour = "14";
#ACS_CAL_FILE_NAME = "acs122_20140904.dev";
#ACS_CAL_FILE_NAME = "acs167.dev";


% Underway subdirectory where to find special wapped data
% Leave with simple / if no special case
# UWAY_WAP_SUBDIR = "With_AC9_Without_ACS/"; 
# UWAY_WAP_SUBDIR = "With_AC9/"; 
UWAY_WAP_SUBDIR = "/"; 

% Parameters specific for Underway plotting/processing
% (this will change depending on specific section fo the cruise)
% Setup to automatically change based on UWAY_WAP_SUBDIR
%
% Implemented instruments to selct from are 
% {"ctd","acs","bb3","cstar","acs2","ac9","clam"}
#if strcmp (UWAY_WAP_SUBDIR, "With_AC9_Without_ACS/") == 1 % tjor: selects `bfiles" for 2018 cruise
   # dh8_instruments = {"ac9", "bb3", "cstar", "ctd"};
    % Ports must corresponds to same ports as in dh8_instruments
  #  dh8_ports = {1,2,3,4}; 
    % Serial numbers are mainly needed for acs and ac9 config files, leave blank for other instruments
 #   dh8_serialnumber = {227, 1173, 1426,[]};
#elseif strcmp(UWAY_WAP_SUBDIR, "With_AC9/") == 1 % tjor: selects subdirectory with AC9
  #  dh8_instruments = {"acs", "bb3", "ac9", "ctd"};
    % Ports must corresponds to same ports as in dh8_instruments
 #   dh8_ports = {1,2,3,4}; 
    % Serial numbers are mainly needed for acs and ac9 config files, leave blank for other instruments
#    dh8_serialnumber = {122, 1173, 227,[]};
#if strcmp(UWAY_WAP_SUBDIR, "/") == 1 % tjor: this is the `default" config (i.e. without subdirectories inside WAP_extracted)
   # dh8_instruments = {"ctd", "acs", "cstar", "bb3"};
     #   dh8_instruments = {"ctd", "acs", "bb3"}; special case - jday 269
    % Ports must corresponds to same ports as in dh8_instruments
  #  dh8_ports = {2,7,6,1}; 
 #   dh8_ports = {2,7,1}; 
    % Serial numbers are mainly needed for acs and ac9 config files, leave blank for other instruments
 #   dh8_serialnumber = {[], 122, 1426, 1173}; 
    #dh8_serialnumber = {[], 122, 1173}; # special case 
#endif
%-----------------------------

%-----------------------------
% Paths
MAIN_PATH = "/users/rsg/tjor/scratch_network/AMT_underway/AMT24/";

# MAIN_PATH = "/data/abitibi1/scratch/scratch_disk/tjor/AMT_underway/AMT26/"; disp("\n\n-----------THIS IS FOR     TOM----------\n\n"); fflush(stdout);
% MAIN_PATH = "/tom/AMT_underway/AMT28/"; %disp("\n\n---------THIS IS FOR GIORGIO---------\n\n"); fflush(stdout);
# MAIN_PATH = "/fast_scratch/AMT28/"; disp("\n\n---------THIS IS FOR GIORGIO---------\n\n"); fflush(stdout);
% MAIN_PATH = [MAIN_PATH, "/Data/", CRUISE,"/"];     % Root directory for current AMT cruise
PATH_DATA = [MAIN_PATH, "Data/"];        % Directory with all raw and wapped data
# PATH_DATA  = "/data/datasets/cruise_data/active/AMT28/Optics_all/Optics/Data/";

PATH_SOURCE = [MAIN_PATH, "Source/"];% Directory with all source code
OUT_PROC = [MAIN_PATH, "Processed/"];    % Output directory for processed oct and mat files
OUT_FIGS = [MAIN_PATH, "Figures/"];      % Output directory for figures

addpath([PATH_SOURCE]);
%-----------------------------
% Each directory will contain a series of subdirectories for each instrument
% (e.g. Underway, Optics_rig, BB3_ctd etc. etc.)
OPTIC_DIR = "Optics_rig/";
UWAY_DIR = "Uway/";
BB3_DIR = "BB3_ctd/";
CTD_DIR = "Ship_CTD/";
% Specific data subdirectories
DATA_WAPPED = "WAP_Extracted/";
DATA_RAW = "Raw/";
DATA_FLOW = "Flow/";
DATA_WITH_BB3 = "with_BB3/";


%-----------------------------
% calibration file dir
D_CAL_FILES = [PATH_DATA, UWAY_DIR, "devs/"];

%-----------------------------
% ACS calibration file

%-----------------------------

%-----------------------------
% Ship"s system directories
#PATH_SHIP = ['/data/datasets/cruise_data/active/AMT24/Ship_data/Compress']; %tjor - ships meteorological data
# PATH_TS = [PATH_SHIP, "Compress/"]; % Directory with ship underway ctd
#PATH_TS = PATH_SHIP; # no compress directory for amt 26

#----------------------------
# Input parameters for ship"s underway data
# 
# here we assume that the ship"s uway data are always stored in daily folders called YYYYDOY (e.g., 2018290) 
#addpath(UWAY_DIR) # location where rd seatech and ocean logger functions are stored
addpath([MAIN_PATH, "Source/Underway/"]) # location where rd seatech and ocean logger functions are stored
DIR_GPS = '/data/datasets/cruise_data/active/AMT24/Ship_data/Compress/Compress/days/seatex-gga/' # hard-coded for amt 24
GLOB_GPS = "seatex*";
FN_GPS = "seatex-gga.ACO";
FNC_GPS = @rd_seatech_gga; # this function should be inside Source/Underway

DIR_METDATA = '/data/datasets/cruise_data/active/AMT24/Ship_data/Compress/Compress/days/oceanlogger/' # hard-coded for amt 24
GLOB_METDATA = "oceanlogger*";
FN_METDATA = "oceanlogger.ACO";
FNC_METDATA = @rd_oceanloggerJCR; # this function should be inside Source/Underway

#----------------------------


# Path-related variables for step2
global DIR_STEP1 = [OUT_PROC UWAY_DIR "Step1/"];
global DIR_STEP2 = [OUT_PROC UWAY_DIR "Step2/"];
global DIR_STEP3 = [OUT_PROC UWAY_DIR "Step3/"];
global FN_ROOT_STEP2 = [DIR_STEP2 "proc_optics_" lower(CRUISE) "_"];

global acs_wv = [400:2:750];

% Create path for saving figures
#   global fig_dir = [OUT_FIGS, UWAY_DIR];
global DIR_FIGS = [OUT_FIGS, UWAY_DIR];

% Create directories if they do not exists
   if ~exist(DIR_FIGS, "dir")
      mkdir(DIR_FIGS);
   endif

   if ~exist(DIR_STEP2, "dir")
      mkdir(DIR_STEP2);
   endif







%-----------------------------
% Parameters specific for Optics rig plotting/processing
%
% Wether cdt is saved as ASCII format (false for AMT26; true for AMT27)
ctdASCII = true;
% Limits for temperature and salinity profiles
Tlim = [0 20];
Slim = [33 35];
% Limits for absorption and attenuation profiles
alim = [0.1 0.4];
clim = [0.05 0.6];
chlac9lim = [0 5];
%-----------------------------

% Processors to be used by parcellfun in run_step1par.m
NProc = nproc() - 1;

% Name of processed file to be saved
fproc_name = ["optics_" lower(CRUISE) "_"];

% Limits for time-series plots
acs_raw_lim = [-0.03 0.1]; % acs
flow_lim = [20 45];        % flow rate
bb3_lim = [50 140];       % backscattering
SST_lim = [15 20];         % CTD temperature
SSS_lim = [35 36.5];        % CTD salinity
% Limits for step2 time series
acs_lim = [-0.05 0.3];
ac9_lim = acs_lim;
bb_opt_lim = [70 150];
cstar_lim = [0.75 0.85];
spectra_alim = [0.03];
spectra_clim = [1];
chl_lim = [0.01 5];

%-----------------------------
% Parameters specific for BB3 plotting/processing
%
% Limits for bb3 profiles
bb3lim = [50 300];
%-----------------------------

%-----------------------------
% Parameters specific for underway transect
%
latlim = 54;
trans_SST = [01 30];
trans_SSS = [33 38];
trans_chl = [0.01 5];
trans_cp650 = [0.01 0.3];
%-----------------------------

%-----------------------------
% useful functions
movavg = inline("filter(1/mavgwd*ones(1, mavgwd), 1, x)", "x", "mavgwd"); % this is equivalent to a standard moving average with a window size of mavgwd
%-----------------------------





