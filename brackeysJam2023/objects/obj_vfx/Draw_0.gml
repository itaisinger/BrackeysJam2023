var _prog = image_index/image_number;
image_alpha = _prog < 0.5 ? (fade_in ? _prog*3 : 1) : (fade_out ? (1-_prog)*3: 1);
draw_self();