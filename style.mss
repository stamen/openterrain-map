.hillshade_darkmatter {
  /* stop 1: shadow, stop 2: flat, stop 3: highlight */
  raster-colorizer-stops:
    stop(0, rgba(60,75,80,0.4))
    stop(181, transparent)
    stop(255, rgba(220,255,100,0.2));
}
.hillshade_positron {
  raster-colorizer-stops:
    stop(0, black)
    stop(181, transparent)
    stop(255, white);
}
.hillshade_positron_stacked {
  raster-colorizer-stops:
    stop(0, black)
    stop(181, gray)
    stop(255, white);
}
