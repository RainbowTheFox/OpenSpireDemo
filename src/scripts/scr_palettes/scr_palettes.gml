global.Palette_PatternUniform = shader_get_uniform(shd_pal_swapper, "pattern_enabled");

function palette_as_player(argument0 = sprite_index, argument1 = image_index, argument2 = global.playerCharacter, argument3 = global.PlayerPaletteIndex, argument4 = 0, argument5 = 0, argument6 = 1, argument7 = 1)
{
	if (!sprite_exists(argument0))
		exit;
	
	var pal_spr = global.CharacterPalette[argument2].sprite;
	var pal_info = global.CharacterPalette[argument2].palettes[argument3];
	pal_swap_set(pal_spr, argument3, false);
	
	if (!is_undefined(pal_info.palTexture) && sprite_exists(pal_info.palTexture))
		pattern_setup(pal_info.palTexture, global.CharacterPalette[argument2].patternColors, argument0, argument1, argument4, argument5, argument6, argument7);
	else
		shader_set_uniform_i(global.Palette_PatternUniform, false);
}

function draw_player_sprite(argument0, argument1, argument2, argument3, argument4 = global.playerCharacter, argument5 = global.PlayerPaletteIndex)
{
	draw_player_sprite_ext(argument0, argument1, argument2, argument3, 1, 1, 0, 16777215, 1, argument4, argument5);
}

function draw_player_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9 = global.playerCharacter, argument10 = global.PlayerPaletteIndex)
{
	if (!sprite_exists(argument0))
		exit;
	
	palette_as_player(argument0, argument1, argument9, argument10, argument2, argument3, argument4, argument5);
	draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
	pal_swap_reset();
}

function pattern_setup(argument0, argument1 = [1, 2], argument2 = sprite_index, argument3 = image_index, argument4 = 0, argument5 = 0, argument6 = 1, argument7 = 1)
{
	var shader = shd_pal_swapper;
	var u_color_array = shader_get_uniform(shader, "u_color_array");
	shader_set_uniform_f_array(u_color_array, argument1);
	var u_dest_texelDimension = shader_get_uniform(shader, "u_dest_texelDimension");
	var spr_dest_texture = sprite_get_texture(argument0, 0);
	shader_set_uniform_f(u_dest_texelDimension, texture_get_texel_width(spr_dest_texture), texture_get_texel_height(spr_dest_texture));
	var u_loop_texture = shader_get_sampler_index(shader, "u_loop_texture");
	texture_set_stage(u_loop_texture, spr_dest_texture);
	var u_src_spriteDimension = shader_get_uniform(shader, "u_src_spriteDimension");
	var spr_width = sprite_get_width(argument0);
	var spr_height = sprite_get_height(argument0);
	shader_set_uniform_f(u_src_spriteDimension, argument4 - (spr_width / 2), argument5 - (spr_height / 2), spr_width, spr_height);
	shader_set_uniform_i(global.Palette_PatternUniform, true);
}
