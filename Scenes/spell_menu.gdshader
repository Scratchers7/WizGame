shader_type canvas_item;
uniform sampler2D mask_texture;

void fragment() {
    // Sample the color of the current pixel of the main object
    vec4 color = texture(TEXTURE, UV);
    // Sample the color/alpha from the mask texture at the same UV
    vec4 mask_color = texture(mask_texture, SCREEN_UV); // Use SCREEN_UV for screen-space effects

    // Multiply the main color's alpha by the mask's alpha to apply the mask
    color.a *= mask_color.a;

    COLOR = color;
}
