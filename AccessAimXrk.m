function [methodinfo,structs,enuminfo,ThunkLibName]=protofile
%PROTOFILE Create structures to define interfaces found in 'MatLabXRK'.

%This function was generated by loadlibrary.m parser version 1.1.6.38 on Fri Dec 16 18:43:34 2016
%perl options:'MatLabXRK.i -outfile=protofile.m'
ival={cell(1,0)}; % change 0 to the actual number of functions to preallocate the data.
structs=[];enuminfo=[];fcnNum=1;
fcns=struct('name',ival,'calltype',ival,'LHS',ival,'RHS',ival,'alias',ival);
ThunkLibName=[];

%  char const * get_library_date (); 
fcns.name{fcnNum}='get_library_date'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;

%  char const * get_library_time (); 
fcns.name{fcnNum}='get_library_time'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;


%  int open_file ( char const * full_path_name ); 
fcns.name{fcnNum}='open_file'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring'};fcnNum=fcnNum+1;

%  int open_file_with_licence ( char const* full_path_name, char const* full_path_licence ); 
fcns.name{fcnNum}='open_file_with_licence'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring', 'cstring'};fcnNum=fcnNum+1;

%  char const * get_last_open_error (); 
fcns.name{fcnNum}='get_last_open_error'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;

%  int close_file_n ( char const * full_path_name ); 
fcns.name{fcnNum}='close_file_n'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring'};fcnNum=fcnNum+1;

%  int close_file_i ( int idx ); 
fcns.name{fcnNum}='close_file_i'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;


%  int get_logger_id ( int idx ); 
fcns.name{fcnNum}='get_logger_id'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;

%  int get_number_of_devices ( int idx ); 
fcns.name{fcnNum}='get_number_of_devices'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;

%  int get_device_id ( int idx, int idxd ); 
fcns.name{fcnNum}='get_device_id'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;


%  char const * get_vehicle_name ( int idx ); 
fcns.name{fcnNum}='get_vehicle_name'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;

%  char const * get_track_name ( int idx ); 
fcns.name{fcnNum}='get_track_name'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;

%  char const * get_racer_name ( int idx ); 
fcns.name{fcnNum}='get_racer_name'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;

%  char const * get_championship_name ( int idx ); 
fcns.name{fcnNum}='get_championship_name'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;

%  char const * get_session_type_name ( int idx ); 
fcns.name{fcnNum}='get_session_type_name'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;


%  struct tm const * get_date_and_time ( int idx ); 
fcns.name{fcnNum}='get_date_and_time'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='tmPtr'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;

%  int get_laps_count ( int idx ); 
fcns.name{fcnNum}='get_laps_count'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;

%  int get_lap_info ( int idxf , int idxl , double * pstart , double * pduration ); 
fcns.name{fcnNum}='get_lap_info'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'doublePtr', 'doublePtr'};fcnNum=fcnNum+1;


%  int get_session_duration ( int idxf , double * pduration ); 
fcns.name{fcnNum}='get_session_duration'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'doublePtr'};fcnNum=fcnNum+1;


%  int get_channels_count ( int idx ); 
fcns.name{fcnNum}='get_channels_count'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;

%  char const * get_channel_name_no_spaces ( int idxf , int idxc ); 
fcns.name{fcnNum}='get_channel_name_no_spaces'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;

%  char const * get_channel_units ( int idxf , int idxc ); 
fcns.name{fcnNum}='get_channel_units'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;

%  int get_channel_samples_count ( int idxf , int idxc ); 
fcns.name{fcnNum}='get_channel_samples_count'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;

%  int get_channel_samples ( int idxf , int idxc , double * ptimes , double * pvalues , int cnt ); 
fcns.name{fcnNum}='get_channel_samples'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'doublePtr', 'doublePtr', 'int32'};fcnNum=fcnNum+1;

%  int get_lap_channel_samples_count ( int idxf , int idxl , int idxc ); 
fcns.name{fcnNum}='get_lap_channel_samples_count'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'int32'};fcnNum=fcnNum+1;

