
# circular mean: https://stackoverflow.com/a/491784/6744051
y=atan2(sum(sin(pi*y/180)),sum(cos(pi*y/180)))*180/pi

# circular stdev: https://stackoverflow.com/a/55616828/6744051
y = sqrt(
	-2 * ln (
		sqrt(
			sum(
				sin(
					pi*y/180
				)
			)^2 + sum(
				cos(
					pi*y/180)
			)^2
		)/25001
	)
)

# how to interpret circular sd
# https://stats.stackexchange.com/questions/185361/how-do-i-interpret-the-standard-deviation-of-a-directional-dataset

# circular standard error is not just circular standard deviation divided by the square root of the number of observations.
# https://stats.stackexchange.com/questions/449671/how-to-calculate-the-standard-error-of-the-mean-for-circular-data

