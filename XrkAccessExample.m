function AutoExportXrkData()
    % Load DLL
    dllPath = fullfile(pwd, 'MatLabXRK-2022-64-ReleaseU.dll');
    if ~libisloaded('AccessAimXrk')
        loadlibrary(dllPath, @AccessAimXrk, 'alias', 'AccessAimXrk');
    end
    
    % Create data directory structure if it doesn't exist
    dataDir = fullfile(pwd, 'data');
    if ~exist(dataDir, 'dir')
        mkdir(dataDir);
    end
    
    % Create sort_by_lap and sort_by_heading directories
    sortByLapDir = fullfile(dataDir, 'sort_by_lap');
    sortByHeadingDir = fullfile(dataDir, 'sort_by_heading');
    
    if ~exist(sortByLapDir, 'dir')
        mkdir(sortByLapDir);
    end
    
    if ~exist(sortByHeadingDir, 'dir')
        mkdir(sortByHeadingDir);
    end

    % Find first .xrk file in directory
    files = dir('*.xrk');
    assert(~isempty(files), 'No XRK files found in this directory.');
    sFilename = fullfile(pwd, files(1).name);

    % Open XRK file
    iFile = calllib('AccessAimXrk', 'open_file', sFilename);
    assert(iFile > 0, 'Failed to open XRK file.');

    % Get number of laps and channels
    iLapCount = calllib('AccessAimXrk', 'get_laps_count', iFile);
    iChannelCount = calllib('AccessAimXrk', 'get_channels_count', iFile);

    % Extract and save each regular channel for all laps
    for iLap = 0:iLapCount-1
        for iChan = 0:iChannelCount-1
            chName = calllib('AccessAimXrk', 'get_channel_name_no_spaces', iFile, iChan);
            chUnit = calllib('AccessAimXrk', 'get_channel_units', iFile, iChan);
            iSamples = calllib('AccessAimXrk', 'get_lap_channel_samples_count', iFile, iLap, iChan);
            if iSamples > 0
                pTime = libpointer('doublePtr', nan(1, iSamples));
                pData = libpointer('doublePtr', nan(1, iSamples));
                calllib('AccessAimXrk', 'get_lap_channel_samples', iFile, iLap, iChan, pTime, pData, iSamples);
                data = [pTime.Value(:), pData.Value(:)];
                filename = sprintf('channel_%s_lap%d.csv', chName, iLap+1);
                filename = strrep(filename, ' ', '_');
                
                % Create directories for sort_by_lap structure
                lapDir = fullfile(sortByLapDir, sprintf('lap_%d', iLap+1));
                if ~exist(lapDir, 'dir')
                    mkdir(lapDir);
                end
                
                chanDirByLap = fullfile(lapDir, 'channel');
                if ~exist(chanDirByLap, 'dir')
                    mkdir(chanDirByLap);
                end
                
                % Create directories for sort_by_heading structure
                chanDirByHeading = fullfile(sortByHeadingDir, 'channel');
                if ~exist(chanDirByHeading, 'dir')
                    mkdir(chanDirByHeading);
                end
                
                lapDirByHeading = fullfile(chanDirByHeading, sprintf('lap_%d', iLap+1));
                if ~exist(lapDirByHeading, 'dir')
                    mkdir(lapDirByHeading);
                end
                
                % Save to both directory structures
                fullPathByLap = fullfile(chanDirByLap, filename);
                fullPathByHeading = fullfile(lapDirByHeading, filename);
                
                writecell([{'Time', chName}; num2cell(data)], fullPathByLap);
                writecell([{'Time', chName}; num2cell(data)], fullPathByHeading);
            end
        end
    end

    % Extract GPS channels
    iGpsCount = calllib('AccessAimXrk', 'get_GPS_channels_count', iFile);
    for iLap = 0:iLapCount-1
        for iChan = 0:iGpsCount-1
            chName = calllib('AccessAimXrk', 'get_GPS_channel_name_no_spaces', iFile, iChan);
            chUnit = calllib('AccessAimXrk', 'get_GPS_channel_units', iFile, iChan);
            iSamples = calllib('AccessAimXrk', 'get_lap_GPS_channel_samples_count', iFile, iLap, iChan);
            if iSamples > 0
                pTime = libpointer('doublePtr', nan(1, iSamples));
                pData = libpointer('doublePtr', nan(1, iSamples));
                calllib('AccessAimXrk', 'get_lap_GPS_channel_samples', iFile, iLap, iChan, pTime, pData, iSamples);
                data = [pTime.Value(:), pData.Value(:)];
                filename = sprintf('gps_%s_lap%d.csv', chName, iLap+1);
                filename = strrep(filename, ' ', '_');
                
                % Create directories for sort_by_lap structure
                lapDir = fullfile(sortByLapDir, sprintf('lap_%d', iLap+1));
                if ~exist(lapDir, 'dir')
                    mkdir(lapDir);
                end
                
                gpsDirByLap = fullfile(lapDir, 'gps');
                if ~exist(gpsDirByLap, 'dir')
                    mkdir(gpsDirByLap);
                end
                
                % Create directories for sort_by_heading structure
                gpsDirByHeading = fullfile(sortByHeadingDir, 'gps');
                if ~exist(gpsDirByHeading, 'dir')
                    mkdir(gpsDirByHeading);
                end
                
                lapDirByHeading = fullfile(gpsDirByHeading, sprintf('lap_%d', iLap+1));
                if ~exist(lapDirByHeading, 'dir')
                    mkdir(lapDirByHeading);
                end
                
                % Save to both directory structures
                fullPathByLap = fullfile(gpsDirByLap, filename);
                fullPathByHeading = fullfile(lapDirByHeading, filename);
                
                writecell([{'Time', chName}; num2cell(data)], fullPathByLap);
                writecell([{'Time', chName}; num2cell(data)], fullPathByHeading);
            end
        end
    end

    % Extract raw GPS channels
    iGpsRawCount = calllib('AccessAimXrk', 'get_GPS_raw_channels_count', iFile);
    for iLap = 0:iLapCount-1
        for iChan = 0:iGpsRawCount-1
            chName = calllib('AccessAimXrk', 'get_GPS_raw_channel_name_no_spaces', iFile, iChan);
            chUnit = calllib('AccessAimXrk', 'get_GPS_raw_channel_units', iFile, iChan);
            iSamples = calllib('AccessAimXrk', 'get_lap_GPS_raw_channel_samples_count', iFile, iLap, iChan);
            if iSamples > 0
                pTime = libpointer('doublePtr', nan(1, iSamples));
                pData = libpointer('doublePtr', nan(1, iSamples));
                calllib('AccessAimXrk', 'get_lap_GPS_raw_channel_samples', iFile, iLap, iChan, pTime, pData, iSamples);
                data = [pTime.Value(:), pData.Value(:)];
                filename = sprintf('rawgps_%s_lap%d.csv', chName, iLap+1);
                filename = strrep(filename, ' ', '_');
                
                % Create directories for sort_by_lap structure
                lapDir = fullfile(sortByLapDir, sprintf('lap_%d', iLap+1));
                if ~exist(lapDir, 'dir')
                    mkdir(lapDir);
                end
                
                rawgpsDirByLap = fullfile(lapDir, 'rawgps');
                if ~exist(rawgpsDirByLap, 'dir')
                    mkdir(rawgpsDirByLap);
                end
                
                % Create directories for sort_by_heading structure
                rawgpsDirByHeading = fullfile(sortByHeadingDir, 'rawgps');
                if ~exist(rawgpsDirByHeading, 'dir')
                    mkdir(rawgpsDirByHeading);
                end
                
                lapDirByHeading = fullfile(rawgpsDirByHeading, sprintf('lap_%d', iLap+1));
                if ~exist(lapDirByHeading, 'dir')
                    mkdir(lapDirByHeading);
                end
                
                % Save to both directory structures
                fullPathByLap = fullfile(rawgpsDirByLap, filename);
                fullPathByHeading = fullfile(lapDirByHeading, filename);
                
                writecell([{'Time', chName}; num2cell(data)], fullPathByLap);
                writecell([{'Time', chName}; num2cell(data)], fullPathByHeading);
            end
        end
    end

    % Close file
    calllib('AccessAimXrk', 'close_file_i', iFile);
    unloadlibrary('AccessAimXrk');

    fprintf('✅ All channel data exported to data directory (sort_by_lap and sort_by_heading) for file: %s\n', sFilename);
end