%  int get_lap_channel_samples ( int idxf , int idxl , int idxc , double * ptimes , double * pvalues , int cnt ); 
fcns.name{fcnNum}='get_lap_channel_samples'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'int32', 'doublePtr', 'doublePtr', 'int32'};fcnNum=fcnNum+1;


%  int set_GPS_sample_freq ( double freq ); 
fcns.name{fcnNum}='set_GPS_sample_freq'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'double'};fcnNum=fcnNum+1;


%  int get_GPS_channels_count ( int idx ); 
fcns.name{fcnNum}='get_GPS_channels_count'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;

%  char const * get_GPS_channel_name_no_spaces ( int idxf , int idxc ); 
fcns.name{fcnNum}='get_GPS_channel_name_no_spaces'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;

%  char const * get_GPS_channel_units ( int idxf , int idxc ); 
fcns.name{fcnNum}='get_GPS_channel_units'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;

%  int get_GPS_channel_samples_count ( int idxf , int idxc ); 
fcns.name{fcnNum}='get_GPS_channel_samples_count'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;

%  int get_GPS_channel_samples ( int idxf , int idxc , double * ptimes , double * pvalues , int cnt ); 
fcns.name{fcnNum}='get_GPS_channel_samples'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'doublePtr', 'doublePtr', 'int32'};fcnNum=fcnNum+1;

%  int get_lap_GPS_channel_samples_count ( int idxf , int idxl , int idxc ); 
fcns.name{fcnNum}='get_lap_GPS_channel_samples_count'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'int32'};fcnNum=fcnNum+1;

%  int get_lap_GPS_channel_samples ( int idxf , int idxl , int idxc , double * ptimes , double * pvalues , int cnt ); 
fcns.name{fcnNum}='get_lap_GPS_channel_samples'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'int32', 'doublePtr', 'doublePtr', 'int32'};fcnNum=fcnNum+1;


%  int get_GPS_raw_channels_count ( int idx ); 
fcns.name{fcnNum}='get_GPS_raw_channels_count'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;

%  char const * get_GPS_raw_channel_name_no_spaces ( int idxf , int idxc ); 
fcns.name{fcnNum}='get_GPS_raw_channel_name_no_spaces'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;

%  char const * get_GPS_raw_channel_units ( int idxf , int idxc ); 
fcns.name{fcnNum}='get_GPS_raw_channel_units'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;

%  int get_GPS_raw_channel_samples_count ( int idxf , int idxc ); 
fcns.name{fcnNum}='get_GPS_raw_channel_samples_count'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;

%  int get_GPS_raw_channel_samples ( int idxf , int idxc , double * ptimes , double * pvalues , int cnt ); 
fcns.name{fcnNum}='get_GPS_raw_channel_samples'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'doublePtr', 'doublePtr', 'int32'};fcnNum=fcnNum+1;

%  int get_lap_GPS_raw_channel_samples_count ( int idxf , int idxl , int idxc ); 
fcns.name{fcnNum}='get_lap_GPS_raw_channel_samples_count'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'int32'};fcnNum=fcnNum+1;

%  int get_lap_GPS_raw_channel_samples ( int idxf , int idxl , int idxc , double * ptimes , double * pvalues , int cnt ); 
fcns.name{fcnNum}='get_lap_GPS_raw_channel_samples'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'int32', 'doublePtr', 'doublePtr', 'int32'};fcnNum=fcnNum+1;


structs.tm.members=struct(...
    'tm_sec', 'int32', ...
    'tm_min', 'int32', ...
    'tm_hour', 'int32', ...
    'tm_mday', 'int32', ...
    'tm_mon', 'int32', ...
    'tm_year', 'int32', ...
    'tm_wday', 'int32', ...
    'tm_yday', 'int32', ...
    'tm_isdst', 'int32' ...
    );
methodinfo=fcns;
