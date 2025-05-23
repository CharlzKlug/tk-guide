#!/bin/sh
# \
    exec wish "$0" "$@"

# Create a root frame with a black background, and pack it.
frame .root -background black
pack .root
# Create a frame with two labels to allocate 2 labels worth of
# vertical space.
# Note that the twoLabels frame shows through where the top
# label doesn't fill.
frame .root.twoLabels -background gray50
label .root.twoLabels.upperLabel -text "twoLabels no fill top"
label .root.twoLabels.lowerLabel -text "twoLabels no fill lower"
pack .root.twoLabels -side left
pack .root.twoLabels.upperLabel -side top
pack .root.twoLabels.lowerLabel -side bottom

# Create a frame and label with no fill or expand options used.
# Note that the .nofill frame is completely covered by the
# label, and the root frame shows at the top and bottom
frame .root.nofill -background gray50
label .root.nofill.label -text "nofill, noexpand"
pack .root.nofill -side left
pack .root.nofill.label

# Create a frame and label pair with the -fill option used when
# the frame is packed.
# In this case, the frame fills in the Y dimension to use all
# available space, and the label is packed at the top of
# the frame. The .fill frame shows through below the label.
frame .root.fill\_frame -background gray50
label .root.fill\_frame.label -text "fill frame"
pack .root.fill\_frame -side left -fill y
pack .root.fill\_frame.label

# Create a label that can fill, while the frame holding it will not.
# In this case, the frame is set to the size required to hold
# the widget, and the widget uses all that space.
frame .root.fill\_label -background gray50
label .root.fill\_label.label -text "fill label"
pack .root.fill\_label -side left
pack .root.fill\_label.label -fill y

# Allow both the frame and widget to fill.
# The frame will fill the available space,
# but the label will not expand to fill the frame.
frame .root.fillBoth -background gray50
label .root.fillBoth.label -text "fill label and frame"
pack .root.fillBoth -side left -fill y
pack .root.fillBoth.label -fill y

# Allow both the frame and widget to expand and fill.
# The -expand option allows the widget to expand into extra
# space.
# The -fill option allows the widget to fill the available
# space.
frame .root.expandFill -background gray50
label .root.expandFill.label -text "expand and fill label and frame"
pack .root.expandFill -side left -fill y -expand y
pack .root.expandFill.label -fill y -expand y
