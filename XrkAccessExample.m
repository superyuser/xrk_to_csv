function AutoExportXrkData()
    % Load DLL
    dllPath = fullfile(pwd, 'MatLabXRK-2022-64-ReleaseU.dll');
    if ~libisloaded('AccessAimXrk')
        loadlibrary(dllPath, @AccessAimXrk, 'alias', 'AccessAimXrk');
    end
    
    % Create data directory if it doesn't exist
    dataDir = fullfile(pwd, 'data');
    if ~exist(dataDir, 'dir')
        mkdir(dataDir);
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
                
                % Create lap and channel directories if they don't exist
                lapDir = fullfile(dataDir, sprintf('lap_%d', iLap+1));
                if ~exist(lapDir, 'dir')
                    mkdir(lapDir);
                end
                
                chanDir = fullfile(lapDir, 'channel');
                if ~exist(chanDir, 'dir')
                    mkdir(chanDir);
                end
                
                % Save to data/lap_X/channel/ directory
                fullPath = fullfile(chanDir, filename);
                writecell([{'Time', chName}; num2cell(data)], fullPath);
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
                
                % Create lap and GPS directories if they don't exist
                lapDir = fullfile(dataDir, sprintf('lap_%d', iLap+1));
                if ~exist(lapDir, 'dir')
                    mkdir(lapDir);
                end
                
                gpsDir = fullfile(lapDir, 'gps');
                if ~exist(gpsDir, 'dir')
                    mkdir(gpsDir);
                end
                
                % Save to data/lap_X/gps/ directory
                fullPath = fullfile(gpsDir, filename);
                writecell([{'Time', chName}; num2cell(data)], fullPath);
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
                
                % Create lap and rawgps directories if they don't exist
                lapDir = fullfile(dataDir, sprintf('lap_%d', iLap+1));
                if ~exist(lapDir, 'dir')
                    mkdir(lapDir);
                end
                
                rawgpsDir = fullfile(lapDir, 'rawgps');
                if ~exist(rawgpsDir, 'dir')
                    mkdir(rawgpsDir);
                end
                
                % Save to data/lap_X/rawgps/ directory
                fullPath = fullfile(rawgpsDir, filename);
                writecell([{'Time', chName}; num2cell(data)], fullPath);
            end
        end
    end

    % Close file
    calllib('AccessAimXrk', 'close_file_i', iFile);
    unloadlibrary('AccessAimXrk');

    fprintf('✅ All channel data exported to data directory for file: %s\n', sFilename);
end
