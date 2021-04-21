import numpy as np
# Created by Yusheng Huang in April 2021.

def motif_encoder_core(series, index_left, index_right, motif_array):
    # input single series (shape=(1,length)) (0-based)
    # return the motif of the series
    series_length = index_right - index_left + 1
    # motif_array = np.zeros(shape=(1, series_length))
    index_max = index_left+np.argmax(series[index_left:index_right+1])  # the location of the maximum time point
    if series_length >= 2:  # DC method https://doi.org/10.1063/1.4927835
        # check the visibility of the maximum time point
        # check the visibility on the left side
        min_slope = float("inf")
        for ii in range(index_max - 1, index_left - 1, -1):
            tmp_slope_left = (series[index_max] - series[ii]) / (index_max - ii)
            if tmp_slope_left <= min_slope:  # visibility exists
                min_slope = tmp_slope_left
                if tmp_slope_left > 0:  # index_max sees ii
                    motif_array[index_max] += 1
                elif tmp_slope_left < 0:  # ii sees index_max
                    motif_array[ii] += 1
                else:  # they see each other
                    motif_array[index_max] += 1
                    motif_array[ii] += 1
        max_slope = float("-inf")
        for jj in range(index_max + 1, index_right+1):
            tmp_slope_right = (series[jj] - series[index_max]) / (jj - index_max)
            if tmp_slope_right >= max_slope:  # visibility exists
                max_slope = tmp_slope_right
                if tmp_slope_right < 0:  # index_max sees jj
                    motif_array[index_max] += 1
                elif tmp_slope_right > 0:  # jj sees index_max
                    motif_array[jj] += 1
                else:  # they see each other
                    motif_array[index_max] += 1
                    motif_array[jj] += 1
        #  recursion or " divide and concur " part
        if series_length > 2:
            if index_max == index_left:
                motif_array_out = motif_encoder_core(series, index_max + 1, index_right, motif_array)
            elif index_max == index_right:
                motif_array_out = motif_encoder_core(series, index_left, index_max - 1, motif_array)
            else:
                motif_array_out = motif_encoder_core(series, index_left, index_max - 1, motif_array)
                motif_array_out = motif_encoder_core(series, index_max + 1, index_right, motif_array_out)
        else:
            motif_array_out = motif_array
    else:
        motif_array_out = motif_array
    return motif_array_out


def motif_encoder(series, motif_size):
    # Encode the motif of series.
    # Example series is a ndarray in shape (X,Y,Z)
    # We want to encode the motif of the series in the last axis.
    size_0 = series.shape[0]  # total sample batch
    size_1 = series.shape[1]  # features
    size_2 = series.shape[2]  # time steps
    series_motif = np.zeros(shape=(size_0, size_1, (size_2 - motif_size + 1) * motif_size), dtype=int)
    for ii in range(size_0):
        print(ii)
        for iijj in range(size_1):
            for iijjkk in range(size_2 - motif_size):
                series_motif[ii, iijj, iijjkk * motif_size:(iijjkk+1) * motif_size] \
                    = motif_encoder_core(series[ii, iijj, iijjkk:iijjkk + motif_size], 0,
                                         motif_size-1,
                                         series_motif[ii, iijj, iijjkk * motif_size:(iijjkk+1) * motif_size])
    return series_motif