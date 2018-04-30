function [ y ] = my_hardlims( n )
%MY_HARDLIMS symmertric hard limit function
    y = ((n >= 0) - 1/2) * 2;
end

