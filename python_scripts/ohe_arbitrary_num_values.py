import numpy as np

def one_hot_arbitrary_bins(value_to_bin=104):
    """Creates OHE numpy array using an arbitrary array of binning thresholds.

    Args:
        value_to_bin (int, optional): Number to convert to OHE array. Defaults to 104.
    """
    bins = np.array([-10000., -5000., -1000., -500.,
                     -250., -150., -100., -50., 0., 
                     50., 100., 150., 250., 500., 
                     1000., 5000., 10000.])

    placed_bins = np.digitize(value_to_bin, bins=bins)
    ohe_bins = np.eye(len(bins)+1)[placed_bins]
    print(ohe_bins)
