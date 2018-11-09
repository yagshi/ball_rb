def setup
  size(640, 480)
  $x, $y = 320, 50
  $vx, $vy = 2, 0
  $mx, $my = 320, 400
  $mvx, $mvy = 0, 0
  $c = 100
end

def draw
  # draw objects
  background(255, 255, 255)
  stroke_weight(5)
  stroke(0, 0, 0)
  fill($c, 255 - $c, 128 + $c / 2)
  ellipse($x, $y, 50, 50)
  fill(0, 255, 200)
  ellipse($mx, $my, 50, 50)
  # move ball
  $x = $x + $vx
  $y = $y + $vy
  # move player
  $mx = ($mx + $mvx) % 640
  $my = $my + $mvy

  # collision check
  dx = ($x + $vx) - ($mx + $mvx)
  dy = ($y + $vy) - ($my + $mvy)
  if dx * dx + dy * dy < 50 * 50
    k = (dx * $vx + dy * $vy - dx * $mvx - dy * $mvy) /
        (dx * dx + dy * dy)
    $mvx = $mvx + k * dx
    #$mvy = $mvy + k * dy
    $vx  = $vx  - k * dx
    $vy  = -$vy
  end

  if $y > 450
    $c = rand(256)
    $vy = -$vy
  else
    $vy = $vy + 0.1
  end
  $vx = -$vx if $x > 620 || $x < 20
end

def key_pressed
  if key_code == 37
    $mvx = -5
  end
  if key_code == 39
    $mvx = 5
  end
end

def key_released
  $mvx = 0
end
