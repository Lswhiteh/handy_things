insert_size = 100
bins = np.array([-10000., -5000., -1000., -500., -250., -150., -100., -50., 0., 50., 100., 150., 250., 500., 1000., 5000., 10000])
placed_bins = np.digitize(insert_size, bins=bins)
ohe_bins = np.eye(len(bins)+1)[placed_bins]
