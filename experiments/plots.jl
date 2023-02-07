#using Plots

using PlotlyJS, DataFrames

df = DataFrame(
    x=[1, 3, 2, 4],
    y=[1, 2, 3, 4],
)
p1 = plot(df, x=:x, y=:y, Layout(title="Unsorted Input"))


# Define the data to be plotted
# r = [0, -1, 2, -3]
# theta = [0, pi/2, pi, 3*pi/2]
#
# r = [0, -1]
# theta = [0, pi/2]
#
# # Create a polar chart using the PolarAxes function
# plot(theta, r, proj=:polar)
savefig(p1, "plot.png")
